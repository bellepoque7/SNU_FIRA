#현님이 적어주신거.

fruits = ['사과', '딸기', '바나나', '블루베리', '포도']

class FruitFoundExeption(Exception): pass
try:
    user = input('과일 이름을 입력하세요...:')
    for i in range(len(fruits)):
        if fruits[i] == user:
            raise FruitFoundExeption()
except FruitFoundExeption:
    print('과일 몰록의')
else:
    print('과일목록에 존재하지 않습니다.')