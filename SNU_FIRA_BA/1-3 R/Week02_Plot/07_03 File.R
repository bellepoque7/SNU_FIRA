#File
# R의 강력한 기능중하나

getwd()  # 현재 작업위치보여주라
setwd('./fig')  # 폴더내의 fig라는 폴더로 경로를 지정하겠다.
setwd('..../block/source/1.png') # 상위x2의 block/source/1.png 경로로


#read.table

CO2 #내장 데이터
str(CO2)
View(CO2)

save.image #저장하기 
load.image #찍혀있는 것을 메모리 상으로 가져오자.
# 분석은 R로 하되 출력은 모든 사람이 볼수 있는 CSV로 바꾸기.

write.csv(CO2, file = 'CO2.csv') # 열 이름 삭제해벌임
                # 'write 명령문은 #으로 비활성화 시켜놓을것.
a = read.table("CO2.csv")
str(a)
a = read.table("CO2.csv", sep = ";", header = T, stringsAsFactors = F,
               colClasses = c("charater", "factor"))

a = list.files()
a
b = list.dirs(recursive = F)
b

library(xlsx)
install.package('xlsx')

head(CO2) #헤드만 출력하기.
str(CO2) #주절주절 설명이 많다.  Dataframe인것 확인 가능.
a = read.csv('CO2.csv', header = T) #데이터 읽기 너~무 쉽다아.
a
