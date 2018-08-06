eng = 'Introduction to Python'
kor = '파이썬을 배우면서 파이썬을 즐기자!!!'

print(kor.split())
print(kor.rsplit(maxsplit=1))
print(eng.split('t',2))   #스플릿 구분자는 없어진다.
print(eng.rsplit('o'))
print(' \t \n \n\t \t '.split())