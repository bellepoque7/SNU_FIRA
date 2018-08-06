empty1 = ()
print(empty1)

empty2 = ()
print(empty2)

T = ('파이썬')
print(T)

family = ('엄마', '아빠', '나', '동생')
print(family)

tuple1 = tuple('피아노')
print(tuple1)

tuple2 = tuple('피아노',)
print(tuple2)

tuple3 = tuple('1,2,3,4,5')
print(tuple3)

i,j,k = '드럼', '기타', '피아노'
print(i,j,k)
a,b,c, = ['엄마', '아빠', ('나', '동생')]
print(a,b,c)

i, j = j, i
print(i,j,k)

email = 'abc@xyz.kr'
user_name, domain = email.split('@')

print(user_name)
print(domain)

x, _, y, _ = 1,2,3,4
print(x)
print(y)
print(_) #나중에 할당된것이 표시되네.