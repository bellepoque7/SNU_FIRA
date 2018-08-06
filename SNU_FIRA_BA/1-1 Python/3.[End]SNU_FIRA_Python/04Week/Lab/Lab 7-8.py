
s = ('Beautiful is better than ugly.Explicit is better than implicit.Simple is better than complex.'
    'Complex is better than complicated.'
'Flat is better than nested.Sparse is better than dense.Readability counts.Special cases aren\'t'
' special enough to break the rules.Although practicality beats purity.Errors should never pass silently.')

print(s)
list_a =[]
with open('zen of python.txt', mode='w', encoding='utf-8') as f:
    list_a = s.split('.')
    for i, _ in enumerate(list_a):
        f.write(list_a[i])
        f.write('\n')

print(list_a)