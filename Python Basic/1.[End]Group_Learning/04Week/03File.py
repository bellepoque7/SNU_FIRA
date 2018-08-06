with open("./hello.txt", mode ="w+") as f:
    f.write("hello \n")

f1 = open("./hello.txt", mode='r')
lines = f1.readlines()
f1.close()

print(lines)