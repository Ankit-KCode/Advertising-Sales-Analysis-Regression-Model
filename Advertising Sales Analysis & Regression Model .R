
install.packages("dplyr")
library(dplyr)

#for data transformation
install.packages("broom")
library(broom)

#for linear Regression 
install.packages("caTools")
library(caTools)

#for data visualization
install.packages("ggplot2")
library(ggplot2)

#Reading the dataset from file path
adv = read.csv("D:/CSE (AI & ML)/Data Analytics Internship/Advertising.csv")

#Showing the head(first 6 rows) of the dataset
head(adv)

#Checking the dimensions of the dataset(rows,column)
dim(adv)

#Checking stastistical Information of dataset
summary(adv)

#Visualising Data Using Plot function: plot(x,y)
#1 For TV sales
plot(adv$Sales, adv$TV, type = 'p', col="blue")

#2 For Redio sales
plot(adv$Sales, adv$Radio, type = 'p', col="red")

#3 For Newspaper sales
plot(adv$Sales, adv$Newspaper, type = 'p', col="green")

#comparing together all plots
pairs(adv)

# Corelation Analysis
install.packages("corrplot")
library(corrplot)

#Selecting only the numeric values using sapply function
#checking variable is numeric or not.
num.cols = sapply(adv, is.numeric)
num.cols

#finding correlation on only numeric values and numeric colums
cor.data = cor(adv[,num.cols])
cor.data

#Making Correlation Matrix
corrplot(cor.data, method = 'color')

#Simple Linear Regression
My_Model = lm(Sales~TV, data=adv)
summary(My_Model)

#tidy will give simplified information of summary(My_Model)
tidy(My_Model)

# Multiple linear Regression 
Multiple_Model = lm(Sales~TV + radio + newspaper, data=adv)
summary(Multiple_Model)

tidy(Multiple_Model)

coef = summary(Multiple_Model)$coefficients
coef

#Random Value Generation
set.seed(101)

#Splitting the dataset into Train and Test Dataset
sample = sample.split(adv$TV, SplitRatio = 0.70)
train = subset(adv, sample=TRUE)
test = subset(adv, sample=FALSE)

#Building Model
Model = lm(Sales~ .,train)
summary(Model)

# Checking Residual Collector from the trained model using residuals function
res = residuals(Model)
res = as.data.frame(res) #Converting res into data frame
res

# Making predictions on test dataset
Sales.predictions = predict(Model, test)
Sales.predictions

prediction_results = cbind(Sales.predictions, test$Sales)
prediction_results # Binding column of predicted sales and original sales

#Assigning Column names
colnames(prediction_results) = c("Predicted", "Original")
prediction_results = as.data.frame(prediction_results)
prediction_results

#Regression Model Completed
