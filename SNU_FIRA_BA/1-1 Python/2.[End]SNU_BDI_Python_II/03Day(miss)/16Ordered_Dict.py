stock  = dict(키보드=2, 드럼=3, 기타=11, 베이스=5, 색소폰=1)

from collections import OrderedDict
x1 = OrderedDict(sorted(stock.items()))
x2 = OrderedDict(sorted((stock.items),key=lambda e: len(e[0])))  # 오름차순으로 정렬해라.. 라는 뜻이라고?
x3 = OrderedDict(sorted(stock.items(),key=lambda e: e[1])) # 재고수가 작은것부터 정렬해라.

print(x1)
print(x2)
print(x3)
