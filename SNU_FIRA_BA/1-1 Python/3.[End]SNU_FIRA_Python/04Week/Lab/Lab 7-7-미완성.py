
with open('pitcher_stats.txt', encoding='utf-8-sig') as f:
    list_b = [line.strip('\n').split('/') for line in f.readlines()]

print(list_b)

with open('pitcher_stats_new.txt', mode='w', encoding='utf-8') as f:
    for i, v in enumerate(list[0]):
        f.write(list_b[0][i])
