rm(list = ls()); gc(reset = T)

if(!require(rvest)){install.packages('rvest') ; library(rvest)}
if(!require(httr)){install.packages('httr') ; library(httr)}
if(!require(KoNLP)){install.packages('KoNLP') ; library(KoNLP)} # 세종사전
if(!require(wordcloud2)){install.packages('wordcloud2') ; library(wordcloud2)} # RColorBrewer()함수 제공
if(!require(yaml)){install.packages('yaml') ; library(yaml)}
if(!require(rJava)){install.packages('rJava') ; library(rJava)}

install.packages("http://cran.r-project.org/bin/windows/contrib/3.0/tm_0.5-10.zip",repos=NULL)
library(tm) #영문 텍스트 마이닝

#------------
#블로그출처1 : http://blog.naver.com/PostView.nhn?blogId=nonamed0000&logNo=220959119930&parentCategoryNo=&categoryNo=9&viewDate=&isShowPopularPosts=true&from=search

client_id = '';
client_secret = '';
header = httr::add_headers(
  'X-Naver-Client-Id' = client_id,
  'X-Naver-Client-Secret' = client_secret)
 #블로그출처


# ---------------------
query = '곱창'
# encoding 변화
query = iconv(query, to = 'UTF-8', toRaw = T)
# iconv(query, to = "UTF-8", toRaw = F)
query = paste0('%', paste(unlist(query), collapse = '%'))
query = toupper(query)

# ---------------------
end_num = 1000
display_num = 100
start_point = seq(1,end_num,display_num)
i = 1
url = paste0('https://openapi.naver.com/v1/search/blog.xml?query=',
             query,'&display=',display_num,'&start=',
             start_point[i],'&sort=sim')
url_body = read_xml(GET(url, header))

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
final_dat_orgin = data.frame(final_dat, stringsAsFactors = F)
data2 = final_dat_orgin  # 블로그 주소 , 날짜, 기술 : list형식

typeof(data2)
typeof(data2$description)
str(data2$description)

data2$description = gsub('\n|\t|<.*?>|&quot;',' ',data2$description)
data2$description = gsub('[^가-힣a-zA-Z]',' ',data2$description)
data2$description = gsub(' +',' ',data2$description)
data2$description = gsub('곱창',' ',data2$description)
data2$description = gsub('으로',' ',data2$description)
data2$description = gsub('진짜',' ',data2$description)
data2$description = gsub('오랜만',' ',data2$description)
data2$description = gsub('근처',' ',data2$description)
data2$description = gsub('이번',' ',data2$description)
data2$description = gsub('얼마',' ',data2$description)
data2$description = gsub('들이',' ',data2$description)
data2$description = gsub('때문',' ',data2$description)
data2$description = gsub('해서',' ',data2$description)

# 여기서 '곱창','으로' '마마(?)' ,'진짜'오랜만 을
# Gsub함수로 지우기

nouns=KoNLP::extractNoun(data2$description)
data_unlist = unlist(nouns)

cnts <- data_unlist[data_unlist > 2 & nchar(names(data_unlist))>1]
wordcloud2(data.frame(word=names(cnts), freq=as.numeric(cnts)),  
           color = "random-light", backgroundColor = "black", shape="cloud")


filter_data = Filter(function(x){nchar(x)>=2}, data_unlist)
filter_data_table = table(filter_data)
sort(filter_data_table, decreasing=T) %>% head(30)





# 워드클라우드

# 이후 분석....
