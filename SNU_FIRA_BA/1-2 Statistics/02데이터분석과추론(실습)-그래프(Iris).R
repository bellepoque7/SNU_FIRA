#그래프 그리기
#Iris 데이터
?iris  
data(iris)
str(iris)  #150개 관측지 변수는 5개.
summary(iris)  #가장 적은값, 평균 등이 나온다.

#R plot 그리기
plot(iris$Sepal.Length)      #x축은 index 여기서는 150개이다.
plot(iris$Petal.Length)
?plot

#x,y 값 설정 #xlin 2~10: 2~10까지만 표시해라 / 전체 범위 설정가능
plot(x=iris$Sepal.Length, y=iris$Petal.Length)  #plot help보기기, x,y는 생략해도 괜ㅊ
plot(iris$Sepal.Length, iris$Petal.Length, xlim=c(2,10), ylim=c(0,8))  


#축제목, #xalb으로 축 제목 변경가능
plot(iris$Sepal.Length, iris$Petal.Length, xlab="Sepal Length", ylab="Petal Length")  

#그래프 제목 Main으로 변경가능
plot(iris$Sepal.Length, iris$Petal.Length, xlab="Sepal Length", ylab="Petal Length", main="Iris sepal-Petal Length")


#그래프 점 크기
plot(iris$Sepal.Length, iris$Petal.Length, cex=0.5)  # 1이 기본

#그래프 점 모양  #구글에 R plot pch -> 점모양 
plot(iris$Sepal.Length, iris$Petal.Length, cex=0.5, pch = 8)

#점 색깔 #col
plot(iris$Sepal.Length, iris$Petal.Length, cex=0.5, col=2) #검은색이 기

#그래프 타입
plot(iris$Sepal.Length, cex=0.5, type='l')

# 그래프 창 설정
oldpar = par()    #par() 콘솔창에 치면 그래프 설정 목ㄹ
par(mfrow=c(2,2))   # 한창에 여러개 그래프  # 창을 2,2로 나누겠다. 
plot(iris$Sepal.Width, ylab="", main="Petal Length")  #y축 이름 없애기
plot(iris$Sepal.Length, type="l", ylab="", main="Petal Length")
plot(iris$Sepal.Length, col=2, type='l', lty=2, ylab="") #lty: line type     
plot(iris$Sepal.Width, lwd=3, type='l', lty=3,ylab="") #lwb: 라인넓

#같이 그리기
par(mfrow=c(1,1)) #원래 값으로 돌리기
plot(x=iris$Sepal.Length, y=iris$Sepal.Width, xlab='Sepal Length')
points(iris$Petal.Length, iris$Petal.Width, col=2)    #Points 그래프를 점을 그린
legend('bottomright', legend=c("Sepal", "Petal"), pch=c(16,1), col=1:2) 
# Bottmright는 우측하단에 위치하라는 것#lengd == 범례 pch가 Sepal에 16, Petal 1


#히스토그램
hist(iris$Sepal.Length)
hist(iris$Sepal.Length, breaks=20, freq=F)  
#breaks 벽돌갯수, Freq=T이면 빈도수로 F면 denseity로 나온ㄷ

#막대그래프
iris.eman=tapply(iris$Sepal.Length, iris$Species,mean)
barplot(iris.mean)
