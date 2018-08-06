# Assignment Number...: 9
# Student Name........: 임정
# File Name...........: hw9_임정
# Program Description.: csv 파일을 불러와 읽는 방법을 익힌다.
#                       txt 파일을 파싱하는 방법을 익힌다.


#1 open() 함수로 csv 파일을 불러온다.
with open('cars.csv', encoding='utf-8') as file:             # with 명령문을 이용해 해당파일을 file 에 할당
    for line in file:                                        # file 에 있는 문장 한줄마다
        print(line)                                          # 출력

#2 csv 파일을 불러와 파싱한다.
lines = []                                                          # 빈 리스트를 생성하고
with open('cars.csv', encoding='utf-8') as file:                    # with 명령문을 이용해 해달 파일를 file 에 할당
    for line in file:                                               # file 에 있는 문장 한줄마다
        lines.append(tuple(line.strip().split(',')))                        # 각 항목을 ,으로 끊어서 튜플 묶음으로 리스트에 저장
print(lines)                                                        # 리스트를 출력

#3 open()함수로 txt 파일을 불러온다.
with open('My way.txt', encoding='utf-8') as file:                  # with 명령문을 이용해 해달 파일를 file 에 할당
    for line in file:                                               # file 에 있는 문장 한줄마다
        print(line)                                                 # 출력

# txt파일을 불러와 파싱한다.
alist = []                                                           # 빈 리스트를 생성
with open('My way.txt', encoding='utf-8') as file:                   # with 명령문을 이용해 해달 파일를 file 에 할당
    for line in file:                                                # file 의 한 문장 마다
        alist.append(line)                                           # alist 리스트에 추가
print(alist[2])                                                      # 리스트 세 번째 요소를 출력

with open('My way.txt', mode='a', encoding='utf-8') as file:         # 문장을 추가하기위해 mode ='a'로 파일을 열기
    file.write('\nI\'ll state my case, of which I\'m certain')       # 필요한 내용을 추가

with open('My way.txt', encoding='utf-8') as file:                   # with 명령문을 이용해 해달 파일를 file 에 할당
    print(file.read())                                               # 모든 내용을 출력