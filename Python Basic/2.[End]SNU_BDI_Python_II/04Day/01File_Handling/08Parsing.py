file = open('pitcher_stats.txt',mode='r',encoding='utf-8')
data = file.read().splitlines()
file.close()

data_parsed = data
for i in range(len((data))):
    data_parsed[i] = data_parsed[i].split('/')


data_converted = data_parsed
for i in range(len(data_converted)):
    for j in range(1,3):
        data_converted[i][j]=int(data_converted[i][j])

for i in range(len(data_converted)):
    data_converted[i][3]=float(data_converted[i][3])

print(data_converted)
