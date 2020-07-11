# Data preprocessing

dataset=read.csv('Car_Purchasing_Data.csv')
dataset=dataset[5:9]

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Car.Purchase.Amount, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


library(e1071)

regressor=svm(formula = Car.Purchase.Amount~., data = training_set, type = 'eps-regression')4

summary(regressor)

y_pred=predict(regressor, newdata = test_set)



difference = test_set[, 5]-y_pred