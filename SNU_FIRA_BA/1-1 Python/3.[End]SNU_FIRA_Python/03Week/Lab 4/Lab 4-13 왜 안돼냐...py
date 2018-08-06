
fruits = ['사과', '딸기', '바나나', '블루베리', '포토']

fruit = input('과일이름을 입력하세요..')

for i in range(len(fruits)):
    if fruit == fruits:
        print(fruit,'는 {}번째에 존재합니다.')
        break
else:
    print('과일이 존재하지 않습니다.')