library(caret)
library(randomForest)
library(ggplot2)

library(doMC)
registerDoMC(cores = 5)
data <- read.csv("src_Main_Sites.csv", header = TRUE)
main_sites <- data[,c(2,3,4,5,6,8,9,10,11,12,13,14,15,16)]

summary(main_sites)

split <- createDataPartition(y = main_sites$Accreditation_Decision, p=0.7, list=FALSE)
mtrain <- main_sites[split, ]
mtest <- main_sites[-split, ]

control <- trainControl(method = "cv", number = 5)

start_time <- Sys.time()
rf_model <- train(Accreditation_Decision ~., 
                  data = mtrain,
                  method = "rf",
                  trControl = control,
                  allowParallel = TRUE)

end_time <- Sys.time()
sprintf("Time to run the model:  %s", round(end_time - start_time, 4))

print(rf_model)

predictions <- predict(rf_model, mtest)

confusionMatrix(data = predictions, mtest$Accreditation_Decision)

varImp(rf_model)

write.csv(mtrain, "mtrain.csv", sep = "|", eol = "\n")
write.csv(mtest, "mtest.csv", sep = "|", eol = "\n")

library(caret)
library(randomForest)
library(ggplot2)

library(doMC)
registerDoMC(cores = 5)
data <- read.csv("tmp_survey.csv", header = TRUE)
survey <- data[,c(2:23)]

summary(survey)

split <- createDataPartition(y = survey$Standard_Chapter_Name, p=0.7, list=FALSE)
mtrain <- survey[split, ]
mtest <- survey[-split, ]

survey_model <- train(Accreditation_Decision ~., 
                  data = mtrain,
                  method = "rf",
                  trControl=trainControl(method = "cv", number = 5),
                  prox=TRUE,
                  allowParallel=TRUE)
print(survey_model)

predictions <- predict(survey_model, mtest)

confusionMatrix(data = predictions, mtest$Standard_Chapter_Name)

varImp(rf_model)
