s = '파이썬을 배우면서 즐기자!!!'
print('{}'.format(s))
print('{:25}'.format(s))
print('{:=^25}'.format(s))
print('{:>25}'.format(s))
print('{:~<25}'.format(s))
print('{:.15}'.format(s))

pos_int = 123456789
neg_int = -123456789

print('{}'.format(pos_int))
print('{}'.format(neg_int))

print('{:15}'.format(pos_int))
print('{:15}'.format(neg_int))


print('{:*<15}'.format(pos_int))
print('{:$>15}'.format(neg_int))

print('{:#^15}'.format(pos_int))

import math
real = 10**3 * math.pi

print(real)
print()
print('{:15.2e}'.format(real))
print('{:*>15.4e}'.format(real))
print('{:*< 15.3e}'.format(real))