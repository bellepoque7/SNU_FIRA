

# 선형대수 기본.

n = 1000
x = 1:n
y = (1+1/x)^x
plot(x,y, type = 'l', ylim = c(2.6, 2.8))
abline(h=exp(1), col = 'red')

x = 0.1
x = seq(-1, 1, length = 100)
beta_0 = 1
beta_1 = -2
plot(x,exp(beta_0 + beta_1*x), type = 'l', ylim = c(0,5))
abline(h=0, lwd = 2, col = 'blue')
abline(v=0, lwd = 2, col = 'red')     

set.seed(1)
A = matrix(runif(15),5,3)  # runif: 랜덤 숫자 넣어주기
A[,2]
A[,2,drop =F]
A[4,]
A[4,,drop = F]
t(A)

X = matrix(c(1,3,0,0,1,2,5,-1,4,-2,3,0),3,4)
X
X_t = t(X)

dim(X_t)
dim(X)
A = X_t %*% X # 행렬과 행렬 전치의 곱은 항상 정방행력
A

x = matrix(c(1,0,0.5))
x
sig = matrix(c(1,0.5,0,0.5,1,0.3,0,0.3,1),3,3)
sig

u = matrix(c(0,1,-1))
u

x-u
t(x-u)

exp(-0.5*t(x-u) %*% solve(sig) %*% (x-u))
#우헤헤헤ㅔ마자따



#확률 분포함수 포아송 분포그리긔
?ppois
x = seq(0,10, length = 1000)
y = ppois(x, lambda = 1)
plot(x,y, type = 's')
abline (h = 1, col='red', lty =2)


# 정규분포

n = 1e+4
z = rexp(n)
x = c()
for (i in 1:n)
{
  idx = sample(1:n, 25)
  x[i] = mean(z[idx])
  
}
hist(x)


#결과 : 분산만 무한하면 똑같은 형태를 가진다. 


# 중심극한 정리 실험

n = 1e+4
 z = runif(n)
x = c() # 껍데기 하나 비우기.

  for ( i in 1:1000)
{
  idx = sample(1:n, 25)
  x[i] = mean(z[idx])
  
  }
hist(x)
# 25개를 랜덤하게 1000번 뽑아서 평균을 내자 runif를쓰던 rexp를 쓰던 rpois 쓰던 다 비슷함
?rexp
?runif

gamma(3.1) # 알파 - 1 factorial을 값이 나오는것이다.
?dgamma

plot(x, dgamma(x, shape = 2, scale = 0.5))


det(t(x) %*% x)



# 다변량 정규분포
install.packages(('mvtnorm'))
library(mvtnorm)
n = 50
mu.vec = c(-1, 1/2)  # 1은 x1의 평균, 1/2 은 x2의 평균
Sigma.mat = matrix(c(1,1.5,1.5,2),2,2) # 1.5는 왜 안될까아아?? 
            # ad-bc를 0으로 만드는 값은 공분산이 루트2. 따라서 1.4보다 높으면  안그려짐..
            # 다변량 정규분포를 쓰는순간 다른 모델은 놓치기 때문이다.
# 어떤 특성을 나타내는가? 다변량 정규분포는 선형적으로 상관관계있는것. (변동이 있는것은 표현X)
x1 = x2 = seq(-3,3, length =n)
z <- matrix(0,n,n)
for (i in 1:n)
  for (j in 1:n)
    z[i,j] <- dmvnorm(c(x1[i],x2[j]), mu.vec, Sigma.mat)
contour(x1,x2,z)

# 가운데는 뭘까? 그래프에서?  mod인데 mod와 평균이 일치하므로 평균값이다. 

?integrate
