def calculator_int(*numbers):
    sum = 0
    count = 0

    for i in numbers:
        if i != 0:
            sum += i
            count += 1
        else:
            break
    return (sum, int(round(sum / count, 0)))

print(calculator_int(1,4,5))