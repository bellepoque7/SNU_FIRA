# Assignment Number...: 10
# Student Name........: 임정
# File Name...........: hw10_임정
# Program Description.: 파일을 열고 자료를 처리하는 법을 익힌다.


info = []                                            # 빈 리스트를 생성
final = []                                           # 최종 딕셔너리들이 들어갈 빈 리스트를 생성


with open('subway.txt', encoding='utf-8-sig') as file:    # subway.txt를 with 명령어와 open 함수로 읽고 file로 할당한다.
    for line in file:                                 # 파일의 1줄을 line으로 읽는다.
        line = line.strip('\n')                           # \n내용을 지워서 다시 line으로 할당
        info.append(list(line.split(',')))            # ','를 기준으로 line을 나누어 info 리스트에 추가
keyword = info.pop(0)                                 # info 의 첫 번째 요소를 꺼내어 키워드에 저장

print(info)

for n,_ in enumerate((info)):                         # info 의 갯수 만큼
    final.append({})                                  # 빈 딕셔너리를 만듦
    for i,j in enumerate(keyword):                    # 키워드에 대해서 인덱스와 값을 반복시켜
        final[n][j] = info[n][i]                      # final의 각 딕셔너리에 넣는다.



print('========== 테스트 1 ==========\n'                   # 테스트 1
      '토요일날 승차한 것들만의 날짜')                       # 토요일날 승차한 것들 만의 날짜
for _, j in enumerate(final):                             # final 리스트에 대한 반복문
    if j['요일'] == '토' and j['구분'] == '승차':           # '요일' 값과 '구분' 값이 각각 '토', '승차' 이면
        print('{0}일({1})'.format(j['날짜'], j['요일']))   # 해당 요소를 출력하라.




print('\n========== 테스트 2 ==========\n'                           # 테스트 2
      '20일 이후 중에 9시 승차 인원이 10,000명 이상인 날짜(요일)')       # 20일 이후 중 9시 승차인원이 10,000원 이상이 날짜(요일)
for _, j in enumerate(final):                                       # final 리스트에 대한 반복문
    if int(j['날짜']) > 20 and int(j['9']) > 10000:                 # 날짜 값이 20 이상, '9'의 값이 10,000 명이상일때
        print('{0}일({1})'.format(j['날짜'],j['요일']))              # 해당 날짜와 요일을 출력



print('\n========== 테스트 3 ==========\n'                                    # 테스트 3
      '모든 날짜 중 평일에 대하여 9시 탑승인원이 평균인원보다 탑승인원이 '
      '많은 날짜와 인원수 현황.')                                              # 평일중 9시에 탑승인원이 평균보다 많은 날짜 도출
sum = 0                                                                      # sum = 0 할당
n = len(info)                                                                # 총 data의 갯수를 할당
for _, j in enumerate(final):                                                # final 에 대한 반복문
    sum += int(j['9'])                                                       # '9'에 대한 값을 모두 더해서
mean = sum/n                                                                 # 평균을 mean 에 할당
for i, j in enumerate(final):                                                # final 에 대한 반복문
    if (j['요일'] != '토' and j['요일'] != '일') and int(j['9']) > mean :     # 토, 일을 제외하고 '9'값이 평균 이상이라면
        print('{0}일({1})에 9시 탑승객은 {2:,}명입니다.'                       # 그 날짜와 요일, 9시 탑승객을 도출
              .format(j['날짜'], j['요일'], int(j['9'])))
