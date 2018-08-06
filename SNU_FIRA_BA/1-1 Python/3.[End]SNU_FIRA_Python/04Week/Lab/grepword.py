import sys

word = sys.argv[1]
file = sys.argv[2]

alist = []
with open('고향의봄.txt', encoding='utf-8') as file:
    for line in file:
        alist.append(line)

for i, j in enumerate(alist):
    if word in j:
        print('{0}:{1}'.format(i,j), end='')