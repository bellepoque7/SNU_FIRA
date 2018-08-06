number = input("1과 9 사이의 정수 중 하나를 입력하시오...")
print('구구단', number + '단입니다')
for i in range(1, 10):
    print(int(number) * i, end =' ')