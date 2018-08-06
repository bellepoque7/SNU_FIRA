from collections import defaultdict



alist = []
with open('고향의봄.txt', encoding='utf-8') as f:
    for str in f:
        alist.extend(str.split())
alist = sorted(alist)

dd = defaultdict()
dd['what'] = 'hi'
print(dd)

#for word in alist:
#    if word in dic:
#        dic[word] += 1
#    else:
#        dic[word] = 1

#for i in dic:
#    print('{} : {}번 출현'.format(i, dic[i]))