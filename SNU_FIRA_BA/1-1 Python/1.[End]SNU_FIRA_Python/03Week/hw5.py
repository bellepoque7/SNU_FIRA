# Assignment Number...: 5
# Student Name........: 임정
# File Name...........: hw5_임정
# Program Description.: 간단한 if-else 문과 for,while 문 활용하는 법을 익힌다.

# 3개의 숫자 비교.

a = int(input('Enter a: '))                     # 입력 값 3개를 받아 각 a,b,c에 정수형으로 할당
b = int(input('Enter b: '))
c = int(input('Enter c: '))

if a > b and a > c:                             # a가 b와 c보다 클 경우
    print(b+c)                                  # b + c를 출력
elif b > a and b > c:                           # b가 a와 c보다 클 경우
    print(a+c)                                  # a + c를 출력
elif c > a and c > b:                           # c가 a와 b보다 클 경우
    print(a+b)                                  # a + b를 출력


# 도시와 크기

city = ['Seoul', 'New York', 'Beijing']         # city 리스트 생성
target = input('Enter the name of the city: ')   # 도시의 이름을 입력 받음

if target == 'Seoul':                            # 입력 값이 서울이면
    area = 605                                   # 605를 area 변수에 할당
elif target == 'New York':                       # 입력 값이 뉴욕이면
    area = 789                                   # 789를 area 변수에 할당
elif target == 'Beijing':                        # 입력 값이 Beijing 이면
    area = 16808                                 # 16808를 area 변수에 할당
else:                                            # 나머지 경우에는
    area = 'Unknown'                             # area 에 Unknown 을 할당

print('The size of {0} is {1}'.format(target, area))    # 문자열 포매팅을 사용하여 출력.


# 0부터 9까지 10개의 각 정수의 계승값을 출력한다.

from math import factorial                        # math 라이브러리에서 factorial 함수를 적용
for i in range(10):                               # 0 부터 9까지 반복
    print(factorial(i))                           # 각 수에 대해서 팩토리얼 계산을 출력

j = 0                                             # j에 0을 할당
while j < 10:                                     # j 가 10보다 작으면 반복
    print(factorial(j))                           # 각 수에 대해서 팩토리얼 계산을 출력
    j += 1                                        # 각 반복마다 j를 1씩 증가