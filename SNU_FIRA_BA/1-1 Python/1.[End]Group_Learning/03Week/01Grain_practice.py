#html랑 JSON  두개 있다.

#깃허브 출처: python_crawler - mybook - chapter7 - 03_grains
# 세계곡물가격 - 개발자도구 - network -
# XHR - 2018-05-27 - Headers  / Preview


from urllib.request import urlopen # request 중에서 urlopen만 쓰자.
import json


from_date = "2010-02-01"
to_date = "2018-04-28"
url = " http://grains.krei.re.kr/chart/main_chart/index/kind/W/sdate/" + from_date + "/edate" + to_date
text = urlopen(url)

json_obj = json.load(text) #d가 없어지고 list로 나온다.
#read 함수가 무어지?
#tree 구조로 재구성해줌
#key를 date와 settlement로 뽑자.
#여기서 더 나아가면 mapplot으로도 할 수 있다
for item in json_obj[1:10]:
    print(item['date'] + "," + item['settlement'])
