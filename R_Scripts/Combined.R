library(caret)
library(dplyr)
library(RMySQL)
library(parallel)
library(doParallel)
library(randomForest)

pw <- {
  'northwestern'
}

con <- dbConnect(MySQL(),
                 user = 'teamfour',
                 password = pw,
                 #host = 'healthcare.cgd8ab0fshso.us-east-2.rds.amazonaws.com',
                 host = 'nu-predict-498-team-4.cgd8ab0fshso.us-east-2.rds.amazonaws.com',
                 dbname='health_care')

query = "SELECT * FROM tmp_survey_standard WHERE max_safer_score > 0"

mydata <- dbGetQuery(conn = con, query)

# Read file if no connection available
#mydata <- read.csv('/Users/ericgero/Desktop/query_result.csv')

# Set up data
use_data <- mydata %>%
  mutate(Hospital_Type = factor(Hospital_Type)) %>%
  mutate(Standard_Label = factor(trimws(Standard_Label))) %>%
  mutate(Program = factor(Program)) %>%
  mutate(Survey_Year = factor(Survey_Year)) %>%
  mutate(System_Affiliation = factor(System_Affiliation)) %>%
  select(Hospital_Type 
         ,Standard_Label 
         ,max_safer_score 
         ,Number_of_Program_Sites 
         ,Total_Surveyor_Days 
         ,Number_of_DSC_Certifications
         ,Count_NonCompliant_Standards 
         ,Count_NonCompliant_EPs 
         ,Number_of_Surveyor_Class_Types
         ,Number_of_Surveyors 
         ,System_Affiliation 
         ,Survey_Year 
         ,Program
         )

# Create train and test sets
trainIndex <- createDataPartition(use_data$max_safer_score, p = .7, list = FALSE)
trainData <- use_data[trainIndex,]
testData  <- use_data[-trainIndex,]

###############################################################################################
## Gradient Boost Models - max safer score regression
###############################################################################################

# Set up the traincontrol
fitControl <- trainControl(method = "repeatedcv",
                           number = 4,
                           repeats = 1,
                           verboseIter = TRUE)

# Train the model
set.seed(1234)
gbm_mss <- train(max_safer_score ~ ., 
                data = trainData, 
                method = "gbm", 
                trControl = fitControl,
                verbose = FALSE)

#Get RMSE, Adjusted RSquare and MAE
gbm_mss$bestTune
gbm_mss$

# Save model for later
saveRDS(gbm_mss, "gbm_mss.rds")
gbm_mss <- readRDS("gbm_mss.rds")

gbm_pred_mss <- predict(gbm_mss, testData, n.trees = 200, type = "raw")

###############################################################################################
## Gradient Boost Models - max safer score regression - Tuning
###############################################################################################

gbm_mss_grid <-  expand.grid(interaction.depth = c(1, 5, 9), 
                        n.trees = (1:30)*50, 
                        shrinkage = 0.1,
                        n.minobsinnode = 20)

nrow(gbm_mss_grid)

set.seed(825)
gbm_mss_tune <- train(max_safer_score ~ ., 
                 data = trainData, 
                 method = "gbm", 
                 trControl = fitControl, 
                 verbose = FALSE, 
                 ## Now specify the exact models 
                 ## to evaluate:
                 tuneGrid = gbm_mss_grid)

# Save model for later
saveRDS(gbm_mss_tune, "gbm_mss_tune.rds")
gbm_mss_tune <- readRDS("gbm_mss_tune.rds")

gbm_pred_tune <- predict(gbmFit2, testData, type = "raw", na.action = na.omit)
RMSE_tune <- sqrt(mean((testData$max_safer_score - gbmPred_tune)^2))

gbm_pred_all <- predict(gbmFit, use_data, type = "raw")
RMSE_all <- sqrt(mean((use_data$max_safer_score - gbmPred_all)^2))

see_data <- mydata %>% 
  mutate(predicted = gbmPred_all) %>%
  mutate(difference = max_safer_score - predicted) %>%
  mutate(risk = cut(predicted, breaks = c(-Inf, 4, 8, 9, Inf), labels = c("Low", "Medim", "High", "Life Threat"))) %>%
  select(Hospital_Type, Standard_Label, max_safer_score, predicted, difference, risk)

# Save results to database
dbWriteTable(conn = con, "app_Predicted_SAFER", see_data)

summ <- see_data %>%
  group_by(Hospital_Type) %>%
  summarize(diff_mean = mean(difference))

###############################################################################################
## Gradient Boost Models - max safer score classification
###############################################################################################

use_dataf <- mydata %>%
  mutate(Hospital_Type = factor(Hospital_Type)) %>%
  mutate(Standard_Label = factor(trimws(Standard_Label))) %>%
  mutate(Program = factor(Program)) %>%
  mutate(Survey_Year = factor(Survey_Year)) %>%
  mutate(System_Affiliation = factor(System_Affiliation)) %>%
  mutate(max_safer_score = factor(max_safer_score)) %>%
  select(Hospital_Type 
         ,Standard_Label 
         ,max_safer_score 
         ,Number_of_Program_Sites 
         ,Total_Surveyor_Days 
         ,Number_of_DSC_Certifications
         ,Count_NonCompliant_Standards 
         ,Count_NonCompliant_EPs 
         ,Number_of_Surveyor_Class_Types
         ,Number_of_Surveyors 
         ,System_Affiliation 
         ,Survey_Year 
         ,Program
  )

trainIndex <- createDataPartition(use_dataf$Hospital_Type, p = .7, list = FALSE)
trainData <- use_dataf[trainIndex,]
testData  <- use_dataf[-trainIndex,]

fitControlf <- trainControl(method = "cv"
                           ,number = 4
                           ,returnResamp = 'none'
                           ,summaryFunction = multiClassSummary
                           #,classProbs = TRUE
                           ,verboseIter = TRUE)
set.seed(1234)
gbm_mss_fact <- train(max_safer_score ~ . 
                ,data = trainData
                ,method = "gbm"
                ,trControl = fitControlf
                ,verbose = FALSE)


# Save model for later
saveRDS(gbm_mss_fact, "gbm_mss_fact.rds")
gbm_mss_fact <- readRDS("gbm_mss_fact.rds")

gbm_pred_mss_fact <- predict(gbm_mss_fact, testData, type = 'raw')

confusionMatrix(gbm_pred_mss_fact, testData$max_safer_score)

###############################################################################################
## Gradient Boost Models - max safer score classification - results not so good ##
###############################################################################################

library(gbm)
gbm_mss_fact2 <- gbm(max_safer_score ~ .
                     ,data = trainData
                     ,distribution = 'multinomial'
                     ,n.trees = 200
                     ,interaction.depth = 4
                     ,shrinkage = 0.005)

# Save model for later
saveRDS(gbm_mss_fact2, "gbm_mss_fact2.rds")
gbm_mss_fact2 <- readRDS("gbm_mss_fact2.rds")

gbm_pred_mss_fact2 <- predict(gbm_mss_fact2, n.trees = 200, newdata = testData, type = "response")
gbm_pred_mss_fact2<- apply(gbm_pred_mss_fact2, 1, which.max)

confusionMatrix(gbm_pred_mss_fact2, testData$max_safer_score)

###############################################################################################
## Linear Model - max safer score classification - results not so good ##
###############################################################################################

# Set up data
use_data <- mydata %>%
        mutate(Hospital_Type = factor(Hospital_Type)) %>%
        mutate(Standard_Label = factor(trimws(Standard_Label))) %>%
        mutate(Program = factor(Program)) %>%
        mutate(Survey_Year = factor(Survey_Year)) %>%
        mutate(System_Affiliation = factor(System_Affiliation)) %>%
        select(Hospital_Type 
               ,Standard_Label 
               ,max_safer_score 
               ,Number_of_Program_Sites 
               ,Total_Surveyor_Days 
               ,Number_of_DSC_Certifications
               ,Count_NonCompliant_Standards 
               ,Count_NonCompliant_EPs 
               ,Number_of_Surveyor_Class_Types
               ,Number_of_Surveyors 
               ,System_Affiliation 
               ,Survey_Year 
               ,Program
        )

# Create train and test sets
trainIndex <- createDataPartition(use_data$max_safer_score, p = .7, list = FALSE)
trainData <- use_data[trainIndex,]
testData  <- use_data[-trainIndex,]

fitLM <- lm(max_safer_score ~., data = trainData)
summary(fitLM)

predLM <- predict(fitLM, newdata = trainData$max_safer_score, interval="confidence")

# Calculate RMSE
RSS <- c(crossprod(fitLM$residuals))
MSE <- RSS / length(fitLM$residuals)
RMSE_lm <- sqrt(MSE)

# Save model for later
saveRDS(fitLM, "fitLM.rds")
fitLM <- readRDS("fitLM.rds")

###############################################################################################
## Random Forest Model - Hospital Type classification
###############################################################################################

# Enable parallel processing
cluster <- makeCluster(detectCores() - 1) # convention to leave 1 core for OS
registerDoParallel(cluster)

rf_data <- mydata %>%
  mutate(Hospital_Type = factor(Hospital_Type)) %>%
  mutate(Standard_Label = factor(trimws(Standard_Label))) %>%
  mutate(Program = factor(Program)) %>%
  mutate(Survey_Year = factor(Survey_Year)) %>%
  mutate(System_Affiliation = factor(System_Affiliation)) %>%
  #mutate(max_safer_score = factor(max_safer_score)) %>%
  select(Hospital_Type
         ,Number_of_Program_Sites
         ,Total_Surveyor_Days
         ,Number_of_DSC_Certifications
         ,Count_NonCompliant_Standards
         ,Count_NonCompliant_EPs
         ,Number_of_Surveyor_Class_Types 
         ,Number_of_Surveyors
         ,System_Affiliation
         ,Survey_Year
         ,Program
  )

# Create training and test partitions
trainIndex <- createDataPartition(rf_data$Hospital_Type, p = .7, list = FALSE)
trainData <- rf_data[trainIndex,]
testData  <- rf_data[-trainIndex,]

set.seed(123)
# set the fit control for cross validation
fitControl = trainControl(method = "repeatedcv", 
                          number = 10, 
                          repeats = 3,
                          allowParallel = TRUE)

random_forest_ht1 = train(Hospital_Type ~ ., 
                         data = trainData, 
                         method = "rf", 
                         trControl = fitControl, 
                         importance = TRUE, 
                         metric = "Kappa")

# Save model for later
saveRDS(random_forest_ht1, "random_forest_ht1.rds")
random_forest_ht1 <- readRDS("random_forest_ht1.rds")

random_forest_ht
random_forest_ht$finalModel
plot(random_forest_ht$finalModel, main = "Random Forest")
varImpPlot(random_forest_ht1$finalModel, n.var = 10, main = "Random Forest")
imp <- as.data.frame(random_forest_ht1$finalModel$importance)

ggplot(imp, aes(x = reorder(rownames(imp), MeanDecreaseAccuracy), MeanDecreaseAccuracy)) +
        geom_bar(stat = "identity", aes(fill = rownames(imp))) + 
        coord_flip() + 
        guides(fill=FALSE) + 
        ggtitle("Random Forest Variable Importance - Hospital Type") +
        xlab("Variables") +
        ylab("")


# Release the clusters
stopCluster(cluster)
registerDoSEQ()

predictions <- predict(random_forest_ht, testData)
confusionMatrix(predictions, testData$Hospital_Type)

###############################################################################################
## Gradient Boost Models - Hospital Type classification
###############################################################################################

gbm_fit_ht <- gbm(
  formula           = Hospital_Type ~ .,
  distribution      = 'multinomial',
  data              = trainData,
  n.trees           = 200,
  interaction.depth = 2,
  n.minobsinnode    = 10,
  shrinkage         = 0.01,
  bag.fraction      = 0.5,
  cv.folds          = 0,
  # verbose         = FALSE
  n.cores           = 5
)


# Save model for later
saveRDS(gbm_fit_ht, "gbm_fit_ht.rds")
gbm_fit_ht <- readRDS("gbm_fit_ht.rds")

gbm_fit_ht

gbm_pred_ht <- predict(gbm_fit_ht, testData, n.trees = 200, type = 'response')
gbm_pred_ht <- apply(gbm_pred_ht, 1, which.max)

gbm_pred_ht <- as.factor(gbm_pred_ht)
gbm_pred_ht <- factor(gbm_pred_ht, 
                      levels = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19), 
                      labels = levels(testData$Hospital_Type))

confusionMatrix(gbm_pred_ht, testData$Hospital_Type)

###############################################################################################
## J48 - Hospital Type classification
###############################################################################################

library(RWeka)
library(partykit)

use_data <- mydata %>%
        mutate(Hospital_Type = factor(Hospital_Type)) %>%
        mutate(Standard_Label = factor(trimws(Standard_Label))) %>%
        mutate(Program = factor(Program)) %>%
        mutate(Survey_Year = factor(Survey_Year)) %>%
        mutate(System_Affiliation = factor(System_Affiliation)) %>%
        mutate(max_safer_score = factor(max_safer_score)) %>%
        select(Hospital_Type 
               ,Standard_Label 
               ,max_safer_score 
               ,Number_of_Program_Sites 
               ,Total_Surveyor_Days 
               ,Number_of_DSC_Certifications
               ,Count_NonCompliant_Standards 
               ,Count_NonCompliant_EPs 
               ,Number_of_Surveyor_Class_Types
               ,Number_of_Surveyors 
               ,System_Affiliation 
               ,Survey_Year 
               ,Program
        )

trainIndex <- createDataPartition(use_dataf$Hospital_Type, p = .7, list = FALSE)
trainData <- use_data[trainIndex,]
testData  <- use_data[-trainIndex,]

j48 <- J48(max_safer_score ~., data = trainData)
j48_pred <- predict(j48, testData)

confusionMatrix(j48_pred, testData$max_safer_score)

###############################################################################################
## M5P - max safer score regression
###############################################################################################

use_data <- mydata %>%
        mutate(Hospital_Type = factor(Hospital_Type)) %>%
        mutate(Standard_Label = factor(trimws(Standard_Label))) %>%
        mutate(Program = factor(Program)) %>%
        mutate(Survey_Year = factor(Survey_Year)) %>%
        mutate(System_Affiliation = factor(System_Affiliation)) %>%
        select(Hospital_Type 
               ,Standard_Label 
               ,max_safer_score 
               ,Number_of_Program_Sites 
               ,Total_Surveyor_Days 
               ,Number_of_DSC_Certifications
               ,Count_NonCompliant_Standards 
               ,Count_NonCompliant_EPs 
               ,Number_of_Surveyor_Class_Types
               ,Number_of_Surveyors 
               ,System_Affiliation 
               ,Survey_Year 
               ,Program
        )

trainIndex <- createDataPartition(use_dataf$max_safer_score, p = .7, list = FALSE)
trainData <- use_data[trainIndex,]
testData  <- use_data[-trainIndex,]

m5p <- M5P(max_safer_score ~.,data = trainData)
m5p_pred <- predict(m5p, testData)
RMSE_m5p <- sqrt(mean((testData$max_safer_score - m5p_pred)^2))


# Drop database connections
lapply(dbListConnections( dbDriver( drv = "MySQL")), dbDisconnect)

###############################################################################################
## Random Forest - max safer score regression
###############################################################################################

# Enable parallel processing
cluster <- makeCluster(detectCores() - 1) # convention to leave 1 core for OS
registerDoParallel(cluster)

rf_data <- mydata %>%
        mutate(Hospital_Type = factor(Hospital_Type)) %>%
        mutate(Standard_Label = factor(trimws(Standard_Label))) %>%
        mutate(Program = factor(Program)) %>%
        mutate(Survey_Year = factor(Survey_Year)) %>%
        mutate(System_Affiliation = factor(System_Affiliation)) %>%
        select(Hospital_Type
               ,Number_of_Program_Sites
               ,Total_Surveyor_Days
               ,Number_of_DSC_Certifications
               ,Count_NonCompliant_Standards
               ,Count_NonCompliant_EPs
               ,Number_of_Surveyor_Class_Types 
               ,Number_of_Surveyors
               ,System_Affiliation
               ,Survey_Year
               ,Program
        )

# Create training and test partitions
trainIndex <- createDataPartition(rf_data$Hospital_Type, p = .7, list = FALSE)
trainData <- rf_data[trainIndex,]
testData  <- rf_data[-trainIndex,]

set.seed(123)
# set the fit control for cross validation
fitControl = trainControl(method = "repeatedcv", 
                          number = 10, 
                          repeats = 3,
                          allowParallel = TRUE)

random_forest_ht1 = train(Hospital_Type ~ ., 
                          data = trainData, 
                          method = "rf", 
                          trControl = fitControl, 
                          importance = TRUE,
                          metric = "Kappa")

# Save model for later
saveRDS(random_forest_ht1, "random_forest_ht1.rds")
random_forest_ht1 <- readRDS("random_forest_ht1.rds")

random_forest_ht
random_forest_ht$finalModel
plot(random_forest_ht$finalModel, main = "Random Forest")
varImpPlot(random_forest_ht1$finalModel, n.var = 10, main = "Random Forest")
imp <- as.data.frame(random_forest_ht1$finalModel$importance)

ggplot(imp, aes(x = reorder(rownames(imp[1:10]), MeanDecreaseAccuracy), MeanDecreaseAccuracy)) +
        geom_bar(stat = "identity", aes(fill = rownames(imp))) + 
        coord_flip() + 
        guides(fill=FALSE) + 
        ggtitle("Random Forest Variable Importance - Hospital Type") +
        xlab("Variables") +
        ylab("")


# Release the clusters
stopCluster(cluster)
registerDoSEQ()

predictions <- predict(random_forest_ht, testData)
confusionMatrix(predictions, testData$Hospital_Type)
