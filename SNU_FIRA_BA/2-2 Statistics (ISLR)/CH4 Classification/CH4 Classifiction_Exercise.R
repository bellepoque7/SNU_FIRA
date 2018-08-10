
## 임정님께,

# 안녕하세요 ㅗㅗㅗㅗ

# 박수까진 바라지 않을게 

dat = read.csv('C:/Users/renz/Documents/GitHub/SNU_FIRA/SNU_FIRA_BA/2-2 Statistics (ISLR)/CH4 Classification/excercise/mpg.csv')
str(dat)
head(dat)
dat <-na.omit(dat) # 결측치 제거
summary(dat)

mpg01 <- dat[,'mpg']
mpg01 <- (mpg01 >23.00)
mpg01 <- as.numeric(mpg01)

newdat = cbind(mpg01, dat) # Auto랑 붙이라 했는데 5개 관측치차이남


# NDA

train= (newdat$year%%2 == 0 )
odds = newdat[!train,]

library(class)dd


# QDA

# 다중로지스틱 회귀


# KNN