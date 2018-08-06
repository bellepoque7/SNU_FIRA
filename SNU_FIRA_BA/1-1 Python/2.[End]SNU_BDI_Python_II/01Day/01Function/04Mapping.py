def print_setup(*, paper='A4', copies = 1, color=False):
    print("프린터 셋팅: paper='{}', copies={}, color={}".format(paper, copies, color))

options = dict(paper='Letter', color=True)
print(print_setup(**options))  # 맵핑형 ** 연산자를사용해 딕셔너리를 언패킹한다.

def add_fruit_detail(fruit_name, date_produced, **kwargs): ## **kwargs 키워드로된 전달인자를 받을 것이다.
    print('과일종류 =', fruit_name)
    print('생산일자 =', date_produced)
    for key in sorted(kwargs):  #키값으로 솔트해서 받는다.
        print('{} ={}',format(key, kwargs[key]))

add_fruit_detail('블루베리', '9일')
# add_fruit_detail('바나나', '11일', 원산지='필리핀')  # 키워드 전달인자가 들어감 원산지='필리핀'
# add_fruit_detail('오랜지', '11일', 원산지='제주도', 수량=55)



def print_args(*args, **kwargs):
    for i, arg in enumerate(args):
        print('위치전달인자 {} = {}'.format(i,arg))
    for key in kwargs:
        print('키워드 전달인자 {} ={}'.format(key, kwargs[key]))

print_args('라이언', -7, 2.5, age=19, email='ryan@korea.kr')