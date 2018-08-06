colors = ['red', 'blue', 'pink', 'green', 'yellow', 'purple']
i = 0
while i < len(colors):
    if colors[i].startswith('p'):    # startswith 쓰는 게 더 바람직. 인덱스보다.
        print(colors[i])
    i += 1