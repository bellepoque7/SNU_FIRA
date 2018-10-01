
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
# zygosity 별로 산점도를 그려보았다.
# subgroup별로 다시 그려보자.


#어린그룹 산점도
twin.young <- twinData[which(twinData$cohort  == 'younger'),]
twin.young %>% ggplot(mapping = aes(ht1, ht2)) + 
  geom_point() 
#+ geom_abline(a=1, b= 0, color = 'red', lwd = 1.0) + geom_smooth(method='lm')


#나이든 그룹 산점도
twin.old <- twinData %>% filter(cohort == 'older')
twin.old %>% ggplot(mapping = aes(ht1, ht2)) + 
  geom_point()
#+ geom_abline(a=1, b= 0, color = 'red', lwd = 1.0)+ geom_smooth(method='lm')

#어린그룹과 나이든 그룹이 다른게 보이지 않는다.



# MZFF MZMM 은 일관성있는 키를 보인다. 남자가 키가 큰 경향이있다.
# DZFF DZMM DZOS는 일란성보다는 좀더 산포가 큰듯하다.  남자,여자 변수를 확인할 수 없어 더 근접한 해석은 불가하다. 
# DZOS만 따로봐보자
twin.DZOS <- twinData[which(twinData$zygosity  == 'DZOS'),]
twin.DZOS %>% ggplot(mapping = aes(ht1, ht2)) + 
  geom_point()
#+ geom_abline(a=1, b= 0, color = 'red', lwd = 1.0) + geom_smooth(method='lm')


#-----
# Excercise 8 
#zycosity, cohor기준으로 10개의 plot을 명시, 점선은 y=x 그래프

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
# Weight에 대하여 도식화  

b<- twinData %>% group_by(cohort,zygosity) %>%
  do(tidy(cor.test(~wt1+wt2, alternative = 'greater', data =.))) %>%
  select(cohort,zygosity, conf.low)

twinData %>% 
  inner_join(b) %>% 
  group_by(cohort,zygosity) %>% ggplot(mapping = aes(wt1, wt2, colour = conf.low)) +
  geom_point() + facet_grid(rows =vars(cohort), cols =vars(zygosity)) +
  geom_abline(a=1, b=0, color ='red',linetype="longdash")

# Exercise 10 
#gather 함수를 사용하여 ht1,ht2를 그룹지어 각 subgroup 10간의 경향성을 파악한다.

gathered_twinData <- twinData %>% gather(order, height, ht1, ht2)
gathered_twinData %>% ggplot(mapping = aes(order, height)) + 
  geom_boxplot() +
  facet_grid(cohort ~ zygosity)


# Exercise 11
#질문: 왜 (수업자료상단의)질문2를 다시 생각해봐야하는가?
#답: 총 scatterplot을 봤을때 ht1,ht2가 연관이 강한것으로 보였으나
# subgroup을 나누었을때 DZOS 이란성 쌍둥이의 경우 키가 달라보이기 떄문에 다시 가설을 검정해보야한다.


# Exercise 12
#Q)왜 쌍체비교를 해야할까?
#A) 독립 t-test검정 등분산검정이 아닌 임상시험과 쌍둥이관찰연구에서는 쌍체비교를 해야한다.
# 더 자세히 기술할 것

twin_MZFF <- twinData %>% filter(zygosity =='MZFF')
t.test(twin_MZFF$ht1, twin_MZFF$ht2, alternative = 'two.sided', paired=T) 
# 쌍체검정을 해본 결과 두 집단은 귀무가설인 ht1=th2를 채택하게된다.

twin_DZOS <- twinData %>% filter(zygosity =='DZOS')
t.test(twin_DZOS$ht1, twin_DZOS$ht2, alternative = 'two.sided', paired=T, data = twin_DZOS) # do(tidy)를 이용하여  한번에 할것 
# DZOS의 키에 대해서 쌍체검정을 실해본 결과 p-value가 매우 작아 귀무가설을 기각하고 
# 대립가설 채택한다. 결론적으로 이란성 쌍둥이의 키는 유의하게 다르다.