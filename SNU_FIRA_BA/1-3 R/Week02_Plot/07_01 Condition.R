# 07. programming
# 로직..로직을 보자.
# conditional Statement


# and: &
# or: |
# not : !

a = 1
b = 0
if (a<2) {b = b+1}
#condition이 True일때만 중괄호의 statement를 실행.

a = 0
set.seed(1)
x = runif(1) 
x > 0.5
if (x > 0.5) 
{
  a = 1
}


# conditional statemnet 2
a = 3 
b = 0
if (a<2) #conditional이 True이면 if문 실행, 아니면 else문 실행
{
  b = b+1
} else{      #중괄호 바로 뒤에 있어야함.
  b = b-1    #Interpreter 언어이기 때문에 한줄이 완성되면 실행함.
}            #else로 시작하는 함수는 없기때문에 혼자띄어놓으면 틀린 것임.
a
b

# Loop: for -> index argument -> statement 로 구성되어있음.
# index argument는 (variable in vector)로 구성되어있음.
# vector의 길이만큼 반복 될 것.
a = 0
for (i in 2:4) {a = a+1}# 3번 반복, i는  2,3,4 의 값을 가지게 된다.
a

x = 0
v = c(2,4,6,8)
for (i in v) { x = x + i } 
x

# Double Loop

x = 0
for (i in 1:3){for (j in 1:2) { x = x +i+j}}

# Loop control 하기
# 1. break:  break statement 만나면 break문 포함한 루프 탈출.
# 2. next: loop 스킵하기 (python에서 continue)
# 3. stop: stop statement만나면 All loops 멈추기


# while 문: while(condi){statement}
# condition이 True이면 statement 실행
# condition이 False이면 실행 안하고 while 종료.

i = 1
while(TRUE)
{
  i = i + 1
  if (i>=1000) break
}
i


# for while의 차이

for(i in 1:100) # 100대까지만 팬다
{
  hit()
  if(confession()) break
}

while(!confession()) #자백할 때까지 팬다
{
  hit()
  if(die()) break
}

