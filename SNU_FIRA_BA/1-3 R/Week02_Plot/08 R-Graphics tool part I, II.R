View(mtcars)
str(mtcars)

mtcars$cyl <- factor(mtcars$cyl)   # cyl를 factor로 변
str(mtcars)                        # 변환 완료.

names(mtcars)   # 속성 이름값들 도출
attach(mtcars)  # 데이터 참초 바뀔수 있어 거의 사용 X 근데 왜안ㄷ <-> detach
detach(mtcars)

head(mtcars, n =2) # 2줄만 보여달라.
plot(mpg ~ disp, data = mtcars)   # 앞쪽은 y 뒤쪽은 x
a = "mpg ~ disp"
plot(a, mtcars) # 에러 반환.

a_f = as.formula(a)  # a의 data type을 formulat로 바꿔라.
class(a_f)
plot(a_f, mtcars)

?plot

#실습예제
plot(hp ~ disp, mtcars)


set.seed(1)
x = rnorm(100)
y = 2+2*x + rnorm(100)
plot(x,y, main = "plot (x-y)")

?rnorm


x = seq(-2,2, length =10)
y = x^2
plot(x,y, type = 'b',lty = 3, pch = 19, main = "y = x^2")
?pch


plot(x = 1:25, y = rep(0,25), pch= 1: 25)

plot(x,y, type='b', lty =3, pch =2, col='blue', main = 'y = x^2')
colors()

plot(x,y, type = 'b', xlab='xx', ylab='yy', xlim = c(-1,1),main = 'y = x^2')

plot(~mpg+disp+drat, data=mtcars,
     main ="Simple Scatterplot Matrix")

set.seed(100)
x = rnorm(100)
y = 2 + 2*x + rnorm(100)
plot(x,y, pch = 20, main = 'scatter plot')
abline(a = 1, b = 2, col = 'red')
abline(v = 1, col = 'blue')
abline(h = 1, col ='green')

plot(x = 1, y = 1, type ='n', xlim = c(0,10), ylim = c(0,5),
     xlab = 'time', ylab = '# of visiting')

x = 0:10
set.seed(1)
y = rpois(length(x), 1)
points(x,y, type ='s')
x
y
points(x,y) # 점 찍히는 순서는 포인터 원소순으로 찍힌다
points(x,y, col = 'blue', type = 's')
points(x,y, col = 'red', type = 'l')


x = 0:10
set.seed(1)
y = rpois(length(x), lambda = 1)
plot(x,y, type ='b', xlab = 'x-variable',
     ylab = 'y-variable', main = 'y = x^2',
     xlim = c(-1,1), ylim = c(-1,1))

#excercise
plot(mpg~disp, data = cars, xlab = 'displacement', ylab = 'mile/gallon',
     main = 'scatter plot', pch = 20, col = 'darkblue')


#lines
plot(0,0, type = 'n', xlim=c(-2,2), ylim = c(-2,2))
x = c(-2,1,  0,  1, 0)
y = c(0, -1, 2, -2, 1)
lines(x,y)

# lines with NA  # 끊어서 그래프 그리기.
plot(0,0, type ='n', xlim = c(-2,2), ylim = c(-2,2))
x = c(-2,1,NA,1,0)
y = c(0,-1,NA,-2,1)
lines(x,y)

plot(0,0, type ='n', xlim =c(1,5), ylim = c(0,2))
print(length(x))
abline(v = x, lty = 1:length(x))

# legend
z = sort(rnorm(100))
y1 = 2 + x + rnorm(100)
plot(z, y1, col ='blue', pch =3)
points(z, y1/2, col = 'red', pch = 19)
legend('topright', c('pch_3', 'pch_19'), col = c('blue','red'),
       pch = c(3,19))

?par

#par

par(mfrow = c(2,2), bg = 'gray50', col ='white',
    col.main = 'lightblue', col.axis = 'yellow',
    col.lab = '')

set.seed(1)
x <- sort(rnorm(100))
y <- 3+x^2 + rnorm(100)
plot(x,y, pch = 20)

#Regression
fit = lm(y~x)
coef = fit$coefficient   #Chain중에 하나만 뽑아오기.
coef[2]
abline(a = coef[1], b =coef[2],
       col ='red')   #회귀직선 올리기.
yTrueMean = 3+x^2
lines(x, yTrueMean, lty=2, col='black')
#근데 회귀직선이 잘 반영못하는 듯하다.

#kNN 방법 적용

install.packages("FNN")
library(FNN)
knnx.index(x,0,k =10)  # 근처 10개 값 인덱스 뽑아내기

idx <- c(knnx.index(x,0,k=10))
idx

yhat <- mean(y[idx])   #평균내서 y값 추정구하기
yhat

eval.point = 0
plot(x,y, pch = 20)
abline( v= 0, col ='black')
idx <- c(knnx.index(x,eval.point, k = 10))
points(x[idx],y[idx],col ='red', pch =20)
abline(h=mean(y[idx]), lty =2, col ='red')
mean(y[idx])

# 전체 영역에 대하여 yhat 구하기
eval.n = 100                                             #100번 반복
eval.point = seq(-3,3, length = eval.n)
plot(x,y, pch =20)
idx.mat <- knnx.index(x, eval.point, k =10)             #주변에 k개만큼 읽어라
yhat = rep(0,eval.n)                                    # k가 너무크면 빨간선이 일자.
for(i in 1:eval.n) yhat[i] <-mean(y[idx.mat[i,]])
lines(eval.point , yhat, type = 'l' , lty =2, col='red')
 #???