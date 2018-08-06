#Assignment Number...: 1
#Student Name........: 임정
#File Name...........:hw1_임정
#Program Description.: 기본적인 자료형과 input함수를 활용하는 과제입니다.

season = input('What is your favorite season? ')  #Input 함수를 이용해 입력받은 내용을 season 변수에 저장
print(season)                                     #print 함수를 이용하여 season 변수 출력
date = input('Which date were you born? ')        #input 함수를 이용해 data 변수에 저장
print(type(date))                                 #data변수를 type함수를 이용하여 형태를 출력
date = float(date)                                #data을 float함수로 소수점형태로 변환
print(type(date))                                 #data변수 type함수를 이용하여 형태를 출력
print("My favorite season is", season +           #변수와 문자열을 이용해 출력
      ". I was born on the",str(int(date))+"th.") #date를 정수형으로 변환시킨후 문자열과 접합
