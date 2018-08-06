a = ['Pyton','Java', 'C++', 'R']

map_by_len = map(len,a)
print(map_by_len)
print(list(map_by_len))    #갯수를 반환한다.

b = ['string','list','dict','tuple']
map_by_endswith = map(lambda x: x.endswith('t'), b)
print(list(map_by_endswith)) #t 원소로 끝나는지 확인하기.

### 02Table을 좀더 간략하게

from pprint import pprint

with open('table.csv', mode='r', encoding='utf-8') as f:
    col_names = f.readline().strip().split(',')
    result = list(map(lambda x: dict(zip(col_names, x.strip().split(','))), \
                      f.readline()[1:]))

    pprint(result)