# xor()함수 구현

def xor(x, y):
    if x == y:
        return False
    else:
        return True
def xor_pf(x, y):
    return x ^ y   #비트 연산자가 쉽다.


print(xor(True, True))
print(xor(True, False))
print(xor(False, True))
print(xor(False, False))
