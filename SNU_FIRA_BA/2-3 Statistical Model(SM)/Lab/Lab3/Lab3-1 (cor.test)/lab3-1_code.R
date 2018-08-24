#####################################################################################
#                           Many statistical analyses                               #
#                                   2018.08.22                                      #
#                   Instructor : Sungkyu Jung, TA : Boyoung Kim                     #
#                                                                                   #
#####################################################################################



#--- Australian twin sample biometric data

library(tidyr)
library(dplyr)

#install.packages("OpenMx")
library(OpenMx)
data(twinData)
twinData <- as_tibble(twinData)

help(twinData)


#scatter plot
attach(twinData)
library(ggplot2)
twinData %>% ggplot(mapping = aes(ht1, ht2,colour = cohort)) + 
  geom_point() 

#check correlation
cor(twinData$ht1, twinData$ht2, use="complete.obs")

#test whether two variables are correlated # pvalue가 유의하다.
twinData %>% 
  with(cor.test(~ ht1 + ht2, alternative = "greater"))

#test for each subgroup
twinData %>% 
  group_by(cohort,zygosity) %>% 
  summarize(cor.test(~ ht1 + ht2, data = .))
#cor.test결과는 리스트형태로 나오기때문에 summarize는 vector를 받아야해서 오류난다.




#--- Combine results from multiple analyses using broom

library(broom)
cor_result <- cor.test(~ ht1 + ht2, data = twinData)
tidy_cor_result <- tidy(cor_result)

str(cor_result) #list

str(tidy_cor_result) #data frame summarize 할수있는 형태로 바꾸어짐.

# summarize() must be of the form "var=value" length가 1이여야한다.
twinData %>% 
  group_by(cohort,zygosity) %>%  
  summarize(tidy( cor.test(~ ht1 + ht2, alternative = "greater" , data = . )))

# do() returns either a data frame or arbitrary objects
twinData %>% 
  group_by(cohort,zygosity) %>%  
  do(tidy( cor.test(~ ht1 + ht2, alternative = "greater" , data = . )))

