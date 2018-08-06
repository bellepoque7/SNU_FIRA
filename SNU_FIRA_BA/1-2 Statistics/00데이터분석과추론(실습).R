oddcount <- function(x) {
  k <- 0 #assing 0 to k
  for (n in x) {
    if (n %% 2 == 1) k <- k + 1 # %% is 나머지 반ㅎ
  }
  return(k)
}

oddcount(c(1:4, 5, 7))  # argument가 뭐지?? 

a = c(1:4, 5,7)
print(a)

x=1:12
print(x)
x=x[c(1:9,12,11,10)]
print(x)
x = x[c(-11:-10)] #-는 빼라는 명령어인데.. 11, 10 빼라는건가?
print(x)

x = matrix(1:10, ncol=5, byrow=T)
print(x) 



set. seed(10)  #시드를 설정한다?, 난수표의 같은 열에서 뽑아서 -> 랜덤에서 뽑아도 같은결과
a=sample(1:200, 20)  # 1~200중에 20개를 랜덤하게 뽑아라 왜 20개 안뽑냐..
print(a)

x[x%%2==0] # []는 인덱스, 짝수의 index 는 True니까 반환하고 False 반환 x




set.seed(10)
x = sample(1:200, 20)
print(x)

x[x%%2 ==0]


x = matrix(c(7,10,5,2), nr=2)  #nr=2  dj
x %*% x; 3*x
print(x)

b = matrix(2:5, nc=2)
x + b

b = matrix(1:6, nr=3)
print(x+b)

x = matirx(c(2,4,5,1,0,0,1,1,2), nr=3)
x[1,2:3]
