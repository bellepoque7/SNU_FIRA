#Assignment Number...: 4
#Student Name........: 임정
#File Name...........: hw4_임정
#Program Description.: 제어문(조건문, 반복문)을 활용

restaurant_list = [{'상호': 'A', '메뉴': '피자', '가격(원)': 20000}, # 상호, 메뉴, 가격에 대한 리스트 입력
                   {'상호': 'B', '메뉴': '치킨', '가격(원)': 18000},
                   {'상호': 'C', '메뉴': '짜장면', '가격(원)': 5000},
                   {'상호': 'D', '메뉴': '초밥', '가격(원)': 15000},
                   {'상호': 'E', '메뉴': '치킨', '가격(원)': 23000},
                   {'상호': 'F', '메뉴': '족발', '가격(원)': 30000}]

want_to_eat = input('먹고 싶은 음식을 입력하세요 : ')             # 먹고 싶은 음식 입력 받기

candidate = []                                                    # candidate 리스트 생성
for i in range(len(restaurant_list)):                             # 레스토랑 리스트까지 순환문 설정
    if restaurant_list[i]['메뉴'] == want_to_eat:                 # 입력한 메뉴가 있을 경우
        candidate.append(i)                                       # candidate 리스트에 추가

if candidate:                                                     # candidate 리스트가 있을 경우
    for j in candidate:
        print('식당',restaurant_list[j]['상호']+', 가격',         # 모든 값에 대하여 출력
              restaurant_list[j]['가격(원)'],'원')
else:                                                             # candidate 리스트가 비었을 경우
    print('결과가 없습니다.')                                     # 결과없음 출력