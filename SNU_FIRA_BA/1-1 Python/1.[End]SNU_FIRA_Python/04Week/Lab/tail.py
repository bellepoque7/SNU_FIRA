import sys

print(sys.argv)



if len(sys.argv) != 3 or sys.argv[1] == '-help':
    print('usage: python head.py number filename')
    sys.exit()

count = int(sys.argv[1])
file = sys.argv[2]

alist = []
with open('고향의봄.txt', encoding='utf-8') as f:
    for line in f.readlines():
        alist.append(line)

print(alist)

number = len(alist) - int(sys.argv[1])
for i in range(number,len(alist)):
    print(alist[i])