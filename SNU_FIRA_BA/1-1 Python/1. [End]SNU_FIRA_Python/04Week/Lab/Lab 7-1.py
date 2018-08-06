alist = []
with open('고향의 봄.txt', encoding='utf-8') as file:
    for line in file.readlines():
        alist.append(line)

print(alist)