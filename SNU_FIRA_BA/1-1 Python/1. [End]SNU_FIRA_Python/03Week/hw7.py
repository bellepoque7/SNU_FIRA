# Assignment Number...: 7
# Student Name........: 임정
# File Name...........: hw7_임정
# Program Description.: 파이썬을 이용해 재미있는 프로그램을 구성해본다.


# SNU_FIRA 육성게임

# 게임 규칙
# 최대 지식의 합이 도달하게한다.x
# 과목은 이론통계, R, Python 으로 이루어져 있다.

# 하루에 1씩 과목의 학습량이 증가한다.
# 주말에는 1/3 의 학습량이 감소한다.
# 주말에는 의지가 +20 증가한다.

# 변수설정

# 1. Python 과제를 잊었다.
# 2. 컴퓨터를 놓고왔다. (학습량 절반으로 감소)
# 3. 지각했다 (학습량이 절반으로 감소)
# 4. 결석했다. (학습량이 0)
# 5. 퀴즈 성적이 발표 -> 랜덤하게 의지력이 10 오르거나 10이 감소

# 마지막 대쉬보드 알려주기.(인터넷 서버에 올리기)

P_subject = 0
R_subject = 0
S_subject = 0

Eagerness = 0
Energy = 0
days = 0

name = input('학생 이름을 넣으시오...: ')
print('{}학생 어서오게! 서울대는 처음이지?'.format(name))
print('{}은 학구열과 에너지로 불탄다'.format(name))

while days < 30:
    print('Python = {0}, R = {1}, Statistics ={2}, Eagerness = {3}, Energy = {4]'.format(P_subject, R_subject, S_subject, Eagerness, Energy))
    action_1(input('방과후 행동을 입력하세요...:'))
    action_2(input('야간 행동을 입력하세요...:'))
    days += 1




def action_1(action):
    print('1. 파이썬 나머지 공부를 한다.')
    print('2. R 나머지 공부를 한다.')
    print('3. 통계 나머지 공부를 한다.')

    activity = input('파이선, R, 통계 중 하나의 행동을 입력하세요')

    if activity == '파이썬':
        print('파이썬의 지식의 늘어났습니다.')
        P_subject += 1
        print('{0} 의 지식: {}'.format(P_subject))
    elif activity == 'R':
        print('R의 공부량이 늘어났습니다.')
        R += 1
        print(R)
    elif activity == '통계':
        print('통계의 지식이 늘어났습니다.')
    return
