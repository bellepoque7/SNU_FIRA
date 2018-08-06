#JJJ Data Object in R
#Vector
#실습

set.seed(1)
n = 10000
y = runif(n)  #Random숫자 생성
length(y[y>0.5]) / n   # 대수의법칙, 숫자가 많아질수록 평균에 가까워진다.

#실습 NA와 which

x = c(1:4,NA,5:8)
x
x[which(x<=4)] # NA가 포함이 안된다.  NA값은 유의해야한다.
x[x<=4]  # NA가 포함된다.

typeof(NA)
NA*TRUE  #NA반환
NA*FALSE #NA 반환


# %in%로 해당하는 내용만 뽑아내기
x = c(3,1,4,1)
x %in% c(2,1,4)
x[x %in% c(2,1,4)] #True만 꺼내기.

#NA는 Logical임. NA와함께하는 모든 연산은 NA반환

is.na(NA) #유일한 NA찾는 방법
1:4 > NA
sum(c(1:4,NA), na.rm = T) #NA 모든 값은 제거해

#Inf(무한대) 무조건 True
Inf>100
Inf>Inf  #이것만 False
Inf - Inf #정의가 안됌 NaN
0/0

# match: 찾아서 위치를 반환, 없으면 NA반환
x<-c(3,1,4,1)
match(x,c(2,1,4))


#중복되는 내용있는지 확인하기 
x = rep(c("a","b",4),4)
x
length(unique(x)) == length(x) #unique FALSE 반환: 중복되는 내용있다는
#unique 중복되는 것 제거하기.


