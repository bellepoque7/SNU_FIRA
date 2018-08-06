file = open('고향의봄.txt', mode='r',encoding='utf-8')
data = file.read() # 파일 닫기위해서
file.close()

print(type(data))
print(data)


#read는 한번에 다 읽어내는 특징