set1 = {'a', 'b',3,}
set2 = {'a','b',3,'a',3}

print(len(set1), len(set2))    #왜 set2가 3개이지? 아 중복된거 제거.

print(set1)
print(set2)

s = {1,2,3,4,5}
t = {3,4,5,6,7}

print(s | t)
print(s & t)
print(s - t)
print(t - s)
print(s ^ t)
print(t ^ s)

s = {1,2,3,4}
print(len(s))

s.add(5)
print(s)

s.add(1)
print(s)

s.pop() #임의의 항목을 반환하고 해당항목을 삭제
print(s)

print(s) #삭제 된것이 유지

s.discard(1) # 1 없는데 왜 TypeError 반환 안하지?
print(s)

s = {1,2,3}
t = {2,3,4,5}
s &= t
print(s)

s = {1,2,3}
t = {2,3,4,5}
s -= t
print(s)

s = {1,2,3}
t = {2,3,4,5}
s ^=t
print(s)

s = {1,2,3}
t = {2,3,4,5}
s |=t
print(s)

print(s.discard(7))
# print(s.remove(7))   -> Key error