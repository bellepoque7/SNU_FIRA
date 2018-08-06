def carculator_int(*numbers):
    alist = list(numbers)
    anumber = len(alist)
    for j in range(anumber):
        if alist[j] != 0:
            for i in range(anumber):
                return (sum(alist),round(sum(alist)/anumber))
        else:
            return (sum(alist), round(sum(alist)/anumber))

print(carculator_int(1,2,3))
print(carculator_int(2,4,5))