import urllib.request
import bs4

url = "https://www.naver.com"
html = urllib.request.urlopen(url)

bs_obj = bs4.BeautifulSoup(html,"html.parser")
ul = bs_obj.find("ul", {"class" : "an_l"})

# 여기까지가 기본 base
# 1) ul 뽑아보기
#  print(ul)

# 2) ul 안의 li 뽑아보기
# for li in ul:
#    print(ul)

# 3) 리스트 형태로 뽑아내기[]
list = ul.findAll("li")
#print(list)

# 4) list안에서 "a"들어있는거 뽑기.
for li in list:
    a_tag = li.find("a")
    # a의 안의 span 중 class가 an_txt인것만 뽑기
    span = a_tag.find("span", {"class" : "an_txt"})
    print(span.text)