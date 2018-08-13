install.packages('boot')
library(ISLR)
set.seed(1)

#------
# 검증셋 기법(Cross Validation)

train = sample(392,196)
lm.fit = lm(mpg~horsepower, data =Auto, subset = train) # 절반으로 알아서 나누는듯?
attach(Auto)
mean((mpg-predict(lm.fit,Auto))[-train]^2)  # 훈련셋을 제외함, 검정 MSE를 뜻함.

lm.fit2 = lm(mpg~poly(horsepower,2), data=Auto, subset=train) # 2차 함수로 해보자
mean((mpg-predict(lm.fit2,Auto))[-train]^2)

lm.fit3 = lm(mpg~poly(horsepower,3),data=Auto, subset=train)
mean((mpg-predict(lm.fit3,Auto))[-train]^2)
# 결론 horsepower는 이차함수를 사용하여 mpg를 예측하는것이 선형함수보다 낫다 but 삼차는 굳이 필요없다.


#-----
#LOO 교차 검증

glm.fit = glm(mpg~horsepower,data=Auto)
coef(glm.fit)

lm.fit=lm(mpg~horsepower, data=Auto)
coef(lm.fit)                          #  glm과 lm은 다르지만 같다. 
                                      # https://rstudio-pubs-static.s3.amazonaws.com/41074_62aa52bdc9ff48a2ba3fb0f468e19118.html


library(boot)
glm.fit = glm(mpg~horsepower,data=Auto)
cv.err = cv.glm(Auto,glm.fit)
cv.err$delta              # 교차검증 결과

# 1차부터 5차까지 glm을  반복해보자
cv.error = rep(0,5)
i <- 0 
for (i in 1:5) {
glm.fit = glm(mpg~poly(horsepower,i), data = Auto)    # 이거+는왜들어가고...싫행은 왜안되공...
cv.error[i] = cv.glm(Auto,glm.fit)$delta[1]
}
cv.error  # 선형적합(24)에서 2차형적합(19)일때 크게 줄어들지만 그이상은 안줄어든다.

# k-fold교차 검증

set.seed(17)
cv.error.10 = rep(0,10)
for(i in 1:10){
  glm.fit = glm(mpg~poly(horsepower,i), data= Auto)
  cv.error.10[i] = cv.glm(Auto, glm.fit, K = 10)$delta[1]
}
cv.error.10

#시간도 LOOCV보다 짧다. delta값이 다른걸 볼수있는데 첫번째는 표준k-foldCV추정치이고
#두번째는 편향이 수정된 값이기떄문.

#------
#Bootstrap, Portfolio 라는 금융패키지 예시

alpha.fn=function(data,index){
  X=data$X[index]
  Y=data$Y[index]
  return((var(Y)-cov(X,Y))/(var(X)+var(Y)-2*cov(X,Y)))
}

alpha.fn(Portfolio, 1:100) # 100개의 값으로 관측치를 랜덤으로 복원추출

set.seed(1)
alpha.fn(Portfolio,sample(100,100,replace=T))
boot(Portfolio, alpha.fn,R=1000)

#알파 추정치에대한 표준오차는 0.086임을 보여준다.


#선형회뮈모델의 정확도 추정

boot.fn = function(data, index){
return(coef(lm(mpg~horsepower, data = data, subset = index)))
}
boot.fn(Auto,1:392)

set.seed(1)
boot.fn(Auto,sample(392,392,replace=T))
boot.fn(Auto,sample(392,392,replace=T))
# 복원추출하여 절편과 기울기에 대한 bootstrap 추정치를 생성


boot(Auto,boot.fn,1000)
# SE(beta_0_)과 SE(beta_1)의 추정치는 각각 0.86과 0.0074이다.

summary(lm(mpg~horsepower,data=Auto))$coef
# summary에서 Std.error가 bootstrap결과랑 조금은 다르다..문제인가?
#  NO. 가정의문제인데. 결론부터 말하면 Bootstrap이 더 정확한것이다.


#Bootstrap 이차모델 적합
boot.fn <- function(data,index){
  coefficients(lm(mpg~horsepower+I(horsepower^2),data = data,subset = index))
}
set.seed(1)  
boot(Auto,boot.fn, 1000)  

summary(lm(mpg~horsepower+I(horsepower^2),data=Auto))$coef
# 2차표준모델은 잘 적합되므로 bootstrap과 SE(beat)값들이 서로 비슷하다.