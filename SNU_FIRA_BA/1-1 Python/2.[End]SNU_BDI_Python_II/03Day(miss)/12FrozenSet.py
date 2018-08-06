s = {1,2,3,4,5}
t = frozenset({3,5,7,8,9})
x = s&t
y = t&s

print(x)
print(y)

print(type(x))
print(type(y))

