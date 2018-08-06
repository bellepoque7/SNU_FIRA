
# Rcode 연습하기 9장 상관계수와 회귀분석

iris_lm2 <- lm(Sepal.Width~., data=iris)
summary(iris_lm2)

library(MASS); data("Boston"); str(Boston)

Boston_fm <- lm(medv~., data=Boston)
Boston_fm <- step(Boston_fm, direction='backward')



# p35 
linear.fit <- lm(eng~kor)
anvoa(liner.fit)


#p41
year <- c(1,1.5,2,2,3,3,3.2,4,4.5,5,5,5.5)
price <- c(4.5,4,3.2,3.4,2.5,2.3,2.3,1.6,1.5,1,0.8,0.4)
car_lm <- lm(price~year)
n = length(year)
typeof(car_lm)
car_lm$coefficients

# 회귀계수에 대한 t검정
anova(car_lm)
sxx = sum(year^2) - n*(mean(year)^2)
sigma = sqrt((anova(car_lm)
            ['Residuals','Mean Sq']/(n-2)))
sigma
to = (car_lm$coefficients[2]+0.8) * sqrt(sxx)  / sigma
to                                              
confint(car_lm)
predict(car_lm, newdata = data.frame('year'=2.5), intervla = 'confidence')
predict(car_lm, newdata = data.frame('year' =2.5))

plot(rstudent(car_lm))
abline(h=0, col ='red')
qt(0.05,10)

# 실습 7번 3번

obj = lm(Murder~., data=USArrests)
#회귀직선이 유의한지 유의수준 5%로 검정하라
anova(obj) # 유의준 검정가능.
summary(obj)


n = length(USArrests$Murder)

# (c)
plot(obj) # Residuals vs Fitted:  빨간선은 가장 잘설명해주는 선
# QQ plot은?  quantile이라는 뜻인데..  정규성테스트이다.