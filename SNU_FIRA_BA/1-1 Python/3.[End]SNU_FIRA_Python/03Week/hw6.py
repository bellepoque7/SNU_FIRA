# Assignment Number...: 6
# Student Name........: 임정
# File Name...........: hw6_임정
# Program Description.: 새로운 함수를 정의하는 방법과 람다함수를 익힌다.

# 1번: 삼각형의 면적을 구하는 area_triangle() 함수를 정의한다.

def area_triangle(h, w):                 # h, w parameter 를 받는 함수를 생성
    print(0.5*h*w)                       # 0.5 * h * w 를 출력
    return 0.5*h*w                       # 0.5 * h * w 를 반환

area_triangle(h=10, w=15)            # h = 10 w = 15 를 넣고  함수를 실행

# 2번 2차원공간에서 두점 사이의 거리를 계산하는 distance()함수를 정의한다.
def distance_2d(a, b):                    # a, b parameter 를 받는 함수를 생성
    distance = 0                          # distance 변수에 0 을 할당
    for i in range(len(a)):               # a의 길이 만큼 i를 반복
        distance += ((a[i]-b[i])) ** 2    # 각 원소의 차이의 제곱을 얻어 distance 에 더함
    distance = distance ** 0.5            # 위의 값에 루트를 씌워 상대 직선거리를 계산
    print(distance)                       # 직선거리를 출력
    return distance                       # 직선거리를 반환

distance_2d((1,2), (5,7))             # a = (1,2), b = (5,7)를 넣고 함수를 실행


# 3번: 재귀함수 count()를 생성해 양의 정수부터 0까지 세어본다.
def count(n):
    if n > 0:
        print(n)
        count(n-1)
    else:
        print('zero!!!')
                                # else 문 어디다 넣어야하지?
count(5)

# 삼각형의 넓이를 계산하는 area_triangle_ld()를 생성한다.

area_triangle_ld = lambda w, h: print(h,w)     # lambda 함수에 이름을 넣고 h, w 변수를 받고 계산값을 출력
area_triangle_ld(10, 15)                           #  h=10, w= 15 를 넣고 함수를 실행