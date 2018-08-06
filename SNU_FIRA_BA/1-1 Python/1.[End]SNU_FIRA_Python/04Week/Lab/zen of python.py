

with open('zen of python.txt', mode='r', encoding='utf-8') as f:
    s = f.read()
    S = s.upper()
print(S)

with open('zen of python_big.txt', mode='w', encoding='utf-8') as f:
    f.write(S)