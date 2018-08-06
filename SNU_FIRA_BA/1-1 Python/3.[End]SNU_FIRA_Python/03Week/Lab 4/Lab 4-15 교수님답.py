

while True:
    try:
        i = int(input('임의의 양의 정수를 입력하세요:  '))   # 3.0은 에러나네..
        if not isinstance(i, int) or i < 2:                  #i 가 int 자료형인지 T/F반환하는 함수
            raise ValueError
    except ValueError:
        print('ValueError: 1보다 큰 양의 정수를 입력하세요.')
        continue
    else:
        break

#소수 확인 절차
#전달인자의 값을 2부터 n-1까지의 숫자로 나누어, 나머지가 0인 숫자가 있으면 소수가 아니다.
for n in range(2, i - 1):
    if i % n == 0: #1과 자신 외에 나누어 떨어지는 수가 존재하면 소수가 아니다.
        print('{0} x {1} = {2}'.format(n, i // n, i))
        print('이 숫자는 소수가 아닙니다.')
        break
else: #1과 자신 이외에 제수가 없는 경우
    print('이 숫자는 소수 입니다.')