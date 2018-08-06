#Assignment Number...: 3
#Student Name........: 임정
#File Name...........: hw3_임정
#Program Description.: 문자열 서식을 활용 / 리스트와 튜플 생성 / 슬라이싱 방법 익히기

## 스테이크 가격 문제

steak = 30000                                                   # 상수 정의
VAT = 15
print(('스테이크의 원래 가격은 {0} 원 입니다. 하지만 VAT 가 {1}%로, '    
'계산하셔야 할 가격은 {2} 원입니다.').format(steak, VAT, int(steak*(1+VAT/100))))
                                                                # 대체필드를 foramt() 전달인자로 사용하여 출력
s = '@^TrEat EvEryonE yOu meet likE you want tO be treated.$%'  # s 문자열 정의
s = s.strip('@^$%')                                             # 특정 문자를 제거
s = s.capitalize()                                              # 문자열의 가장 첫 문자만 대문자로 설정
print(s)                                                        # 출력

## 튜플 생성 및 슬라이싱

numbers = (2, 18, 26, 89, 45, 39, 14)                           # numbers 튜플 생성
print(numbers)                                                  # numbers 튜플 출력
print(len(numbers))                                             # numbers 갯수 출력

fruits = ['apple', 'orange', 'strawberry', 'pear', 'kiwi']      # fruits 리스트 정의
print(fruits)                                                   # fruits 리스트 출력
fruits_sub = fruits[:3]                                         # 리스트 슬라이싱 후 재 할당
print(fruits_sub)                                               # 재 할당된 리스트 출력