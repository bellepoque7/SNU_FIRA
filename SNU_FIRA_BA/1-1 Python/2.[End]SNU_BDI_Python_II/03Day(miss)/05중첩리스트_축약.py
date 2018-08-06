pairs = [(x,y) for x in range(2,10)
         for y in range(1,10)]
print(pairs)

multiplication_tuple = [(x,y, x*y) for x in range(2,10)
                        for y in range(1,10)]
print(multiplication_tuple)

triples = [(x,y,z)
           for x in range(1,10)
                for y in range(x+1,10)
                    for z in range(y+1, 10, x+1)]
print(triples)

pass_grades = [letter + sign for letter in 'ABCD' for sign in '+0']  #칸수가 2개로 자동 할당되네?
print(pass_grades)