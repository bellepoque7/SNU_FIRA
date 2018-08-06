import itertools


st_1 = ['A', 'E','I','O','U']
nd_2 = ['a','b','c','d','e','A','B','C','D','E']
rd_3 = [2, 3]
th_4 = [1, 3, 5]


a = list(itertools.product(st_1, nd_2, rd_3, th_4))
print(a)
print(len(a))