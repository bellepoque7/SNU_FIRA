#Lab 2-3-3

print("이름을 입력하세요...:")
name = input()

print("The length of your name is",len(name))
print("당신의 이름은 {}자입니다".format(len(name)))

#또는 print('당신 이름은', str(len(name))+'자 입니다.')
#+를 통해 접합 시킬 수 있다.

age = input('몇살이세요? ')
print(age)
print("You will be",int(age),"years old in the next year.")
print("내년에 {}살이 되시는군요".format(int(age)+1))
print("Bye~~~!")