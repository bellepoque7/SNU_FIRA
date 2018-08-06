
 # 정수의 합고가 평균을 동시에 계산하는 함수

def calculator_int(*n):
    count = len(n)
    print(count)
    sum = 0
    for i, j in enumerate(n):
        if j == 0:
            return

    for i, j in enumerate(n):
        sum += n[i]

    print(sum, round(sum/count,2))



calculator_int(1,4)
