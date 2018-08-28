#----
#library 설정
library(xlsx) #엑셀
library(Hmisc) #describe
library(dplyr)
library(leaps) #변수선택
library(ggplot2) # 표그리기
library(glmnet) # Lasso
require(caTools)



#----
#2. 기본설정 및 데이터 전처리
setwd('C:/Users/jayjunglim/Documents/GitHub/SNU_FIRA/SNU_FIRA_BA/2-4 Database Marketing(DM)')
mail <- read.xlsx('mailorder.xls', sheetName = "Sheet1")
head(mail)
sum(is.na(mail))  # 결측치가 없음을 확인할 수 있다.

set.seed(1) 
# sample = sample.split(mail$id, SplitRatio = 0.5)
esti = mail[1:2000,]
esti <- esti[,-1]
vali  = mail[2001:4000,]
vali <- vali[,-1]

mean(esti$purchase)
mean(vali$purchase)
sum(esti$purchase)
sum(vali$purchase)
#-----
# Q1
set.seed(1)
vali_500  <- esti[sample(nrow(esti), 500),]

nrow(vali_500)
sum(vali_500$purchase)
mean(vali_500$purchase)

baseline <- sum(vali_500$purchase)/nrow(vali_500) 
# 단 7.6%만 구매를 하였다.


#-----
# Q2

esti_rfm<-esti %>% mutate(new_r = ifelse(recency>12, 1,2),
                          new_f  = ifelse(frequency<3,1,2),
                          new_m = ifelse(monetary<209,1,2))

head(esti_rfm)
esti_rfm_prob <- esti_rfm %>% group_by(new_r, new_f, new_m) %>% 
  summarise(sum=n(),probability = mean(purchase)) %>% arrange(desc(probability))

esti_df <- as.data.frame(esti_rfm_prob)
#write.xlsx(esti_df, file = 'esti.xlsx')

#vali해보기
vali_potential <- vali %>% mutate(new_r = ifelse(recency>12, 1,2),
                        new_f  = ifelse(frequency<3,1,2),
                        new_m = ifelse(monetary<209,1,2))
top500 <- inner_join(vali_potential, esti_rfm_prob) %>% arrange(desc(prob)) %>% head(500)

sum(top500$purchase) #76명/500명
mean(top500$purchase) #15.2%

#----
# Q3

esti_rfm2 <-esti %>% mutate(new_r = cut(recency, breaks = c(0,4,8,12,16,max(esti$recency)),
                            label = c(5:1), right = T),
                new_f = cut(frequency, breaks = c(0,1,2,5,9,max(esti$frequency)),
                            label = c(1:5), right = T),
                new_m = cut(monetary, breaks = c(0,113,181,242,299,max(esti$monetary)),
                            label = c(1:5), right = T))

esti_rfm2_prob <- esti_rfm2 %>% group_by(new_r, new_f, new_m) %>% 
  summarise(sum =n(), probability = mean(purchase)) %>% arrange(desc(probability))


#vali 해보기
vali_potential2 <- vali %>% mutate(new_r = cut(recency, breaks = c(0,4,8,12,16,max(vali$recency)),
                                               label = c(5:1), right = T),
                                   new_f = cut(frequency, breaks = c(0,1,2,5,9,max(vali$frequency)),
                                               label = c(1:5), right = T),
                                   new_m = cut(monetary, breaks = c(0,113,181,242,299,max(vali$monetary)),
                                               label = c(1:5), right = T))
top500_2 <- inner_join(vali_potential2, esti_rfm2_prob) %>% arrange(desc(prob)) %>% head(500)

sum(top500_2$purchase)# 62명/500명
mean(top500_2$purchase)# 12.4%


#-----
# Q4
head(mail)
lm.fit <- lm(purchase~recency + frequency + monetary, data=esti)
summary(lm.fit)
attributes(lm.fit)
#R^2 굉장히 낮게나온다.

#적합해보자

pred <- predict(lm.fit, newdata = vali)
vali_pred <- cbind(pred, vali)
mean(vali_pred$purchase)#  8.1% 예측한다. # 아니다 내가 정해야한다. 0.5라든지...

residuals.lm(lm.fit) - fitted(lm.fit)

top500_reg <- vali_pred%>% arrange(desc(pred)) %>% head(500)
sum(top500_reg$purchase) # 상위 500명 중에 80명이 실제로 구매했다.
mean(top500_reg$purchase)

# 80/500  정확도 16%


#-----
#Q5


# 너네 왜일안하냐 변수선택 안하네 ㅡㅡ

glm.fit = glm(purchase ~., data = esti, family=binomial)
summary(glm.fit)
set.seed(1)
glm.probs = predict(glm.fit, type = 'response', vali)
head(glm.probs) 
summary(glm.probs)  #purchase확률이 0.5이상인 것이 없음...

vali_probs <- cbind(vali, glm.probs)

vali_probs %>% arrange(desc(glm.probs)) %>% 
  head(500) %>% summarise(sum(purchase),mean(purchase)) 


89/500 # 17.8%의 예측


# 변수선택


step(glm.fit, direction = 'forward') # forward
step(glm.fit, direction = 'backward') # backward
step(glm.fit, direction = 'both') # stepwise 방법


glm.fit.up = glm(purchase ~gender+recency + frequency, data = esti, family=binomial)
summary(glm.fit.up)
set.seed(1)
glm.probs.both = predict(glm.fit.up, type = 'response', vali)
head(glm.probs.both) 
summary(glm.probs.both)  #purchase 최대확율이 0.433 에서 0.22로 떡-락

vali_probs.both <- cbind(vali, glm.probs.both)

vali_probs.both %>% arrange(desc(glm.probs.both)) %>% 
  head(500)  %>% summarise( n(),mean(purchase)) 

91/500 # 18.2%의 예측


# 업샘플링해보자
library(caret)
table(esti$purchase)
esti_factor <- esti
esti_factor[,'purchase'] <- as.factor(esti_factor$purchase)
str(esti_factor)
esti_factor %>% select('purchase') %>% head(10)
x <- upSample(subset(esti_factor, select=-purchase),esti_factor$purchase)
table(x$Class)
mean(x$Class)

x[,'Class'] <- as.numeric(x$Class)


x$Class <- ifelse(x$Class == 1, 0, 1)
x[,'Class'] <- as.numeric(x$Class)
mean(x$Class)

str(x)



#----
# 로지스틱 with 업샘플링

glm.fit.up = glm(Class ~gender+recency + frequency, data = x, family=binomial)
summary(glm.fit.up)
set.seed(1)
glm.probs.up.both = predict(glm.fit.up, type = 'response', newdata = vali)
summary(glm.probs.up.both)  #purchase 최대확률이 0.433 에서 0.86으 떡-상

vali_probs.up.both <- cbind(vali, glm.probs.up.both)

vali_probs.up.both %>% arrange(desc(glm.probs.up.both)) %>% 
  head(500)  %>% summarise( n(),mean(purchase)) 

 # 18.6%의 예측 벗뜨 0.4%밖에 안올랏다고한다...다시하니 작동안하네

#변수선택다시
step(glm.fit.up, direction = 'both') # stepwise 방법


