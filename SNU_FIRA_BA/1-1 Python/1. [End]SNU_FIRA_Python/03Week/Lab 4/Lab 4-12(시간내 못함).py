
salary = {'David':30000,
          'John':50000,
          'Andrew':45000,
          'Rita':70000,
          'Michael':10000}


print(salary.keys())
print(salary.values())
print(salary.items())

for key in salary.keys():   #추출하는거 왜이리못하지....
    if salary[key] >= 50000:
        print(key)

