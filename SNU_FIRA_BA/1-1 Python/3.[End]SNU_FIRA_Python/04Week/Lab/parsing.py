
with open('grades.txt', encoding='utf-8-sig') as f:
    data = f.read().splitlines()

print(len(data))
print(data)

for i in range(len(data)):
    data[i] = data[i].split(',')

print(data)