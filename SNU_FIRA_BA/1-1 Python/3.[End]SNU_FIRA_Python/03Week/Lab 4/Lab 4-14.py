fruits = ['사과', '딸기', '바나나', '블루베리', '포도']




try:
    index = fruits.index(target)
except ValueError:
    print('과일이 존재하지 않습니다.')
else:
    print('과일목록의 {}번째에 존재합니다.')