# 리뷰


#매트릭스 -> 벡터 변환
a = matrix(1:10,5,2)
c(a) # 매트릭스 -> 벡터로 변환 가능
c(a[,1, drop=F]) # column matrix를 vector로 변환 ??? 왜 그냥 matrix지?

# as.factor() : factor형으로 바꾸기 가능.
a = c("Tommy", "Jimmy", "jane")
b = as.factor(a)
b # Level은 알파벳으로 정렬

c(b) # 왜 숫자가 나올까? 안에 있는 Level를 오름차순으로 정렬해서


# datafram -> matrix 변호
a = matrix(10:10,5,2)
c(a[,1, drop = F])
drop(a[,1, drop = F])
a= data.frame(1,2)
a
class(a) # data frame
b = as.matrix(a)
b
class(b) # matrix

a = data.frame(1,"a",FALSE)
a
class(a) # data frame
b = as.matrix(a)
b #  as. 명령어로 강제로 변환시켰더니 다른 것도 형변환!
class(b) # matrix는 한가지 형태만 보유한다.

## 6월 27일까지 복스

a = matrix(1:10,5,2)
c(a) # 매트릭스 -> 벡터로 변환 가능
c(a[,1, drop=F]) # column matrix를 vector로 변환

# 행열 이름붙이기  colnames, rownames, paste0
a = matrix(1:10, 5,2)
a
colnames(a) = c("x1","x2")
rownames(a) = paste0("r",1:5)  # 반복문쓰기, 5개 미만이면 오
paste("r", 1:5, sep = "+") # 구분자 넣을 수 있다.

#matrix -> dataframe 변환

b = as.data.frame(a)
b
colnames(b) # colnames 도 작동한다.
names(b) <- c("v1","v2")
b

# unclass: dataframe을 list로 바꾸고 싶을때
a
b = as.data.frame(a)
b
b = unclass(b) # 리스트가 되버림. 
b              # 나는 데이터 살리고싶은데 왜 colname가 남지?
class(b)

