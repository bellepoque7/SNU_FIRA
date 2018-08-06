file = open('고향의봄.txt',mode='r', encoding='utf-8')
data = file.readline()
file.close()

print(type(data))
print(data)

