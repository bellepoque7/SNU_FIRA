x = {i : pow(i,2) for i in range(-9,10)}
print (x)  #딕셔너리는 키와 값이 따로있다.

koreng = dict(사과 ='apple', 블루베리 = 'blueberry', 딸기 = 'strawberry', 키위='kiwi', 바나나 ='banana', 포도 = 'grage', 자두 = 'plum')

print(koreng)

engkor = {v: k for k, v in koreng.items()}
print(sorted(engkor.items()))