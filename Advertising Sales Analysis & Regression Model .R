
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
