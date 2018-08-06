import sys

print(sys.argv)



if len(sys.argv) != 4 or sys.argv[1] == '-help':
    print('usage: python head.py number filename')
    sys.exit()

start = int(sys.argv[1])
end = int(sys.argv[2])
file = sys.argv[3]

alist = []
with open('고향의봄.txt', encoding='utf-8') as f:
    for line in f.readlines():
        alist.append(line)

for i in range(start, end):
    print(alist[i], end='')