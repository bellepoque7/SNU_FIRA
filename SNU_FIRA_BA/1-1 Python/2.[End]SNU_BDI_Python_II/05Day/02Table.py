from pprint import pprint

with open('table.csv', mode='r', encoding='utf-8') as f:

    lines = f.readlines()   #각 줄이 스트링자료형으로 되어있는

    col_names = lines[0].strip().split(',')   #data 부터 Volume까지 잡힌다. 리스트로

    result = [] #전체 내용을 담을 빈 리스트 정의

    for line in lines[1:]: #나머지 행에서 전체 항목 데이터 처리
        row_dict = {} #해당 행 빈 사전 정의
        splited = line.strip().split(',') # 해당 행 ','기준 분할

        for i, col_name in enumerate(col_names): #각 항목마다 해당 행 사전에 key=value 쌍 추가
            row_dict[col_name] = splited[i]   #해당 행에 있는 내용을 줄바꿈 제외한에ㅡㄹ

        result.append(row_dict) #해당 행 사전 완성 후 최종 결과 리스트에 추가

pprint(result)   #Key -Value 따로 잡힌다.