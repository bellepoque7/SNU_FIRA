# function()
# function은 arguments와 statement로 구성됨.
# function마지막에는 객체의 값 또는 객체 그 자체를 return()을 사용하여 반환
x1=4
x2=6

testfunction = function(x1,x2) #Local 변수 / Global 변수랑 구분할것
{
  v1 = x1^2 + x2
  v2 = x1^2 - x2
  return(c(v1,v2))
}
testfunction(x1=1, x2=2)

x1  #Global 변수는 바뀌지 않음.
x2

# function은 list를 반환할수 있음
testfunction = function(x)
{
  v1 = x^2
  v2 = matrix((1:5)^x, 1,5)
  return(list(first=v1, second=v2)) # cf) 어떤경우든 return만나면 끝남.
}
testfunction(2)


# column average function
s_colMean = function(x)
{
  if ( class(x) != "matrix") # matrix만 받겠다!
  { 
    print("Beep!")           # 들여쓰기 맞춰주어야 작동한ㄷ.
    stop()  
  }
  v = rep(0, ncol(x))         #저장의 공간 미리 확ㅂ
  for ( i in 1:ncol(x))
  {
    v[i] = mean(x[,i])        #유인물이랑 다름
  }
  return(v)
}
s_colMean(2)
a = matrix(1:10,5,2)
a
s_colMean(a)  #왜 안나오니... ???
