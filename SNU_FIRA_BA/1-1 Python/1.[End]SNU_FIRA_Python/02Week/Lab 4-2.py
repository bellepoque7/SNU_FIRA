x = int(input('x 를 입력하세요...:  '))
y = int(input('y 를 입력하세요...:  '))

if x % y == 0:
    print('zero')
else:
    if (x % y)%2 == 0:
        print('even')
    else:
        print('odd')

