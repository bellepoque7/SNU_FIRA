class IsNotPrime(Exception): pass


x = True
while x:
    try:
        n = int(input('숫자 입력해'))
        i = 2
        if (type(n) == int) and (0 < n):
            while i < n:
                if (n % i) == 0:
                    raise IsNotPrime()
                i += 1
        else:
            raise ValueError

    except ValueError:
        print('양의 정수를 입력하세요.')

    except IsNotPrime:
        print('소수가 아닙니다.')
        break

    else:
        print('소수입니다.')
        x = False
