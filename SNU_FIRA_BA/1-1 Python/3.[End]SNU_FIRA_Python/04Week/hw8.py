# Assignment Number...: 8
# Student Name........: 임정
# File Name...........: hw8_임정
# Program Description.: 함수를 정의하고 활용하는 법을 익힌다.
#                       Package 와 Module 을 활용하는 법을 익힌다.

import datetime                                                  # datetime 모듈 불러오기
import calendar                                                  # calendar 모듈 불러오기
import collections                                               # collections 모듈 불러오기

# datetime 모듈을 불러와 현재 시간을 출력해본다.
now = datetime.datetime.now()                                    # datetime.now 함수를 이용해 now 변수에 할당
current = datetime.datetime.strftime(now, '%Y-%m-%d %H:%M:%S')   # strftime 함수로 년-월-일 시:분:초 를 할당
print(current)                                                   # 시간을 출력

# calendar 모듈을 불러와 현재 시간을 출력해 본다
print(calendar.isleap(2050))                                      # 2050년이 윤년인지여부를 출력
day = calendar.weekday(2050, 7, 7)                                # 2050년이 7월 7일이 무슨 요일인지 day 변수에 할당
print(day)                                                        # day 변수를 출력한다.


# 문장 내 모음 개수를 세고 가장 많은 개수를 모음을 대문자로 만든다.
def vowel(s):                                                      # vowel 함수를 정의, 하나의 전달인자
    cnt = collections.Counter(s)                                   # 전달받은 값을 Counter 함수를 이용해  cnt 에 할당
    print(cnt)
    vowels = {'a': 0, 'e': 0, 'i': 0, 'o': 0, 'u': 0}              # vowels dict 에 모음을 key 로 갯수를 value 로 저장
    max_num = 0                                                    # 빈도수가 가장 큰 모음을 저장하기 위한 변수 max_num
    for key in 'aeiou':                                            # aeiou 문자열에 대하여 반복문 작성
        vowels[key] = cnt[key]                                     # cnt 변수의 key 값을 vowels key 에 할당
        print('The number of {0}: {1}'.format(key, vowels[key]))   # key 값과 value 값을 출력
        if max_num < cnt[key]:                                     # 만약 value 값이 max_num 보다 더 크다면
            max_num = cnt[key]                                     # 그 value 을 max_num 에 할당
            max_chr = key                                          # 동시에 key 값을 max_chr 에 할당
    s = s.replace(max_chr, max_chr.upper())                        # max_chr 를 replace 함수로 이용해 대문자로 변경
    print(s)                                                       # 변경된 값을 출력
    return


vowel('The regret after not doing something is '                    # vowel 함수를 실행
      'bigger than that of doing something.')

import sys
print(sys.argv)