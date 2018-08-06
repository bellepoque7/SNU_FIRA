with open('MLB_batter.csv',mode='r',encoding='utf-8') as f:
    lines = f.readline()
    col_names = lines[0].strip().split(',')
    result  = []
    for line in lines[1:]:
        row_dict = {}
        splited = line.strip().split(',')

        for i,col_names in enumerate(col_names):
            row_dict[col_name] = splited[i]
        result.append(row_dict)
print(result)






#HR(홈런)이 30개 이상인 선수 중 AVR(타율)이 0.300을 넘는 선수들의 목록
#SO(삼진)이 130개 넘는 선수 중 H(안타)가 100개 미만인 선수들의 목록