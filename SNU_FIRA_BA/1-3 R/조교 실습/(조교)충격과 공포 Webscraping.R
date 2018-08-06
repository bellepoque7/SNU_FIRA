# 웹페이지 구조는 계속 바뀐다. 코드도 계속 바꾼다.
# 크롤링은 계속 유지보수한다 계속 코드를 바꿔야한다.
# 계속 크롤링하면 서버 과부화 떄문에 막는다 -> 우회해야한다.

# AWS X 대 등록, 4GB 사서 , 한대에서 여러개의 가상 머신(브라우저) OS를 속인다.
# win 10, 7 8, Mac ubuntu등 가상머신에다가 X I.E. chrome safari, 
# 이렇게 조합하면 다양한 사람이 쓰는것처럼  돌린다. 
# 로봇 txt 는 접근하지 않는게 좋다. (1분에 몇번 제한  안지키면 짤린다.) /
# 무리하지 않는다.
# but  어렵다. 왜냐하면 짤리면 누가 짤렸는지 확인해야한다. 다른 애가 그 페이지
# 소스를 작업해줘야한다.  -> 고난도 노동작업이며 업체에서 한다. 


install.packages("magrittr")
library(magrittr)



#  인코딩 확인하려면 html에서 캐릭터 확인
if(!require(rvest)){install.packages('rvest') ; library(rvest)} # rvest 설치 웹스크래핑 패키지

# a 는 하이퍼링크를 만들어주는 태그이다.

url_tvcast = 'http://tvcast.naver.com/jtbc.youth'   # 해당 URL를 변수에 할
html_tvcast = read_html(x = url_tvcast, encoding = 'UTF-8') # url에서 html 파일을 읽어오 저
#head 부분에 캐릭터 셋이 있으니 그에 해당하는것을 endcoding옵션에 넣어준다.


# html_node('태그의 트리정보')
html_tvcast %>% html_nodes('body.ch_home div#u_skip a')     # 원하는 부분을 추출할수있는 html_node 함
#태그.class 태그 또는 클래스 
html_tvcast %>% html_nodes(".title a") %>% head(n=3)  #.은 클래스 title 아래 a 아래 무엇 
html_tvcast %>% html_nodes(".title a") %>% html_text() %>% head(n=3)  #html_text :텍스트만 추출한다!
# title 아래에 a가 있는 구조만 찾아내겠다. 


url_tvcast = 'http://tv.naver.com/mbc.kingloves'
html_tvcast = read_html(x = url_tvcast, encoding = 'UTF-8')
html_tvcast %>% html_nodes('.title a') %>% html_text() %>% data.frame() %>% head(n=3)
 # %>%는  맨 왼쪽을 기준으로 오른쪽 함수를 실행시키겠다는 의지이다. CTL+shift+M 이 단축키다

# Student T Table 가져오기
url_wiki <- "https://en.wikipedia.org/wiki/Student%27s_t-distribution"
html_wiki <- read_html(x=url_wiki, encoding = 'UFT-8')
html_wiki %>% html_nodes('.wikitable') %>% html_table() %>% 
  data.frame() %>% head(n=3)


# MLB 자료경기 수집
url <- "http://www.baseball-reference.com/leagues/MLB/2017.shtml"
webpage <- read_html(url)
webpage %>% html_nodes('div#div_teams_standard_batting table') %>% 
  html_table() %>% data.frame() %>% head(n = 3)



#2008 년부터 수집 (슬라이드에 없는 것)

years = 2008:2017
batting_table = vector('list', length(years))
names(batting_table) <- years
for (i in 1:length(years)){
  url <- paste0(MLB_base_url, years[i], ".shtml")
  webpage <- read_html(url)
  batting_table[[i]] <- webpage %>%
    html_nodes('div#div_teams_standard_batting table') %>%
    html_table() %>% data.frame()
  batting_table[[i]] <-
    batting_table[[i]][1:(nrow(batting_table[[i]])-3),]
  batting_table[[i]][-1] <-
    Map(as.numeric, batting_table[[i]][-1])
  cat(i, '\n')  
}
View(batting_table)

# Error in open.connection(x, "rb") : HTTP error 404. 해결 안ㄷ
# 리스트 인덱싱  []: 중첩된 리스트의 틀까지 뽑는거 [[]] 원소만 뽑는것.
# 맨뒤에서 3줄은 뺴고 하자.
# i를 출력 print와 비슷 (진행상황을 보기위함)
# -1은 1열을 빼라.



#기상청 파일 받기 # get 방식으로 돌려보기.
# 검색을 한번 더 누르면 주소가 바뀐다. (뒤에 Query를 주어서 기상청컴퓨터에 요청하는것)
# URL에 쿼리를 넣어서 내용을 받는 방식 -> get 방식
# 만약에 특정날짜에 기상정보를 받고싶다. -> 주소만 바꾸면되겠다.

url = "http://www.weather.go.kr/weather/observation/currentweather.jsp?auto_man=m&type=t99&tm=2017.09.06.13%3A00&x=19&y=3"
webpage <- read_html(url, encoding = "EUC-KR")

Sys.setlocale("LC_ALL", "English")    # 보통 LC_ALL한다.
?Sys.setlocale

webpage %>% html_nodes("table.table_develop3")          # 불러오기 그냥 table만 하면 안됨.
tmp <- webpage %>% html_nodes("table.table_develop3") %>% 
  html_table(header = FALSE, fill=TRUE)%>% # 불러온 것은 테이블 형식으로 변경
  data.frame()                              # 근데 빈게있어서 그걸 fill로 결측치로 처리
head(tmp) # 인코딩 깨지니까 repari_encoding써


Sys.setlocale("LC_ALL", "Korean")  # console의 인코딩을 바꾸는 방법이다.(더 좋은 방법 있을것)
                               # R은 UTF-8인 인코딩하고, txt파일은 949로 인코디
                               
          
for(i in 1:ncol(tmp)){                      # 한 열씩 바꿔준다.
  tmp[,i] = rvest::repair_encoding(tmp[,i])  # 인코딩을 하나씩 변경해주고..???하나씩??대박쓰
}
head(tmp)



# 네이버 영화 평점 사이트
# https://movie.naver.com/movie/point/af/list.nhn?&page=1
# 주소?페이지   페이지에서 숫자만 바뀌는걸 볼수가 있다.

if(!require(httr)){install.packages('httr') ; library(httr)}

url = paste0("https://movie.naver.com/movie/point/af/list.nhn?&page=1")
mov_html = read_html(GET(url), Encoding = "UTF-8")       # GET방

content = html_nodes(mov_html, '.title') %>% html_text()
print(content)   # 보면 whitspace등 등 많다.

content = gsub('\n|\t|<.*?>|&quot;','',content)   # content를 아무것도 없는 것으로 바꾼다.
                # 정규 표현식, 텍스트에서 매칭되는 부분을 찾아서  원하는 글자로 바꿩주ㅡㄴㄴ거
print(content)

sub_con = strsplit(content, "\r")  # 캐리지 리턴을 가남겨놓고  쪼개줄것임.
print(sub_con)                    # 원하지 않는 항목과 신고 등을 지워준다.

data.frame(do.call(rbind,lapply(sub_con, function(x) {x[x != "" & x != "신고"]}))
           
total_con = NULL

for(i in 1:10){
 url = paste0("https://movie.naver.com/movie/point/af/list.nhn?&page=",i)
 mov_html = read_html(GET(url), encoding = "CP949")
 content = html_nodes(mov_html, '.title') %>% html_text()
 content = gsub('\n|\t|<.*?>|&quot;','',content)
 part_con = data.frame(do.call(rbind, 
                               lapply(strsplit(content, "\r"), function(x) {x[x != "" & x != "신고"]})))
 # 함수를 적용하는 함수 lapply!
 # do call(함수, 리스트) 그냥이랑 뭐가다르지??
 
 
 total_con = rbind(total_con, part_con)
 cat(i, "\n")
}

total_dat = NULL

for(i in 1:10){
  url = paste0("https://movie.naver.com/movie/point/af/list.nhn?&page=",i)
  mov_html = read_html(GET(url), encoding = "CP949")
  content = html_nodes(mov_html, '.title') %>% html_text()
  content = gsub('\n|\t|<.*?>|&quot;','',content)
  point = html_nodes(mov_html, '.point') %>% html_text()
  part_con = data.frame(do.call(rbind, 
                                lapply(strsplit(content, "\r"), function(x) {x[x != "" & x != "신고"]})), point = point)
  total_dat = rbind(total_dat, part_con)
  cat(i, "\n")
}


View(content)
View(total_dat)


# 네이버 API
# https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=%EB%84%A4%EC%9D%B4%EB%B2%84
query = '새우깡'  # 이것 못받아들인다.
# encoding 변화
query = iconv(query, to = 'UTF-8', toRaw = T)  #Raw 형태로 바꾼다.
# iconv(query, to = "UTF-8", toRaw = F)       # UTF 형태를 바꿀때 icov 필요.
query = paste0('%', paste(unlist(query), collapse = '%'))  # % 사이이 넣는다. 앞에도 넣는다.
query = toupper(query)   # 대문자로 바꾸어서 네이버주소랑 비슷하게하자.

print(query) # 따다가 주소창 마지막에 넣으면 새우깡이 검색됨

end_num = 1000
display_num = 100
start_point = seq(1,end_num,display_num)  #100개씩 밖에 안보여줌(네이버에서)

i = 1
url = paste0('https://openapi.naver.com/v1/search/blog.xml?query=',
             query,'&display=',display_num,'&start=',  # 스타트 포인트를 1 101 201 이렇게 넣음
             start_point[i],'&sort=sim')


client_id = 'wIsEwycuqEOuIWdNC5KC';
client_secret = 'TP6aBEDyKA';
header = httr::add_headers(
  'X-Naver-Client-Id' = client_id,
  'X-Naver-Client-Secret' = client_secret)


# 헤더 어떻게 넣지?
url_body = read_xml(GET(url, header))  # 헤더는 아이디랑 비번. 어떻게넣냐?

title = url_body %>% xml_nodes('item title') %>%
  xml_text()
bloggername = url_body %>% 
  xml_nodes('item bloggername') %>% xml_text()
postdate = url_body %>% xml_nodes('postdate') %>%
  xml_text()
link = url_body %>% xml_nodes('item link') %>%
  xml_text()
description = url_body %>% xml_nodes('item description') %>%
  html_text()

View(description)


i = 1
final_dat = NULL
for(i in 1:length(start_point))
{
  # request xml format
  url = paste0('https://openapi.naver.com/v1/search/blog.xml?query=',query,'&display=',display_num,'&start=',start_point[i],'&sort=sim')
  #option header
  url_body = read_xml(GET(url, header), encoding = "UTF-8")
  title = url_body %>% xml_nodes('item title') %>% xml_text()
  bloggername = url_body %>% xml_nodes('item bloggername') %>% xml_text()
  postdate = url_body %>% xml_nodes('postdate') %>% xml_text()
  link = url_body %>% xml_nodes('item link') %>% xml_text()
  description = url_body %>% xml_nodes('item description') %>% html_text()
  temp_dat = cbind(title, bloggername, postdate, link, description)
  final_dat = rbind(final_dat, temp_dat)
  cat(i, '\n')
}
final_dat = data.frame(final_dat, stringsAsFactors = F)

View(final_dat)
