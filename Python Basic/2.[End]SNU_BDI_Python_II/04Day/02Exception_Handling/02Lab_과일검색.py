#try-except문을 이용해서 작성해라.


target = input('과일 이름을 입력하세요...: ')
fruit = ['사과', '딸기', '바나나', '블루베리', '포도']

try:
    index = fruit.index(target) # index는 번호를 반환? index(argument) argument가 몇번째 있는지 반환하자.
except ValueError:
        print('과일이 존재하지 않습니다.')
else:
    print('과일목록의 {} 번째에 존재합니다'.format(index+1))

#인덱스 메소드...