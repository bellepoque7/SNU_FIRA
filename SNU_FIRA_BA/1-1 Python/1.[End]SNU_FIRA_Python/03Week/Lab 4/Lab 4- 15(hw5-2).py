#소수 판별
class prime_exception(Exception): pass


while True:
    try:
        n = int(input('임의의 양의 정수를 입력하세요...:'))
        if type(n) == int and n > 1:                        # n = 1일때 처리안함
            for i in range(2,n):
                if n % i == 0:
                   raise prime_exception()
        else:
            raise ValueError

    except ValueError:
        print('ValueError: 1보다 큰 양의 정수를 입력하세요.')    # 출력문 틀림

    except prime_exception:
        print('{0}X{1} = {2}'.format(i, int(n/i), n))
        print('이 숫자는 소수가아닙니다.')
        break

    else:
        print('이 숫자는 소수 입니다.')
        break

