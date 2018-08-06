int_str1 = []
for i in range(1,10):
    int_str1.append(i)

int_str2 = [str(i) for i in range(1,10)]   #같은 표현 좀더 축약된 표시 str은 문자형표시

print(int_str1)
print(int_str2)


int_str_odd1 = []
for i in range(1,10):
    if i % 2 == 1:
        int_str_odd1.append(str(i))
print(int_str_odd1)

int_str_odd2 = [str(i) for i in range(1,10) if i % 2 == 1 ]    # if조건문을 뒤에 넣어야하네.. 이거 로직 순서가?
print(int_str_odd2)