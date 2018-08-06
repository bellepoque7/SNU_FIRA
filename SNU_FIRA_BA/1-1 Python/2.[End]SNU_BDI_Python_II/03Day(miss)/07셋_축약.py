x = [i * i for i in (-3,-2,-1,0,1,2,3)] #리스트 축약
y = {i * i for i in (-3,-2,-1,0,1,2,3)} #셋 축약 : 중복이 방지되는 특징

print(x)
print(y)

x = [abs(i) for i in range(-9,10)]  #리스트축약
y = [abs(i) for i in range(-9,10)]  #셋축약

print(x)
print(y)


import os

file_list = os.listdir()
print(file_list)

py_files = {file for file in file_list
            if file.lower().endswidth(('.py', '.pyw'))}