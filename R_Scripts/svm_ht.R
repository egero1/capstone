library(caret)
library(dplyr)         # Used by caret
library(kernlab)       # support vector machine 
library(MLmetrics)
library(pROC)
library(foreach)

# Helper function, use the other one
# takes a column name (pointing to a factor variable) and a dataset 
# returns a dataframe containing a 1-in-K coding for this factor variable
col_to_dummy <- function(colname, data) {
        # tmp is a dataframe of K columns, where K is the number of levels of the factor in colname
        # it is a 1-in-K dummy variable coding
        levelnames <- levels(data[[colname]])
        dummy <- foreach(i=1:length(levelnames), .combine=cbind) %do% {
                as.numeric(as.numeric(data[[colname]])==i)
        }
        dummy <- as.data.frame(dummy)
        names(dummy) <- paste0(colname, ":", levelnames)
        dummy
}

factor_to_dummy <- function(obsdata) {
        
        # finding the columns containing a factor variable
        col_factor <- unlist(lapply(FUN=is.factor, obsdata))
        
        # if they are none, then nothing to do
        if(!any(col_factor)) {
                return(obsdata)
        }
        # otherwise
        # for each of these, convert it to dummy variables using col_to_dummy
        foreach(colname=names(which(col_factor)), .combine = cbind, 
                .init = obsdata[,-which(col_factor)]) %do% {
                        col_to_dummy(colname, obsdata)
                }
        # each resulting data.frame is c-bound with the dataset without factors
}

mydata <- read.csv('/Users/ericgero/Desktop/tmp_survey_standard.csv')
mydata$Hospital_Type <- gsub(' ', '_', trimws(mydata$Hospital_Type))
mydata$Hospital_Type <- gsub(',', '', trimws(mydata$Hospital_Type))
mydata$Hospital_Type <- gsub('\'', '', trimws(mydata$Hospital_Type))
#mydata_use <- factor_to_dummy(mydata[,-1])

#for (i in colnames(mydata_use[, sapply(mydata_use, is.factor)])){
#        for (level in unique(mydata_use[, i])){
#                mydata_use[paste(i, level, sep = "_")] = 
#                        as.integer(ifelse(mydata_use[, i] == level, 1, -1))
#        }
#}

trainIndex <- createDataPartition(mydata_use$Hospital_Type, p = .7, list = FALSE)
trainData <- mydata_use[trainIndex,]
testData  <- mydata_use[-trainIndex,]
#trainX <-trainData[,c(3,4,6,7,8,9,10,11,12)]        # Pull out the variables for training
#sapply(trainX,summary)

## SUPPORT VECTOR MACHINE MODEL
# First pass
set.seed(1492)
# Setup for cross validation
ctrl <- trainControl(method = "repeatedcv",   # 10fold cross validation
                     repeats = 5,		    # do 5 repititions of cv
                     summaryFunction = multiClassSummary,	# Use AUC to pick the best model
                     classProbs = TRUE)


#Train and Tune the SVM
svm.tune <- train(x = tr,
                  y = trainData$Hospital_Type,
                  method = "svmRadial",           # Radial kernel
                  tuneLength = 9,	          # 9 values of the cost function
                  preProc = c("center","scale"),  # Center and scale data
                  metric = "ROC",
                  trControl = ctrl)

svm.tune