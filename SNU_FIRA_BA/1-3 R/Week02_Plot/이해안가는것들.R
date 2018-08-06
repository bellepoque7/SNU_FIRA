a = rep(1:3,1:3)
a
length(a)
6 != 7
6 == 7
z = c(5,2,-3,8)
z
z^2 >8
NA > 0
NA < 0 
(1:3)[c(T,NA,F)]
(1:3)
(1,2,3)[c(T,NA,F)]
(1,2)[c(T,NA,F)]
(1:3)[c(T,NA,F)] # 이거 무슨 뜻이지..?
z[z^2>8]
x = c(3,1,4,1)
x[x>5] # numeric(0) 이란?  없다는 뜻
x[x>3] # 4만 나온다. (숫자 그자체 반환)
which(x>3) # 3이 나온다(3번째 인덱스)
(1:3)[which(c(T,NA,F))] # NA를 안 뽑는다. 왜??
1 %in% c(2,1,4) # 들어있는지 확인

y = matrix(c(1,2,3,4))
length(y)
a = c(1,2,3)
a[c(T,F,T)]

a = matrix(1:10,5,2)
a
c(a) # 매트릭스 -> 벡터로 변환 가능
c(a[,1])
class(a)  #???? 그냥 matrix로 나오는데?
c(a[,1, drop=F]) # column matrix를 vector로 변환 drop =T: matrix -> vector
class(a)

# 행열 이름붙이기  colnames, rownames, paste0
a = matrix(1:10, 5,2)
a
colnames(a) = c("x1","x2")
rownames(a) = paste0("r",1:5)  # 반복문쓰기, 5개 미만이면 오
a
paste("r", 1:5, sep = "+") # 구분자 넣을 수 있다.
a
#matrix -> dataframe 변환

b = as.data.frame(a)
b
colnames(b) # colnames 도 작동한다.
names(b) <- c("v1","v2")
b

# unclass: dataframe을 list로 바꾸고 싶을때
a
class(a)
b = as.data.frame(a)
b
b = unclass(b) # 리스트가 되버림. 
b              # 나는 데이터 살리고싶은데 왜 colname가 남지?
class(b)


x = 0

for (i in 1:10) 
{
  for (j in 1:2)
  {
    x = x +1
    (x>1){break()}
  } (x>6){stop()}
}
