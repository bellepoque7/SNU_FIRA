file = open('고향의봄.txt',mode='r', encoding='utf-8')
while True:
    line = file.readline()
    if not line:      # 라인이 아니면 == 라인이 끝났으면 -> break 나가라 (??continue랑 다른게뭐지...)
        break
    print(line, end='')
file.close()


#with문은 자동으로 파일을 닫아준다.

with open('고향의봄.txt',mode='r', encoding='utf-8') as file:
    for line in file: #한줄씩 읽어내라
        print(line,end='') #또는 print(line.rstrip()))

file = open('고향의봄.txt',mode='r', encoding='utf-8')
data = file.read().split('\n') #스플릿은 리스트형태로 반환하며 \n는 날려벼린다.
file.close()

print(type(data))
print(data)  #리스트 형태