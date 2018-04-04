# https://www.hackerearth.com/practice/machine-learning/machine-learning-algorithms/beginners-tutorial-on-xgboost-parameter-tuning-r/tutorial/

library(mlr)
library(RMySQL)
library(data.table)
library(dplyr)
library(xgboost)
library(caret)

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

lapply(dbListConnections( dbDriver( drv = "MySQL")), dbDisconnect)

use_data <- mydata %>%
        mutate(Hospital_Type = factor(Hospital_Type)) %>%
        mutate(Standard_Label = factor(Standard_Label)) %>%
        mutate(Program = factor(Program)) %>%
        mutate(Survey_Year = factor(Survey_Year)) %>%
        mutate(System_Affiliation = factor(System_Affiliation)) %>%
        select(Hospital_Type, Standard_Label, max_safer_score, Number_of_Program_Sites, Total_Surveyor_Days, Number_of_DSC_Certifications,
               Count_NonCompliant_Standards, Count_NonCompliant_EPs, Number_of_Surveyor_Class_Types,
               Number_of_Surveyors, System_Affiliation, Survey_Year, Program)

trainIndex <- createDataPartition(use_data$Hospital_Type, p = .7, list = FALSE)
trainData <- use_data[trainIndex,]
testData  <- use_data[-trainIndex,]

# create data table data frames
setDT(trainData) 
setDT(testData)

# using one hot encoding
labels <- trainData$Hospital_Type
ts_label <- testData$Hospital_Type
new_tr <- model.matrix(~.+0, data = trainData[,-c("Hospital_Type"), with = F]) 
new_ts <- model.matrix(~.+0, data = testData[,-c("Hospital_Type"), with = F])

# convert factor to numeric
labels <- as.numeric(labels)-1
ts_label <- as.numeric(ts_label)-1

# preparing matrix 
dtrain <- xgb.DMatrix(data = new_tr, label = labels) 
dtest <- xgb.DMatrix(data = new_ts, label = ts_label)

params <- list(booster = "gbtree"
               ,objective = "multi:softmax"
               ,num_class = 23
               ,eta = 0.3
               ,gamma = 0
               ,max_depth = 6
               ,min_child_weight = 1
               ,subsample = 1
               ,colsample_bytree = 1
        )

xgbcv <- xgb.cv(params = params
                ,data = dtrain
                ,nrounds = 100
                ,nfold = 5
                ,showsd = TRUE
                ,stratified = TRUE
                ,print_every_n = 10
                ,early_stopping_rounds = 20
                ,maximize = FALSE
                ,eval_metric = "mlogloss"
        )

xgbcv$best_iteration

# first default - model training
xgb1 <- xgb.train (params = params
                   ,data = dtrain
                   ,nrounds = 100
                   ,watchlist = list(val = dtest, train = dtrain)
                   ,print_every_n = 10
                   ,early_stopping_rounds = 10
                   ,maximize = F 
                   ,eval_metric = "mlogloss"
        )

# model prediction
xgbpred <- predict (xgb1, dtest)
xgbpred <- ifelse (xgbpred > 0.5, 1, 0)

# confusion matrix
confusionMatrix (xgbpred, ts_label)
#Accuracy - 86.54%` 

# view variable importance plot
mat <- xgb.importance (feature_names = colnames(new_tr),model = xgb1)
xgb.plot.importance (importance_matrix = mat[1:20]) 


##############
trainTask <- makeClassifTask(data = trainData, target = "Hospital_Type")
testTask <- makeClassifTask(data = testData, target = "Hospital_Type")

#load xgboost
set.seed(1001)
getParamSet("classif.xgboost")

#make learner with inital parameters
xg_set <- makeLearner("classif.xgboost", predict.type = "response")
xg_set$par.vals <- list(
        objective = "multi:softmax",
        eval_metric = "error",
        nrounds = 250
)

#define parameters for tuning
xg_ps <- makeParamSet(
        makeIntegerParam("nrounds",lower=200,upper=600),
        makeIntegerParam("max_depth",lower=3,upper=20),
        makeNumericParam("lambda",lower=0.55,upper=0.60),
        makeNumericParam("eta", lower = 0.001, upper = 0.5),
        makeNumericParam("subsample", lower = 0.10, upper = 0.80),
        makeNumericParam("min_child_weight",lower=1,upper=5),
        makeNumericParam("colsample_bytree",lower = 0.2,upper = 0.8)
)

#define search function
rancontrol <- makeTuneControlRandom(maxit = 100L) #do 100 iterations

#3 fold cross validation
set_cv <- makeResampleDesc("CV",iters = 3L)

#tune parameters
xg_tune <- tuneParams(learner = xg_set, task = trainTask, resampling = set_cv,measures = acc,par.set = xg_ps, control = rancontrol)

#set parameters
xg_new <- setHyperPars(learner = xg_set, par.vals = xg_tune$x)

#train model
xgmodel <- train(xg_new, trainTask)

#test model
predict.xg <- predict(xgmodel, testTask)

#submission file
submit <- data.frame(Loan_ID = test$Loan_ID, Loan_Status = predict.xg$data$response)
write.csv(submit, "submit7.csv",row.names = F)