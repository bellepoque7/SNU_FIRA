# 홀수만 출력하는 for문

integers = [ k+1 for k in range(10)]
for i in integers:
    if i % 2 == 1:
        print(i)