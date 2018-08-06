leap = []
for year in range(2000,3001):
    if year % 4 == 0 and year % 100 != 0 or year % 400 == 0:
        leap.append(year)

print(leap)

print([year for year in range(2000,3001) if year % 4 ==0 and year % 100 != 0 or year %4 ==0])  #위 순환문만 쓸수있으면 훨씬 간단하게 작업가능