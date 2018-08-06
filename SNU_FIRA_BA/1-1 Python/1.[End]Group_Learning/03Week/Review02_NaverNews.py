import bs4
import urllib.request

url = "http://news.naver.com"
html = urllib.request.urlopen(url)

bs_obj = bs4.BeautifulSoup(html, 'html.parser')
div = bs_obj.find('div', {'class' : 'newsnow_tx_inner'})

for a_tag in div:
    a_tag = div.find('strong')
print(a_tag.text)

# 못해따... 전문밖에