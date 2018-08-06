s = 'I like Python programming'

print(s.replace('PYthon', 'Ruby'))
print(s.replace('o', 'O', 2))   # 두번만 바꾸어라.

eng = 'Introduction to Python'
kor = '파이썬을 배우면서 파이썬을 즐기자!!!'

print(eng.count('o')) #소문자 o 갯수를 세어라
print(eng.count('o', -2))   #  두개를 빼라고?
print(eng.count('o', 0, -2)) # 위치 0부터 -2까지 찾아라. Introduction ~ Pyth 까지
print(kor.count('파이썬'))