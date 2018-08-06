# while문으로 과일검색

fruits = ['사과', '딸기', '바나나', '블루베리', '포도']
a = input('과일 이름을 입력하세요...: ')
i = 0

while i < len(fruits):
        if a in fruits:
            print('과일이 {}번째 존재합니다.'.format((fruits.index(a))+1))
            break
        i += 1
else:
    print('과일이 존재하지 않습니다.')


# 교수님 정답이 더 좋네