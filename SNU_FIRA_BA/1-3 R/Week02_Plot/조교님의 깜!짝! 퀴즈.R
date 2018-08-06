1. a와 같은 형태의 1000X1000 matrix만들기
2. 벡터를 넣으면 누적을 계산하는 함수 my_csum
3. 균등분포 (0,1)에서 난수 1000개를 뽑아 누적 평균을 구하고 그래프를
그리기

x = rep(0, 1000)
y =rep(0:1, 500)
y
a = matrix( c(x, y), nrow=1000, ncol=1000, byrow = F)
nrow(a); ncol(a); dim(a)
a[1:6,1:6]

# 2번 누적합을 계산하는 함수

x = c (1,2,3,4)
length(x)

sumfunction = function(x)
{
  i = 1
  for (i:length(x))
    {
    x[i+1] = x[i+1] + x[i]
    }
  print(x)
}
sumfunction(1:5)



# 해설

1. 
a <- matrix(0, 1000,1000)
a[2*(1:500), 2*(1:500)] <-1   #??? 개쉽네 
a[1:6, 1:6]

b <- matrix(0, 10,10)
b[2*(1:5), 2*(1:5)] <- 1
b

2. 누적합
my_csum<-function(x){
  n<- length(x)                  #csum함수 써더된다..
  xcsum<-vector("numeric",n)
  if(n==1) return(x)
  xcsum[1]<-x[1]
  for( i in 2:n){
    xcsum[i]<-xcsum[i-1]+x[i]
  }
  return(xcsum)
}
my_csum(1:5)

3. 
my_csum(1:5)
y = my_csum(runif(1000)/(1:1000))
plot(x=1:1000, y, type='l')
