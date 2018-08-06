fruits = [('블루베리', 51),('사과',19),('바나나',25)]

from collections import OrderedDict
x1 = OrderedDict(sorted(fruits))
x2 = OrderedDict(sorted(fruits, key=lambda e: len(e[0])))   #요게 무슨표시지?
x3 = OrderedDict(sorted(fruits, key=lambda e: e[1], reverse=True))

print(x1)
print(x2)
print(x3)


# 디폴트 딕셔너리의 응용2

tasks = OrderedDict()
tasks[1] = '이메일 확인 및 답변'
tasks[2] = '강의준비'
tasks[3] = '강의 자료 올리기'
tasks[4] = '백업'
tasks[5] = '점심'
tasks[6] = '강의'
tasks[7] = '면담'

print(list(tasks.items()))
print(list(tasks.values()))
print(tasks.popitem())  # LIFO 맨나중에 들어갓것 뽑기
print(list(tasks.values()))  # 맨뒤에꺼 뽑아서 사라짐.

# 디폴트 딕셔너리의 응용 2

print(tasks.popitem(last=False)) # FIFO 맨처음에 들어간거 뽑기
print(list(tasks.values()))
print(list(tasks.items())) #왜 item()일까

print(tasks.move_to_end(4))  #move to end? 맨뒤로 옮긴다구?
print(tasks.move_to_end(3, last=False))
print(list(tasks.items()))

print(list(reversed(tasks.values())))