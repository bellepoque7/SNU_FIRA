install.packages("yaml")
devtools::install_version("binman")
devtools::install_version("wdman")
devtools::install_github("ropensci/RSelenium")

library(RSelenium) 
library(rvest) 
library(httr) 

PHT <- wdman::phantomjs(port = 4567L)
remDr <- remoteDriver(remoteServerAddr = 'localhost', 
                      port = 4567L,
                      browserName = "phantomjs")

remDr$open()

url_krx="https://short.krx.co.kr/contents/SRT/02/02010100/SRT02010100.jsp"
Sys.setlocale("LC_ALL", "English")
html_krx = read_html(x = url_krx, encoding = 'UTF-8')
html_krx %>% html_nodes(".CI-GRID-BODY-TABLE")

Sys.setlocale("LC_ALL", "English")
remDr$navigate(url_krx) 
html_krx <- remDr$getPageSource()[[1]]
html_krx <- read_html(html_krx) 
html_nodes(html_krx, '.CI-GRID-BODY-TABLE-TBODY')
table0=
  html_nodes(html_krx, '.CI-GRID-BODY-TABLE') %>% 
  html_table(header = FALSE, fill=TRUE) %>%
  data.frame()
Sys.setlocale("LC_ALL", "Korean")
for(i in 1:ncol(table0))
  table0[,i]<-rvest::repair_encoding(table0[,i])
table0


remDr$navigate("http://blog.naver.com/lkok133?Redirect=Log&logNo=221310742005")
webElems <- remDr$findElements(using = "tag name", "frame")
sapply(webElems, function(x){x$getElementAttribute("src")})
remDr$switchToFrame(webElems[[1]])  
content=read_html(remDr$getPageSource()[[1]]) 
html_nodes(content, '#postViewArea') %>% html_text()


remDr$close()
PHT$stop()


client_id = '???';
client_secret = '???';
header = httr::add_headers(
  'X-Naver-Client-Id' = client_id,
  'X-Naver-Client-Secret' = client_secret)

#https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=%EC%83%88%EC%9A%B0%EA%B9%A1
query = '비트코인'
# encoding 변화
query = iconv(query, to = 'UTF-8', toRaw = T)
# iconv(query, to = "UTF-8", toRaw = F)
query = paste0('%', paste(unlist(query), collapse = '%'))
query = toupper(query)

if(!require(httr)){install.packages("httr"); library(httr)}

end_num = 1000
display_num = 100
start_point = seq(1,end_num,display_num)

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

final_dat$description = gsub('\n|\t|<.*?>|&quot;',' ',final_dat$description)
final_dat$description = gsub('[^가-힣a-zA-Z]',' ',final_dat$description)
final_dat$description = gsub(' +',' ',final_dat$description)

library(KoNLP)
nouns=KoNLP::extractNoun(final_dat$description)
nouns[1:5]
newdic=data.frame(V1=c("떡락장","포스팅","블로그"),"ncn")
KoNLP::mergeUserDic(newdic)

nouns=KoNLP::extractNoun(final_dat$description)
nouns[1:5]
