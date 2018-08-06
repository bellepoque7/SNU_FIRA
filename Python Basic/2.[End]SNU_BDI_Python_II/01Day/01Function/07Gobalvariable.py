x = '안녕 파이썬'
def func():
    y = '나는 파이썬을 사랑합니다'
    print(x)
    print(y)

print(func())

print(x)

#print(y) --> 지역함수이기 때문에 에러 반환

def func1():
    x = 'Hi Python'
    print(x)

func1()
print(x)