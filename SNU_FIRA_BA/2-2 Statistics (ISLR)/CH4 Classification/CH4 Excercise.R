
#-----
#practice

library(ggplot2)
setwd('C:/Users/renz/Documents/GitHub/SNU_FIRA/SNU_FIRA_BA/2-2 Statistics (ISLR)/CH4 Classification')
ins = read.csv('insurance.csv', header =T)
ins = ins[,-c(3,4)]
ins$clm=as.factor(ins$clm)

ggplot(data = ins, aes(x=exposure, y = veh_value))+ geom_point(alpha = 0.1, aes(color = clm))

load('AlzheimerDisease.RData')
head(predictors, n = 1)
library(class)
train.X=predictors[1:250,1:129] # genotype은 연속형 변수가 아니라서 제외
test.X=predictors[251:333,1:129]
train.Y=as.numeric(diagnosis[1:250])
test.Y=as.numeric(diagnosis[251:333])

#----
# KNN 분류 실습


set.seed(1)
knn.pred=knn(train=train.X, test=test.X, cl = train.Y, k = 5, prob=T)
table(knn.pred,test.Y)

#-----
# Credit defalut

creditdefault=read.csv("creditdefault.csv",header=T)
creditdefault[,3]=as.factor(creditdefault[,3])
train.X=creditdefault[1:25000,1:23]
test.X=creditdefault[25001:30000,1:23]
train.Y=creditdefault[1:25000,24]
test.Y=creditdefault[25001:30000,24]
test=creditdefault[25001:30000,]

X=train.X
head(X)
head(X,n=1)
