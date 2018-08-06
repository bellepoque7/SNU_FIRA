#Dataframe


#Dataframe 의 탄생배경 -> 다른 형태의 데이터를 관리하고싶다.
x = 1:10
typeof(x[1])
x[1] = "a"   #int로 정의된 곳에 문자열을 넣으면 
typeof(x[2]) #모든 type이 바뀐다. 서로 유형이 다르면 빠른 접근에  문제가 생기니까

x = matrix(1:4,2,2) #Matrix로 vector기반이기 때문에 비슷할듯
typeof(x[1])
x[2,2] = "b"
typeof(x)   #똑같이 모두Char로 바뀐다.

#DataFrame 만들ㄱ
kids = c("Jack", "Jill")
ages = c(12,10)
d = data.frame(kids,ages,stringAsFactors=F)
d
str(d) #d의 구조를 보여달라.
기
#Selecting the elements
d[1,] 
class(d[,1])
class(d[,2])
class(d[1,]) #dataframe 반환 (각기 다른 형태를 뽑게 되므로)
d$ages  # d의 ages열을 참조 $를 통해 뽑을수 있다.
class(d$ages) # 
names(d)  #이름만 뽑기

A = data.frame(x1 = rep(0,10), x2 =rep('b',10))
A
B = data.frame(x3 = rep(1,10), x2 =rep('b',10))
B
AB = cbind(A,B)  #가로로 붙이기..  행이 같은것을 붙인다랄까?
AB
AB = rbind(A,B) #가능할까? variable이 달라서 붙일수가 없다.
