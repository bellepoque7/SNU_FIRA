from collections import defaultdict
dd1 = defaultdict(str)
dd2 = defaultdict(int)

print(dd1)
print(dd2)

x = dd1['name']
print(x)
print(dd1)

y = dd2['name']
print(y)
print(dd2)

#디폴트 딕셔너리의 활용

dd_int = defaultdict(lambda: -1)
dd_point = defaultdict(lambda: (0,0))
dd_msg = defaultdict(lambda: '남겨진 메세지가 없습니다')

x = dd_int['잔액']
print(x)
print(dd_int)

y = dd_point['좌표']
print(y)
print(dd_point)

z = dd_msg['메세지']
print(z)
print(dd_msg)

# 디폴트 딕셔너리의 응용

item_list = [('과일', '블루베리'), ('악기','드럼'), ('악기', '베이스'), ('과일', '사과'),('악기', '기타')]
d = {}
for k,v in item_list:
    d.setdefault(k,[]).append(v)   #???이해안감
list(d.items())

print(list(d.items()))

dd = defaultdict(list)
for k,v in item_list:
    dd[k].append(v)
print(list(dd.items())  # 이건또 왜안돼/.