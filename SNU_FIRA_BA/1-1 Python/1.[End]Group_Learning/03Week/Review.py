import bs4
import urllib.request

url = 'http://www.naver.com'
html = urllib.request.urlopen(url)

bs_obj = bs4.BeautifulSoup(html,'html.parser')
ul = bs_obj.find("ul",{'class' :'an_I' })

list = ul.findALL("li")

for li in list:
    a_tag = li.find("a")
    span = a_tag.find("span", {'class' : 'an_txt'})
    print(span.text)

