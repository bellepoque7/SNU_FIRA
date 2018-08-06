
test_1 = (x for x in range(5))   #이건 작동하는데 주소값을 알려주네...
print(test_1)

odd = (1, 3, 5, 7, 9)


odd_list = []

for i in range(len(odd)):
    odd_list.append(odd[i])              # 방법1 odd_list += list('xyz')로도 함 (extend와비슷한 개념)
    odd_list[i] = str(odd_list[i])       # 방법2  t = [str(e) for e in t] # 리스트 축약으로 만들기
                                         # t.extend(['x','y','z'])


odd_list.append('x')
odd_list.append('y')
odd_list.append('z')

print(odd_list)

for j in range(len(odd_list)):
    print(odd_list[j], type(odd_list[j]))
