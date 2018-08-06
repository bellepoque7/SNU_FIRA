#그 문자가 무엇으로 시작하느냐 끝나느냐? / 데이터 확인을 위해 하기 좋다.

eng = 'Introduction to Python'
kor = '파이썬을 배우면서 파이썬을 즐기자!!!'

print(eng.startswith('i'))
print(eng.endswith('Python'))
print(kor.startswith(('파이썬')))
print(kor.endswith('자'))