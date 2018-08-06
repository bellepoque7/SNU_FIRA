eng = "Introduction to python"
kor=  '파이썬을 배우면서 파이썬을 즐기자'

print(eng.strip('Inop'))   #양쪽에서 Inop 없을때까지 (False) 반환할때까지 지원다.
print(eng.rstrip("!"))
print(eng.lstrip('ntroduction'))


s = '\t 금연 !! \t! \n'
print(s.strip())
print(s.lstrip())
print(s.rstrip())