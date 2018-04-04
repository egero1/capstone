# https://www.hackerearth.com/practice/machine-learning/machine-learning-algorithms/beginners-tutorial-on-xgboost-parameter-tuning-r/tutorial/

library(mlr)
library(data.table)
library(dplyr)
library(xgboost)
library(caret)
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
lapply(dbListConnections( dbDriver( drv = "MySQL")), dbDisconnect)

# Read file if no internect connection available
#mydata <- read.csv('/Users/ericgero/Desktop/query_result.csv')
use_data <- mydata %>%
  mutate(Hospital_Type = factor(Hospital_Type)) %>%
  mutate(Standard_Label = factor(trimws(Standard_Label))) %>%
  mutate(Program = factor(Program)) %>%
  mutate(Survey_Year = factor(Survey_Year)) %>%
  mutate(System_Affiliation = factor(System_Affiliation)) %>%
  select(Hospital_Type, Standard_Label, max_safer_score, Number_of_Program_Sites, Total_Surveyor_Days, Number_of_DSC_Certifications,
         Count_NonCompliant_Standards, Count_NonCompliant_EPs, Number_of_Surveyor_Class_Types,
         Number_of_Surveyors, System_Affiliation, Survey_Year, Program)

# Uncomment this to run standard_label only model
#use_data <- mydata %>%
#        mutate(Hospital_Type = factor(Hospital_Type)) %>%
#        mutate(Standard_Label = factor(trimws(Standard_Label))) %>%
#        select(Hospital_Type, Standard_Label)

all_data <- use_data
trainIndex <- createDataPartition(use_data$Hospital_Type, p = .7, list = FALSE)
trainData <- use_data[trainIndex,]
testData  <- use_data[-trainIndex,]

# create data table data frames
setDT(all_data)
setDT(trainData) 
setDT(testData)

# using one hot encoding
labels_all <- all_data$Hospital_Type
labels <- trainData$Hospital_Type
ts_label <- testData$Hospital_Type
new_all <- model.matrix(~.+0, data = all_data[,-c("Hospital_Type"), with = F]) 
new_tr <- model.matrix(~.+0, data = trainData[,-c("Hospital_Type"), with = F]) 
new_ts <- model.matrix(~.+0, data = testData[,-c("Hospital_Type"), with = F])

# convert factor to numeric
labels_all <- as.numeric(labels_all) - 1
labels <- as.numeric(labels) - 1
ts_label <- as.numeric(ts_label) - 1

# preparing matrix 
adata <- xgb.DMatrix(data = new_all, label = labels_all) 
dtrain <- xgb.DMatrix(data = new_tr, label = labels) 
dtest <- xgb.DMatrix(data = new_ts, label = ts_label)

###############################################################################################
## XGradient Boost Models - Hospital Type classification
###############################################################################################

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
                ,nrounds = 200
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
xgb_ht <- xgb.train (params = params
                   ,data = dtrain
                   ,nrounds = 54
                   ,watchlist = list(val = dtest, train = dtrain)
                   ,print_every_n = 10
                   ,early_stopping_rounds = 10
                   ,maximize = F 
                   ,eval_metric = "mlogloss"
        )

# model prediction
xgbpred_ht <- predict(xgb_ht, dtest)
#xgbpred <- ifelse (xgbpred > 0.5, 1, 0)

# confusion matrix
xgbcm_ht <- confusionMatrix(xgbpred_ht, ts_label)
#Accuracy - 99.17% Kappa - 0.9852

# save models and results
saveRDS(xgb_ht, "xgb_ht.rds")
saveRDS(xgbpred_ht, "xgbpred_ht.rds")
xgb_htt <- readRDS("xgb_ht.rds")

library(ggplot)
# view variable importance plot
mat <- xgb.importance (feature_names = colnames(new_tr), model = xgb_ht)
xgb.plot.importance (importance_matrix = mat[1:20], main = "XGBoost Model Variable Importance - Hospital Type") 

ggplot(mat[1:10], aes(x = reorder(Feature, Gain), Gain)) +
        geom_bar(stat = "identity", aes(fill = Feature)) + 
        coord_flip() + 
        guides(fill=FALSE) + 
        ggtitle("XGBoost Model Variable Importance - Hospital Type") +
        xlab("Variables") +
        ylab("")

## predict on full data set for use in mobile app
# get results for full data set
# model prediction
xgb_pred_ht_all <- predict(xgb_ht, adata)

# confusion matrix
xgb_cm_ht_all <- confusionMatrix(xgb_pred_ht_all, labels_all)
#Accuracy - 99.17% Kappa - 0.9852


# Convert predictions to hospital
xgb_pred_ht_all <- as.factor(xgb_pred_ht_all)
xgb_pred_ht_all <- factor(xgb_pred_ht_all, 
                      levels = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19), 
                      labels = levels(use_data$Hospital_Type))

###############################################################################################
# xgboost - max safer score
###############################################################################################

# using one hot encoding
labels_all <- all_data$max_safer_score
labels <- trainData$max_safer_score
ts_label <- testData$max_safer_score
new_all <- model.matrix(~.+0, data = all_data[,-c("max_safer_score"), with = F]) 
new_tr <- model.matrix(~.+0, data = trainData[,-c("max_safer_score"), with = F]) 
new_ts <- model.matrix(~.+0, data = testData[,-c("max_safer_score"), with = F])

# preparing matrix 
adata <- xgb.DMatrix(data = new_all, label = labels_all) 
dtrain <- xgb.DMatrix(data = new_tr, label = labels) 
dtest <- xgb.DMatrix(data = new_ts, label = ts_label)

params <- list(booster = "gbtree"
               ,objective = "reg:linear"
               ,eta = 0.3
               ,gamma = 0
               ,max_depth = 6
               ,min_child_weight = 1
               ,subsample = 1
               ,colsample_bytree = 1
        )

xgbcv_mss <- xgb.cv(params = params
                ,data = dtrain
                ,nrounds = 200
                ,nfold = 5
                ,showsd = TRUE
                ,stratified = TRUE
                ,print_every_n = 10
                ,early_stopping_rounds = 20
                ,maximize = FALSE
                ,eval_metric = 'mae' # change to 'rmse'
        )

xgbcv_mss$best_iteration

# first default - model training
xgb_mss <- xgb.train (params = params
                   ,data = dtrain
                   ,nrounds = 80
                   ,watchlist = list(val = dtest, train = dtrain)
                   ,print_every_n = 10
                   ,early_stopping_rounds = 10
                   ,maximize = F 
                   ,eval_metric = 'mae' # change to 'rmse'
        )

# model prediction
xgb_pred_mss <- predict (xgb_mss, dtest)

#RMSE
RMSE <- sqrt(mean((testData$max_safer_score - xgb_pred_mss)^2))  #RMSE - 1.889319

# save models and results
saveRDS(params , "xgb_params.rds")
saveRDS(xgbcv_mss, "xgbcv_mss.rds")
saveRDS(xgbpred_mss, "xgbpred_mss.rds")

# view variable importance plot
mat <- xgb.importance (feature_names = colnames(new_tr), model = xgb_mss)
xgb.plot.importance (importance_matrix = mat[1:20], main = "XGBoost Model - Max Safer Score") 

## predict on full data set for use in mobile app
# get results for full data set
# model prediction
xgb_pred_mss_all <- predict (xgb_mss, adata)

#RMSE
RMSE <- sqrt(mean((all_data$max_safer_score - xgb_pred_mss_all)^2))  #RMSE - 1.889319
 
###############################################################################################
## xgboost - max safer score as factor
###############################################################################################

trainData$max_safer_score <- as.factor(trainData$max_safer_score)
testData$max_safer_score <- as.factor(testData$max_safer_score)

# using one hot encoding
labels <- trainData$max_safer_score
ts_label <- testData$max_safer_score
new_tr <- model.matrix(~.+0, data = trainData[, -c("max_safer_score"), with = F]) 
new_ts <- model.matrix(~.+0, data = testData[, -c("max_safer_score"), with = F])

# convert factor to numeric
labels <- as.numeric(labels) - 1
ts_label <- as.numeric(ts_label) - 1

# preparing matrix 
dtrain <- xgb.DMatrix(data = new_tr, label = labels) 
dtest <- xgb.DMatrix(data = new_ts, label = ts_label)

params <- list(booster = "gbtree"
               ,objective = "multi:softmax"
               ,num_class = 10
               ,eta = 0.3
               ,gamma = 0
               ,max_depth = 6
               ,min_child_weight = 1
               ,subsample = 1
               ,colsample_bytree = 1
        )

xgb_cv_mss <- xgb.cv(params = params
                ,data = dtrain
                ,nrounds = 200
                ,nfold = 5
                ,showsd = TRUE
                ,stratified = TRUE
                ,print_every_n = 10
                ,early_stopping_rounds = 20
                ,maximize = FALSE
                ,eval_metric = 'mlogloss'
        )

xgbcv$best_iteration

# first default - model training
xgb_mss_fact <- xgb.train (params = params
                   ,data = dtrain
                   ,nrounds = 83
                   ,watchlist = list(val = dtest, train = dtrain)
                   ,print_every_n = 10
                   ,early_stopping_rounds = 10
                   ,maximize = F 
                   ,eval_metric = 'mlogloss'
        )

# Save model and results
saveRDS(params , "xgb_params_mss_fact.rds")
saveRDS(xgb_cv_mss, "xgb_cv_mss.rds")
saveRDS(xgb_mss_fact, "xgb_mss_fact.rds")

# model prediction
xgb_pred_mss_fact <- predict (xgb_mss_fact, dtest)

# confusion matrix
confusionMatrix(xgb_pred_mss_fact, ts_label)
#Accuracy - 99.17% Kappa - 0.9864

# view variable importance plot
mat <- xgb.importance (feature_names = colnames(new_tr), model = xgb_mss_fact)
xgb.plot.importance (importance_matrix = mat[1:20]) 

