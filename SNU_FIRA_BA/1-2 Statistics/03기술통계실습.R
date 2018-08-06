# 기술통계 -1  그래프 그리기
# 기술통계는 통계작업을 하기전에
# 다양한 방법으로 펼쳐봄으로써 보는것이다.


?VADeaths
barplot(VADeaths, beside = TRUE,col = c("lightblue", "mistyrose", 
                                        "lightcyan","lavender", 
                                        "cornsilk"),legend = rownames(VADeaths), ylim = c(0, 100))
title(main = "Death Rates in Virginia", font.main = 4)

#원그래프
pie.sales <- c(0.12, 0.3, 0.26, 0.16, 0.04, 0.12)
names(pie.sales) <- c("Blueberry", "Cherry","Apple",
                      "Boston Cream", "Other", "Vanilla Cream")

#기본
pie(pie.sales)
title(main = "Sales", font.main = 4)

#원그래프 크기, 방향  / 잘 안그려

pie(pie.sales, radius=1, clockwise=T)  #radius는 크기, clockwise는 방향순서
title(main = "Sales", font.main = 4)
legend('topright',names(pie.sales), cex =0.7, fill = rainbow(length(pie.sales))) # 범례

#연속형
#히스토그램
data("faithful")
x<-faithful$eruptions
hist(x)

hist(x, breaks=20)                 # 정수는 그만큼의 갯수가 나옴.
                                     # 벡터를 넣으면 구간을 설정가능
hist(x, breaks=20, freq=FALSE)     # 히스토그램은 다 합했을때 1이됨
                                   # freq=F하면 상대빈도가 됨
#계급구간 길이의 중요
par(mfrow=c(1,2))                    #반드시 기억! 그래프 나타내는 창옵션 행 1개 열 2개
edge1<-seq(from=1,to=6,by=0.4)      # x 축을 나누는 방법 2가지
edge2<-seq(from=1,to=6,by=1)     
hist(x,breaks=edge1,freq=F,xlim=c(0,6),ylim=c(0,0.6),main="h=0.4")
hist(x,breaks=edge2,freq=F,xlim=c(0,6),ylim=c(0,0.6),main="h=1") # 2번째 보다 첫번째가 더 좋다.

#줄기-잎 그림
stem(faithful$eruptions)

#산점도
plot(iris$Petal.Length,iris$Petal.Width,xlab='Sepal.Length',
     ylab='Sepal.Width',cex.lab=1,cex.axis=1,type='n',cex=2)  # type=n 아무것도안뜸
points(iris$Petal.Length[iris$Species=='setosa'],
       iris$Petal.Width[iris$Species=='setosa'],col='red',lwd=2)
points(iris$Petal.Length[iris$Species=='versicolor'],
       iris$Petal.Width[iris$Species=='versicolor'],col='blue',lwd=2)
points(iris$Petal.Length[iris$Species=='virginica'],
       iris$Petal.Width[iris$Species=='virginica'],col='green',lwd=2)

# 기술통계 -2
# 기술통계 중 데이터 분석을 할때 항상하는 것

# 평균 분산

n=length(faithful$eruptions)
sum((faithful$eruptions-mean(faithful$eruptions))^{2})/(n-1) #표본 분산
var(faithful$eruptions) # 위랑 똑같은 내장함수

sqrt(var(faithful$eruptions)) # 표본표준편차
sd(faithful$eruptions)        # 같은 공식

#분위수                      # 아웃라이너가 많거하 한쪽의 치우쳐 있는 경우가 많음
pquant=quantile(faithful$eruptions,probs=c(0.25,0.5,0.75)) #함수 quantile: 4분위수 3개 구하겠다.
pquant
pquant[3]-pquant[1]
IQR(faithful$eruptions) #3사분위수와 1사분위수의 차이 -> 아웃라이어 확인할때 씀

max(faithful$eruptions)-min(faithful$eruptions) 
rfaithful=range(faithful$eruptions)  #최소, 최대도 알려줌
rfaithful[2]-rfaithful[1]

#outlier detection
iqr.val=IQR(faithful$eruptions)   #[Q_1-1.5IQR, Q_3 + 1.5IQR] 밖의 값은 모두 아웃라이어
c(pquant[1]-1.5*iqr.val, pquant[3] +1.5*iqr.val) # 같은 뜻

#아웃라이어 밖에 있는지 확인해보자 -> 없다.
faithful$eruptions[faithful$eruptions > pquant[3] +1.5*iqr.val] 
faithful$eruptions[faithful$eruptions < pquant[1] -1.5*iqr.val]
apply(faithful, 2, summary) #데이터에 각 변수별로 요약하라는 함수
summary(faithful$eruptions)   

#Boxplot                                    #summary의 그림버전
par(mfrow=c(1,2))
boxplot(faithful$eruptions,main='Eruptions')
boxplot(faithful$waiting,main='Waiting')

#왜도, 첨도
 
 #이론적인 베타 분포
xvec=seq(0.01,0.99,0.01)          # 왜도: (쏠림) 바깥에 쏠려있는 데이터를 잡겠다.
par(mfrow=c(1,2))                 #  
plot(xvec,dbeta(xvec,2,5),type='l',lwd=2,xlab='',ylab='') 
plot(xvec,dbeta(xvec,7,2),type='l',lwd=2,xlab='',ylab='')


 # 실제 데이터 분포로 해보겠다.
x1= rbeta(1000, 2, 5)             # 베타분포: 한쪽으로 쏠린 분포 / 0~1 사이만 있다.
x2= rbeta(1000, 7, 2)             # 7,2에서 1000개를 뽑겠다...?
(sum((x1-mean(x1))^3)/length(x1))/(var(x1))^{3/2}  #왜도의 다른표현
(sum((x2-mean(x2))^3)/length(x2))/(var(x2))^{3/2}



par(mfrow=c(1,1))            # 정규분포보다 t분포가 더 꼬리가 두껍다.
xvec=seq(-4,4,0.01)          # 4제곱이여서 음,양은 없다.
plot(xvec,dnorm(xvec,0,1),type='l',lwd=2,xlab='',ylab='', main="Normal and t-distribution")
lines(xvec,dt(xvec,2),type='l',lwd=2,lty=2, col='red')
x1= rt(1000, 2)
(sum((x1-mean(x1))^4)/length(x1))/(var(x1))^{2} -3  # 표분정규분포의 첨도가 3이여서 3을 뺌.
                                            #빨간색이 t분포, 검은색이 정규분포
                                            # 자유도 2인 t분포는  첨도는 106
                            # 첨도는 아웃라이어의 지표.
                      

#이변량
x= faithful$eruptions; y= faithful$waiting
cov(x,y)/(sd(x)*sd(y))       # cov:  1이다  -> 양의 상관관계
cor(x,y)                     # cor: 1이면 양의 상관관계 
plot(x,y,xlab='',ylab='')

#원그래프에 숫자 표시
piepercent<- round(100*pie.sales/sum(pie.sales), 1)
pie(x=pie.sales, labels=piepercent,col=rainbow(length(pie.sales)))
title(main = "Sales", font.main = 4)
legend('topright', names(pie.sales), cex = 0.7, fill=rainbow(length(pie.sales)))
