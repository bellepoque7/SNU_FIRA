

def calculator(a, b, c):
    if a == 'add':
        return b + c
    elif a == 'sub':
        return b - c
    elif a == 'mul':
        return b * c
    elif a == 'div':
        return b / c
    else:
        text = ' is not supported'
        return a + text

print(calculator('haha', [1,2], [3,4]))
