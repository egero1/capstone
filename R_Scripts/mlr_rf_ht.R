
library(dplyr)
library(mlr)
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

query = "SELECT * FROM tmp_survey_standard WHERE max_safer_Score > 0"

mydata <- dbGetQuery(conn = con, query)

lapply(dbListConnections( dbDriver( drv = "MySQL")), dbDisconnect)

use_data <- mydata %>%
        mutate(Hospital_Type = factor(Hospital_Type)) %>%
        mutate(Standard_Label = factor(trimws(Standard_Label))) %>%
        mutate(Program = factor(Program)) %>%
        mutate(Survey_Year = factor(Survey_Year)) %>%
        mutate(System_Affiliation = factor(System_Affiliation)) %>%
        select(Hospital_Type, Standard_Label, max_safer_score, Number_of_Program_Sites, Total_Surveyor_Days, Number_of_DSC_Certifications,
               Count_NonCompliant_Standards, Count_NonCompliant_EPs, Number_of_Surveyor_Class_Types,
               Number_of_Surveyors, System_Affiliation, Survey_Year, Program)

trainIndex <- createDataPartition(use_data$Hospital_Type, p = .7, list = FALSE)
trainData <- use_data[trainIndex,]
testData  <- use_data[-trainIndex,]

# create a task
trainTask <- makeClassifTask(data = trainData, target = "Hospital_Type")
testTask <- makeClassifTask(data = testData, target = "Hospital_Type")

# normalize the variables
trainTask <- normalizeFeatures(trainTask, method = "standardize")
testTask <- normalizeFeatures(testTask, method = "standardize")

# feature importance
im_feat <- generateFilterValuesData(trainTask, method = c("information.gain", "chi.squared"))
plotFilterValues(im_feat, n.show = 20)

# to launch its shiny application
plotFilterValuesGGVIS(im_feat)

getParamSet("classif.randomForest")

# create a learner
rf <- makeLearner("classif.randomForest", predict.type = "response", par.vals = list(ntree = 200, mtry = 3))
rf$par.vals <- list(
        importance = TRUE
)

# set tunable parameters
# grid search to find hyperparameters
rf_param <- makeParamSet(
        makeIntegerParam("ntree",lower = 50, upper = 500),
        makeIntegerParam("mtry", lower = 3, upper = 10),
        makeIntegerParam("nodesize", lower = 10, upper = 50)
)

# random search for 50 iterations
rancontrol <- makeTuneControlRandom(maxit = 50L)

# set 3 fold cross validation
set_cv <- makeResampleDesc("CV",iters = 3L)

# hypertuning
rf_tune <- tuneParams(learner = rf, resampling = set_cv, task = trainTask, par.set = rf_param, control = rancontrol, measures = acc)

#cv accuracy
rf_tune$y

# best parameters
rf_tune$x

# using hyperparameters for modeling
rf.tree <- setHyperPars(rf, par.vals = rf_tune$x)

# train a model
rforest <- train(rf.tree, trainTask)
getLearnerModel(t.rpart)

# make predictions
rfmodel <- predict(rforest, testTask)

#submission file
submit <- data.frame(Loan_ID = test$Loan_ID, Loan_Status = rfmodel$data$response)
write.csv(submit, "submit4.csv",row.names = F)
