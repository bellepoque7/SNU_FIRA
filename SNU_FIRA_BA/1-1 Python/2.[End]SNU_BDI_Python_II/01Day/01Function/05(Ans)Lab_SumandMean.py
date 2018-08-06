def carculator_int(*num):
    numbers = len(num)    #len 함수가 원소의 갯수를 확인함
    #return (sum(num), sum(num) / numbers)
    hap = 0

    for i in range(numbers):
        if num[i] != 0:
            hap += num[i]
        else:
            return hap, round(hap / numbers, 0)

    return hap, round(hap / numbers, 0)

print(carculator_int(7, 8, 11))