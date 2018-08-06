#List
#장점: 저장이 편리 단점: 인덱싱(속도)가 늦다.
#List 함수 반드시 써야한다.

#Array는 똑같은 간격으로 정렬하기때문에 빠르지만 
#한종류의 데이만 관리할 수 있다.


j <-list(names='Joe', salary = c(55000,1), union =TRUE)
j #다양한 길이의 Data를 관리 할수있다.

jn = list('Joe', 55000, TRUE)  #[] 없이 list함수로 만든다.
jini = vector(mode='list', length=10)  #10개 NULL 빈 리스트 생성하기


#List 참조방법
j$salary #가장 선호되는 방법
j[["salary"]]
j[[2]]  #모두 같은 결과

class(j[2])  #list 
class(j[[2]]) #numeric 안쪽의 내용 참조

#참조하기
j[[1]][1] #왜 앞에 두번 [[]]?  j[1][1]안돼나...
j

#추가 제거하기
j$hisotry <- 1:10 # 추가하면 맨뒤에 붙게된다.
j$salary = NULL # 순서가 하나씩 당겨진다.
j  #따라서 절대참조를 해야 꼬이지 않는다.

# 문제
j[1:3] <- 1:3
j
length(j)
