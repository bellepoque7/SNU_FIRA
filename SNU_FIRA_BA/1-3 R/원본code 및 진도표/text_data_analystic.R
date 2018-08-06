
# 전종준 교수님 홈페이지
# html는 기본적으로 트리 구조이다.
# body node에 nav, footer child 등이 있다.
# 어떤 태그로 따라가기위해서는 족보처럼  트리를 따라가면된다.
# body는 내용을 담는 곳이다.

# a tag는 꼭 있어야한다. hyper ref를 연결해주는 프레임이다.
# html 기본 구조는 알아야지 Web scraping 할때 편하다.

# 웹페이지를 들어가는 순간 
# 나의 컴퓨터에는 웹에 대한 내용을 가지고 있다. (temporary 형태를 보는 것)
# 해킹이 아닌 이미 확인한 자료를 가져오는 것이다. (파일로 저장하지말고 메모리로 가져오자)

# 함수 2개 소개 realine, file

?readLines   # connection. 하드디스크 에있는 것을 가져온다? 
 # file pointer 를(저장 되어있는 물리적위치)를  가지고 있는 곳
 # connection은 하드디스크에 있는 파일 뿐 아니라 임시URL에도 연결할 수 있다(실제는x)
?file # file에 대한 connection을 관리하는 것?//?


con <- url('http://ranking.uos.ac.kr')  # R입장에서는 그냥 chr vector일 뿐
a <- (readLines(con))  #컴퓨터한테 정보를 달라고 하는것 readLines
close(con)             # 파일은 꼭 닫아주어야하고요.
head(a)
a[10:30]   # 모든 웹페이지가 이렇게 쉽게 크롤링이 될까? -> 그건 아니다.


# 받아올수 있는 방법 2개  
# get: 요청을 URL형식으로 써서(뭐 필요하고 등등) 주소형식으로 요청
# 단지 chr vector로 가지고 오는 것이기 떄문에 편집이 매우 쉽다.

# post: 신청서가 있는 형태.

# 번외) API: 너무 퍼가니까 아예 서버를 하나 만들어줄께 우리가 주는거 가져가~
#      but 제한적인/기본적인 사항만 준다.(get, post 둘다 있다)

# Package 2가지
# httr : 
# rvest: 특정위치를 딱 집어낼때. atag 밑에 있는 것을 가져올때.

# 가장 유명한 모델은 Bags of the words model
# 단어 풀을 풀어놓는다. 
# 단점은 단어간의 순서를 잃어버린다는 단점
# 따라서 cat chased, chased the 등  단어를 N개 붙여서 모으자
# N-gram model의 특별한 형태...

# 단점이 또 하나더있는데 the, have 와같은 단어가 급격히 많아진다.
# inverse document frequnecey  -> 너무 많이나오는 단어는 벌점을 먹도록 설계 (로그)

# 문장의 유사도를 재는 방법
# 1. 코사인 측정
# 2. 유클리드 거리

# 연관성 분석 &   군집 분석이 따로있다 -> 2학기때  데이터마이닝 분석할