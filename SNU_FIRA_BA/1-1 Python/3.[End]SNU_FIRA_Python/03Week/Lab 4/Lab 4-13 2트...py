
fruits = ['사과', '딸기', '바나나', '블루베리', '포토']


target = input('과일을 입력하세요...:')

for i, j in enumerate(fruits):
    if target == j:
        print('{}는 {}번째에 존재합니다.'.format(target, i))