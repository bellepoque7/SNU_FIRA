#임채영교수님 조교수업(6월21일)
#연습문제 1 - 조교

x = matrix(c(19,70,57,17,91,90,13,78,44,51,50,22,67,16,35,73,83,100),nr=3)
print(x)


seven <-function(a){
  k <- 0
  for (a in x){                    #범위 정할 필요없이 vector처럼 x라고 하면 다 읽는다.
    if (a %% 7 ==0) k <- k+1
  }
  return(k)
}

seven(x)



#연습문제 2
# 각사람별로 Female Male Infan로 구분이되어있는데 M -> 1 F->2 I ->3으로 바꾸는 함수를 만들어라

x = c("F","M","I")
ifelse((x == "M"), 1, ifelse((x == "F"),2,3))     #if와 ifelse의 차이점은?


# 연습문제3 Female과 Male의 label를 바꾸는 코드를 작성하세요.

g = c("M","F","F","I","M","M","F")

f.index=(g=="F") #M이 있는 index만 True를 반환한다.  ????뭐ㅣㅈ이이ㅣ이이ㅣ
m.index=(g=="M")
g[f.index] = "M"  
g[m.index] = "F"

