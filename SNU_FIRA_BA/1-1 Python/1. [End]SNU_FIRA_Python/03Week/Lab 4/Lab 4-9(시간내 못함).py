# 2차원 리스트

alpha = [['A', 'B', 'C', 'D', 'E'], ['F', 'G', 'H', 'I', 'J'], ['K', 'L', 'M', 'N', 'O']]


small = []
for i, _ in enumerate(alpha):
    small.append([x.lower() for x in alpha[i]])


for j, _ in enumerate(small):
    for k, _ in enumerate(small[j]):
        print(small[j][k])



for row in alpha:
    for column in row:
        print(column.lower(), end = ' ')   #바로 column.lower() 해도 뽑아지네?
    print('\n')