# 와인에서는 support vector machine이 나온다.(2학기에 나오는데, 모델링은 심오하나 쓰긴 안어렵다)
# 양이 얼마없어서 논문에서 더 추가해서 얘기해도 좋을 것이다.
# 결과는 페이퍼형태 리포트 한 5-10장 사이로......네??
# 좋은 방향은 논문을 따라가보고 확인해보는 것.

getwd()

red_wine = read.csv('winequality-red.csv', sep=';', header=T)
a = red_wine
View(red_wine)
str(red_wine)  

install.packages('doBy')
library(doBy)
red_wine$fixed.acidity
summaryBy(red_wine$fixed.acidity, data = red_wine, FUN=c(mean,var,max,min))
# 와인데이터의 str 보기 
# 와인데이터는 1599개의 관측치와 12개의 변수로 이루어져있다.
#  11개의 num 데이터와 quality는 int 변수로 이루어져있다.


# quality 
wine_quality = table(a['quality'])
barplot(wine_quality, main = "red wine quaility", xlab = "region", ylab = "freq")

# wine의 quality는 가장 낮은 값 3부터 8까지 나타내며
# 가장 많은 값이 5이다.

# fixed acidity
fixed_acidity_hist = red_wine$fixed.acidity
hist(red_wine$fixed.acidity, nclass = 8, probability = T)
boxplot(red_wine$fixed.acidity, main = "fixed.acidity", col ='lightblue')

# volatile.acidity
volatile_acidity_hist = red_wine$volatile.acidity
hist(red_wine$volatile.acidity, nclass = 8, probability = T)
boxplot(red_wine$volatile.acidity, main = "volatile.acidity", col ='lightblue')

# citric.acid
citric_acid_hist = red_wine$citric.acid
hist(red_wine$citric.acid, nclass = 8, probability = T)
boxplot(red_wine$citric.acid, main = "citric.acid", col ='lightblue')

# residual.sugar
residual_sugar_hist = red_wine$residual.sugar
hist(red_wine$residual.sugar, nclass = 8, probability = T)
boxplot(red_wine$residual.sugar, main = "residual.sugar", col ='lightblue')

# chlorides
chlorides_hist = red_wine$chlorides
hist(red_wine$chlorides, nclass = 8, probability = T)
boxplot(red_wine$chlorides, main = "chlorides", col ='lightblue')

# free.sulfur.dioxide
free_sulfur_dioxide_hist = red_wine$free.sulfur.dioxide
hist(red_wine$free.sulfur.dioxide, nclass = 8, probability = T)
boxplot(red_wine$free.sulfur.dioxide, main = "free.sulfur.dioxide", col ='lightblue')

# total.sulfur.dioxide
total_sulfur_dioxide_hist = red_wine$total.sulfur.dioxide
hist(red_wine$total.sulfur.dioxide, nclass = 8, probability = T)
boxplot(red_wine$total.sulfur.dioxide, main = "total.sulfur.dioxide", col ='lightblue')

# density
density_hist = red_wine$density
hist(red_wine$density, nclass = 8, probability = T)
boxplot(red_wine$density, main = "density", col ='lightblue')

# pH
pH_hist = red_wine$pH
hist(red_wine$pH, nclass = 8, probability = T)
boxplot(red_wine$pH, main = "pH", col ='lightblue')
