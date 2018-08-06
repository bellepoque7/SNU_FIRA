
name = '고향의봄.txt'

lines = 0
list_a = []
list_b = []
chr_no = 0
with open(name, encoding='utf-8-sig') as file:
    for line in file:
        lines += 1
        list_a.extend(line.split())
    list_a.pop(0)
    list_a.pop(2)
    for i, _ in enumerate(list_a):
        for word in list_a[i]:
            list_b.append(word)
    for k, v in enumerate(list_b):
        if v != '=' and v != '-':
            chr_no += 1

print(list_a)
print(list_b)
print('{0} 파일은 {1} 줄, {2} 단어, {3}문자로 구성되어 있습니다.'.format(name, lines, len(list_a), chr_no))