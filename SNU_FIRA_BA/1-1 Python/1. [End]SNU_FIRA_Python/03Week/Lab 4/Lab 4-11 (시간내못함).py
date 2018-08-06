#윤년 계산

year = []

for i in range(2000, 3001):
    if i % 4 == 0 and i % 100 != 0 or i % 400 == 0:  # 왜이리 허무하냐...
            year.append(i)

print(len(year))


print()

yun_year = [i for i in range(2000, 3001) if i % 4 == 0 and i % 100 != 0 or i % 400 ==0]
print(yun_year)
print(len(yun_year))