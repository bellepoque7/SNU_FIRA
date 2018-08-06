#패킹: 하나의 변수에 여러개의 값을 넣는것
#언패킹: 패킹된 변수에서 여러 개의 값을 꺼냉는것

t = 3.14, [5,-3], 'green', ('드럼','기타')
a,b,c,d = t
print(a)
print(b)
print(c)
print(d)

x, y, *z = 3.14, [5,-3], 'green', ('드럼','기타')
print(x)
print(y)
print(z)

def multiply(x,y,z):
    return x*y*z
print(multiply(2,3,5))

numbers = 2,3,5
print(multiply(2,3,5))
print(multiply(3, *numbers[1:]))