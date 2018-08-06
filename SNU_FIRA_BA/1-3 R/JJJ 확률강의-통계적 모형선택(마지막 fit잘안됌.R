

#  7월 19일 JJJ 확률 2시간 수업

# rnorm    cf) rbeta rpois 로도 볼 수 있을것.
x = rnorm(200) # 200개의 무작위 자료를 생성
str(x)
mean(x)
sd(x)
summary(x)
boxplot(x)
abline (h = 0, col = 'darkblue')
hist(x, xlim = c(-3,3))   # 히스토 그램이 닮았다라는건
                          # 0과1 사이의 데이터를 갯수가 비중(상대빈도가
                          # 교수님것과 우리가 비슷하다. )
sum(x>0 & x<=1) / 200     # 전체 갯수중 0~1 사이의 데이터 상대빈도 갯수.
sum(x>1 & x<=2) / 200


# rgamma
y = rgamma(200,2,8)       # x, shape, rate
y
mean(y)                   # rate 가 1일때보다 1/4로 떨어진다.
summary(y)
sd(y)
boxplot(y)
hist(y, xlim = c(0,10))
sum( y>1 & y <=2) /200  

# 수학적으로 정교하게 해보자?

n = 1000000
x = rgamma(n,2,1)
hist(x, nclass = sqrt(n), col = 'lightblue', probability = T)
 #히스토그램의 껍데기 == PDF
 # 면적 == 상대빈도
mean(x>1 & x <2)     # 어느 랜덤데이터를 뽑아도비슷 : 패턴이 비슷하다.
                     # 패턴이 같다 - > 확률분포가 같다라고 얘기.
                     # 막대기를 다 더하면 상대빈도이다.



# 누적 분포함수 만들기

n = 200
x = rgamma(n,2,8)
z = seq(0,10, length = 1000)
y = c()
mean((x>-Inf) & (x<=3)) # 한쪽을 고정시켜서 보자. F(x) 누적분포와 연관

for ( i in 1:length(z))
{
  y[i] = mean((x>-Inf) & (x<=z[i]))  
}

plot(z,y, type='l')     # 실행 1번 
lines(z,y, col ='red') # 실행 2번: 위의 코드를 바탕으로 plot대신 lines만 실행

# 데이터로 정의한 누적분포함수는: -inf부터 더한다.
# 우리가 알수 있는 것은 누적분포함수가 같아도 데이터 패턴이 같다.


# 데이터와 분포함수
 # 누적분포함수를 데이터로 부터 표현.


# 확률의 계산
 # 정규분포
pnorm(2, mean =0, sd = 2)   # -inf<x<2 범위의 확률
pnorm(1,0,2)                # -inf<x<1 
# 따라서 두 값의 차가 P(1<x<2) 


# 감마분포
pgamma(Inf,1)                     # 항상 1이지.
pgamma(2,1,1) - pgamma(1,1,1)     # X~gamma(1,1) P(1<x<2) 


# 변수 2개로 패턴 만들기
n = 200
x = rnorm(n)
y = rnorm(n)
xx = x^2               #  두개의 무작위 변수를 곱해도 정규분포를 따를까?
                       # 생각해보니 이거 카이제곱 분포넹

hist(xx)               # 우리가 아는 패턴 값음??
                      # 같은 분포를 따르는 확률변수를 더하면 같은 분포를 따를까?
                      # 같은 분포를 따르는 것은  '특별한'경우
                      # 이항분포, 감마분포, 베타분포 두개 더해도 동일한 분포 안나온다.

n = 1000000
x = rnorm(n)
y = rnorm(n)
summary(x/y)
hist(x/y, nclass = sqrt(n), probability = T)

# 희귀모형 만들기

x1 = rgamma(200,2,1)
x2 = rgamma(200,2,1)
ep = rnorm(200)
y = 1 + x1 + ep
plot(x2,y)

 # 행 200 열이 10인 Matrix 만들자

n = 200                              # Y = 1 + b1x1 + b2x2 + ..+ b10x10 + E
p = 10
x = matrix(rgamma((n*p),1,2),
           n,p)
b = rep(0,p)
b[3:4] = c(1.5, -1)   # Y가 3,4 변수에 의해 결정되도록 만들려고

head(x)
y = 1 + x %*% b + rnorm(n)               # 행렬의 곱
plot(x[,1],y)

# dataframe 구조를 이용한 lm을 내보자.
rdata = data.frame(y= y, x= x)
head(rdata)
names(rdata)
sum(lm(y~1, data = rdata)$residuals^2)
fit = lm(y~1, data = rdata)
str(fit)

  # 모형목록 
fit0 = lm(y~1, data = rdata)   # 1의 위치가 b0를 의미, y를 설명하는데 b0만 사용
fit0
fit1 = lm(y~1 + x.4, data = rdata) # y를 설명하는데 b0과 x.5 사용
fit2 = lm(y~1 + x.4 + x.3, data = rdata)
fit3 = lm(y~1 + x.4 + x.3 +x.5, data = rdata)

sum(lm(y~1 + x.3 + x.4
       , data = rdata)$residuals^2)  # residual 최소제곱 추정량에서의 어떤값.

lm(y~1 + x.3, data = rdata)
lm(y~1 + x.3 + x.4, data = rdata)    # Coefficients들이 최소제곱 추정량이다.


# 훈련데이터와 예측 데이터   통계적 모형선택 부모혀 전진법


n = 100
x = matrix(rgamma(n*p,1,2),
           n,p)
y = 1 + x %*% b + rnorm(n)
vdata = data.frame(y=y,x=x)                 # fit0 에다는 모델을 vada에 넣어보자.
yhat = predict(fit1, newdata = vdata)       #1.87718의 값은 beta0에 대한 추정치.
sum((vdata&y - yhat)^2)                    # vdata&y에 정답이 있다., 제곱의 합:  얼마나
                                            # 잘했는가
# 다른 fit들도 넣어서 가장 작은 숫자가 나온것이 정답. 원래는fit2가 정답나와야하는데
# 왜 안나오냐... 