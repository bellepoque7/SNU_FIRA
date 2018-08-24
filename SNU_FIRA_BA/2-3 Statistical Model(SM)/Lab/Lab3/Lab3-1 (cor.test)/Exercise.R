
library(tidyr)
library(dplyr)
library(broom)
attach(twinData)
library(ggplot2)
library(OpenMx)
data(twinData)
twinData <- as_tibble(twinData)


#HW3 
#Excercise 
#-----


twinData %>% ggplot(mapping = aes(ht1, ht2,colour = zygosity)) + 
  geom_point() 


# 어린그룹과 늙ㅇ 그룹 차이가 없어 보인다. 

#어린그룹 산점도
twin.young <- twinData[which(twinData$cohort  == 'younger'),]
twin.young %>% ggplot(mapping = aes(ht1, ht2)) + 
  geom_point() + geom_abline(a=1, b= 0, color = 'red', lwd = 1.0) + geom_smooth(method='lm')


#나이든 그룹 산점도
twin.old <- twinData %>% filter(cohort == 'older')
twin.old %>% ggplot(mapping = aes(ht1, ht2)) + 
  geom_point() + geom_abline(a=1, b= 0, color = 'red', lwd = 1.0)+ geom_smooth(method='lm')



# MZFF MZMM 은 일관성있는 키를 보인다. 남자가 키가 큰 경향이있다.
# DZFF DZMM DZOS는 일란성보다는 좀더 산포가 큰듯하다.  남자,여자 변수를 확인할 수 없어 더 근접한 해석은 불가하다. 

#DZOS만 따로봐보자 # 왜 위에 있냐 얘;;
twin.DZOS <- twinData[which(twinData$zygosity  == 'DZOS'),]
twin.DZOS %>% ggplot(mapping = aes(ht1, ht2)) + 
  geom_point() + geom_abline(a=1, b= 0, color = 'red', lwd = 1.0) + geom_smooth(method='lm')




#-----
# Excercise 8
#zycosity, cohor기준으로 10개의 plot을 명시하고

# 유의있는 그래프만 색깔로표시 conf.low 에 대하여 유의미한 값만 색칠 
a<- twinData %>% group_by(cohort,zygosity) %>%
  do(tidy(cor.test(~ht1+ht2, alternative = 'greater', data =.))) %>%
  select(cohort,zygosity, conf.low)

twinData %>% 
  inner_join(a) %>% 
  group_by(cohort,zygosity) %>% ggplot(mapping = aes(ht1, ht2, colour = conf.low)) +
  geom_point() + facet_grid(rows =vars(cohort), cols =vars(zygosity)) +
  geom_abline(a=1, b=0, color ='red', linetype = 'longdash')



# Excercise 9 
# Weight에 대하여 도식화  y = x 에 대하여 도식화

b<- twinData %>% group_by(cohort,zygosity) %>%
  do(tidy(cor.test(~wt1+wt2, alternative = 'greater', data =.))) %>%
  select(cohort,zygosity, conf.low)

twinData %>% 
  inner_join(b) %>% 
  group_by(cohort,zygosity) %>% ggplot(mapping = aes(wt1, wt2, colour = conf.low)) +
  geom_point() + facet_grid(rows =vars(cohort), cols =vars(zygosity)) +
  geom_abline(a=1, b=0, color ='red',linetype="longdash")

# Exercise 10

# Exercise 11

# Exercise 12

#등분

#쌍체 비교.
#1. 이표본 대신 왜 쌍체비교를 적용해야하는가?
#2. 각 subgroup에 대하여 유의성 5% 검정
#3. 