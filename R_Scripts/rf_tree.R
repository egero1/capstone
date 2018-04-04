library(parallel)
library(doParallel)
library(caret)
library(randomForest)
library(dplyr)
library(RMySQL)

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



cluster <- makeCluster(detectCores() - 1) # convention to leave 1 core for OS
registerDoParallel(cluster)

#mydata <- read.csv('/Users/ericgero/Desktop/junk/query_result.csv')
use_data <- mydata %>%
        mutate(Hospital_Type = factor(Hospital_Type)) %>%
        mutate(Standard_Label = factor(Standard_Label)) %>%
        mutate(Program = factor(Program)) %>%
        mutate(Survey_Year = factor(Survey_Year)) %>%
        mutate(System_Affiliation = factor(System_Affiliation)) %>%
        select(Hospital_Type, Standard_Label, max_safer_score, Number_of_Program_Sites, Total_Surveyor_Days, Number_of_DSC_Certifications,
               Count_NonCompliant_Standards, Count_NonCompliant_EPs, Number_of_Surveyor_Class_Types,
               Number_of_Surveyors, System_Affiliation, Survey_Year, Program)

use_data <- mydata %>%
        mutate(Hospital_Type = factor(Hospital_Type)) %>%
        mutate(Standard_Label = factor(Standard_Label)) %>%
        select(Hospital_Type, Standard_Label)


trainIndex <- createDataPartition(use_data$Hospital_Type, p = .7, list = FALSE)
trainData <- use_data[trainIndex,]
testData  <- use_data[-trainIndex,]

set.seed(123)
# set the fit control for cross validation
fitControl = trainControl(method = "repeatedcv", 
                          number = 10, 
                          repeats = 3,
                          allowParallel = TRUE)

random_forest_ht = caret::train(Hospital_Type ~ ., 
                      data = trainData, 
                      method = "rf", 
                      trControl = fitControl, 
                      importance = TRUE, 
                      metric = "Kappa")

# Save model for later use
saveRDS(random_forest_ht, "random_forest_ht.rds")
random_forest_ht <- readRDS("random_forest_ht.rds")

varImp(random_forest_ht$finalModel)

imp <- as.data.frame(random_forest_ht$finalModel$importance)
imp <- imp[order(-imp$MeanDecreaseAccuracy),]
imp <- imp[1:10,]
ggplot(imp, aes(x = reorder(trimws(rownames(imp)), MeanDecreaseAccuracy), MeanDecreaseAccuracy)) +
        geom_bar(stat = "identity", aes(fill = rownames(imp))) + 
        coord_flip() + 
        guides(fill=FALSE) + 
        ggtitle("Random Forest Variable Importance - Hospital Type") +
        xlab("Variables") +
        ylab("")

saveRDS(random_forest_ht, "rf_standard_only.rds")
random_forest_ht <- readRDS("rf_standard_only.rds")
confusionMatrix(random_forest_ht)

random_forest_ht
random_forest_ht$finalModel
plot(random_forest_ht$finalModel, main = "Random Forest")

# Predict on training set
rf_pred_train <- predict(random_forest_ht, trainData)
rf_cm_train <- confusionMatrix(rf_pred_train, trainData$Hospital_Type)

# Predict on test set
rf_pred_test <- predict(random_forest_ht, testData)
rf_cm_test <- confusionMatrix(rf_pred_test, testData$Hospital_Type)

# Predict on full data set
rf_pred_all <- predict(random_forest_ht, use_data)
rf_cm_all <- confusionMatrix(rf_pred_all, use_data$Hospital_Type)

varImp(random_forest_ht$finalModel)

# Not working well
varImpPlot(random_forest_ht$finalModel)

# Release resources for parallel processing
stopCluster(cluster)
registerDoSEQ()

# Review the predicted hospitals and compare to actual
Predicted_Hospital <- mydata %>%
        mutate(Hospital_Predictions = rf_pred_all) %>%
        select(Main_Site_ID, Hospital_Type, Standard_Label, Number_of_Program_Sites, Hospital_Predictions)

Predicted_Hospital <- Predicted_Hospital %>% group_by(Hospital_Type, Standard_Label) %>%
        summarize(count = n())

# Save predictions to the database
dbWriteTable(conn = con, "app_Predicted_Hospital", Predicted_Hospital)

# Close data base connections
lapply(dbListConnections( dbDriver( drv = "MySQL")), dbDisconnect)
