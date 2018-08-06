rm(list = ls()); gc(reset = T)

# ------------------------
if(!require(rvest)){install.packages('rvest') ; library(rvest)}

url_tvcast = 'http://tvcast.naver.com/jtbc.youth'
html_tvcast = read_html(x = url_tvcast, encoding = 'UTF-8')

# ------------------------
html_tvcast %>% html_nodes(".title a") %>% head(n=3)

# -----------------------
html_tvcast %>% html_nodes(".title a") %>% html_text()%>%head(n=3)

# -----------------------
url_tvcast = 'http://tv.naver.com/mbc.kingloves'
html_tvcast = read_html(x = url_tvcast, encoding = 'UTF-8')
html_tvcast %>% html_nodes(".title a") %>% html_text() %>% 
  data.frame() %>% head(n = 3)

# -----------------------
url_wiki <- "https://en.wikipedia.org/wiki/Student%27s_t-distribution"
html_wiki <- read_html(x=url_wiki, encoding = 'UFT-8')

# -----------------------
html_wiki %>% html_nodes('.wikitable') %>% html_table() %>% 
  data.frame() %>% head(n=3)

# -----------------------
url <- "http://www.baseball-reference.com/leagues/MLB/2017.shtml"
webpage <- read_html(url)

# -----------------------
if(!require(rvest)){install.packages("rvest"); library(rvest)}
webpage %>% html_nodes('div#div_teams_standard_batting table') %>% 
  html_table() %>% data.frame() %>% head(n = 3)

# -----------------------
url = "http://www.weather.go.kr/weather/observation/currentweather.jsp?auto_man=m&type=t99&tm=2017.09.06.13%3A00&x=19&y=3"
webpage <- read_html(url, encoding = "EUC-KR")

Sys.setlocale("LC_ALL", "English")

webpage %>% html_nodes("table.table_develop3")
tmp <- webpage %>% html_nodes("table.table_develop3") %>% 
  html_table(header = FALSE, fill=TRUE)%>%
  data.frame()
head(tmp)

# -----------------------
Sys.setlocale("LC_ALL", "Korean")

for(i in 1:ncol(tmp)){
  tmp[,i] = rvest::repair_encoding(tmp[,i])
}
head(tmp)

# -----------------------
if(!require(httr)){install.packages('httr') ; library(httr)}

url = paste0("https://movie.naver.com/movie/point/af/list.nhn?&page=1")
mov_html = read_html(GET(url), Encoding = "UTF-8")

content = html_nodes(mov_html, '.title') %>% html_text()
content = gsub('\n|\t|<.*?>|&quot;','',content)

sub_con = strsplit(content, "\r")
data.frame(do.call(rbind, lapply(sub_con, function(x) {x[x != "" & x != "신고"]}))) %>% head(3)

# -----------------------
total_con = NULL

for(i in 1:10){
  url = paste0("https://movie.naver.com/movie/point/af/list.nhn?&page=",i)
  mov_html = read_html(GET(url), encoding = "CP949")
  
  content = html_nodes(mov_html, '.title') %>% html_text()
  content = gsub('\n|\t|<.*?>|&quot;','',content)
  
  part_con = data.frame(do.call(rbind, 
                                lapply(strsplit(content, "\r"), function(x) {x[x != "" & x != "신고"]})))
  
  total_con = rbind(total_con, part_con)
  
  cat(i, "\n")
}

head(total_con)
# -----------------------
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

head(total_con)
# --------------------- client_id, client_secret은 수업자료에는 '???'로 표기 되어 있습니다.
client_id = 'wIsEwycuqEOuIWdNC5KC';
client_secret = 'TP6aBEDyKA';
header = httr::add_headers(
  'X-Naver-Client-Id' = client_id,
  'X-Naver-Client-Secret' = client_secret)

# ---------------------
query = '새우깡'
# encoding 변화
query = iconv(query, to = 'UTF-8', toRaw = T)
# iconv(query, to = "UTF-8", toRaw = F)
query = paste0('%', paste(unlist(query), collapse = '%'))
query = toupper(query)

# ---------------------
if(!require(httr)){install.packages("httr"); library(httr)}

end_num = 1000
display_num = 100
start_point = seq(1,end_num,display_num)
i = 1
url = paste0('https://openapi.naver.com/v1/search/blog.xml?query=',
             query,'&display=',display_num,'&start=',
             start_point[i],'&sort=sim')
url_body = read_xml(GET(url, header))

# --------------------
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

# ---------------------
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
head(final_dat)


# ---------------------- api_key는 수업자료에서는 "???"로 표기 되어 있습니다.
api_key = "5848726a776c756e36336163707173"
service = "CardSubwayTime"
start = 1
end = 40
query = iconv("2호선", to = 'UTF-8')
date = 201603
url = paste0("http://openapi.seoul.go.kr:8088/", api_key, "/xml/",service ,"/",start,"/",end,"/", date, "/", query)

# ---------------------- 
if(!require(XML)){install.packages("XML"); library(XML)}
raw.data = xmlTreeParse(url, useInternalNodes = TRUE, encoding = "UTF-8")
rootNode <- xmlRoot(raw.data)

list_dat = list()
for(i in 3:length(names(rootNode))){
  list_dat[[i-2]] = xmlSApply(rootNode[[i]], xmlValue)
}

total_set = data.frame(do.call(rbind, list_dat), stringsAsFactors = F)

for(i in 4:ncol(total_set)){
  total_set[, i] = as.numeric(total_set[, i])
}

head(total_set, 3)
 














