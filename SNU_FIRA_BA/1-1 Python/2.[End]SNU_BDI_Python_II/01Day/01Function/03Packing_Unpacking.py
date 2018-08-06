def product(*args):
    result = 1
    for arg in args:
        result *= arg
    return result

print(product(15))
print(product(2,3,4))
print(product(5,6,7,8))

def sum_of_powers(*args, power=1):   #불특정 인자를 받을시에 *로 받는다. / 리스트 튜플 형일시에
    result = 0
    for arg in args:
        result += arg ** power
    return result

print(sum_of_powers(1,3,5))
print(sum_of_powers(1,3,5, power=2))
print(sum_of_powers(1,3,5,7, power=2))