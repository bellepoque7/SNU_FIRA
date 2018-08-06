#Factor는 정수
#시각화에 나중에 중요함
# 언제씀? 누가 만들어놓은 함수를 보고 분석하려는데 입력값이 무조건 
# List로 들어가야할때 내가 들고있는 것은 Dataframe일때(또는 그 반대일때)
# 외부데이터가 data frame(1행 다열)인데 vector형태(다행 1열),array 형태로 바꾸고싶을때

#List 보다 dataframe 이 기능이 더 많다.column,row indexing 가능
#연습

a = matrix(1:10,5,2)
a
a[c(1,3,5),] # 1,3,5 행을 뽑아라.
a[c(T,F,T,F,T),] # 1, 3, 5행 만 뽑아라 (indexing)

# 리스트가 Dataframe보다 장점?  A) 모든것을 넣을 수 있다
# ex) dataframe은 길이가 똑같은 벡터만 넣을 수 있다.(열이 똑같은 길이를 가져야함) 
# 리스트는 그럴 필요 없음. 
# 매트릭스는 자동 형변환이 일어남( drop옵션 필요하다)



x <- c(5,12,13,12)
x
xf = factor(x)
xf
str(x) #내부 구조를 보여주는 함수
unclass(xf) #클래스의 속성들을 다뻄
as.numeric(xf) #numeric으로 casting (강제한다)
typeof(xf)
class(xf)

cand = c("Jack", "Jill", "nick", "richard")
a = c("Jack","nick","richard","Jack","richard")
table(a) #사람은 Jill이 존재하는 것을 알지만 데이터에선
#없기에 Jill이 존재하지 않는다 -> 제로ㅋ운터

af = factor(a,levels = cand)
af
table(af) # a에는 Jill이 없으나 levels를 지정해주어
#Jill이 있음을 알려주며 factor형을 변환


