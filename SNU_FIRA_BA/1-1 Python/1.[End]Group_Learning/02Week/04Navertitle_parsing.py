import urllib.request
import bs4

url = "https://www.naver.com"
html = urllib.request.urlopen(url)

bs0bj = bs4.BeautifulSoup(html,"html.parser")

top_right = bs0bj.find("div", {"class":"area_links"})
first_a = top_right.find("a")
print(first_a.text)