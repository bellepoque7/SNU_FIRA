# 이야 이게 두줄로 되네...

with open('pitcher_stats.txt', encoding='utf-8-sig') as f:
    list_b = [line.strip('\n').split('/') for line in f.readlines()]

print(list_b)

