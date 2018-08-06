#인덱스를 반환하는 Find 함수

eng = 'Introduction to Python'
kor = '파이썬을 배우면서 파이썬을 즐기자!!!'

print(eng.find('t'))
print(eng.rfind('t'))
print(kor.rfind('파'))
print(kor.find('Python'))   #존재하지 않는다면 -1를 반환


print(eng.index('t'))
print(eng.rindex('t'))
print(kor.index('Python'))   # 존재하지 않는다면 Value error를반환.