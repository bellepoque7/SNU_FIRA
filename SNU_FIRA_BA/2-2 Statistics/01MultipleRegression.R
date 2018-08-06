#-----
# advertising
install.packages('ISLR')
library(ISLR)
advertising <- read.csv('http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv')
str(advertising)
lm.fit <- lm(sales ~ TV, data = advertising)
summary(lm.fit)
View(advertising)

lm2.fit <- lm(sales ~., data = advertising)
summary(lm2.fat)


#-----
# Credit 자료
library(datasets)
library(MASS)
library(ISLR)

head(Credit)
credit.fit <- lm(Balance ~ Gender, data = Credit)
summary(credit.fit)

credit_Ethnicity.fit <- lm(Balance ~ Ethnicity, data = Credit)
summary(credit_Ethnicity.fit)
