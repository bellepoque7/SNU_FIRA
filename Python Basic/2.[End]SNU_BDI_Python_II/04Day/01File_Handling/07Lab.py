with open('고향의봄.txt',mode='r',encoding='utf-8') as f:
    lines = f.readlines()
    for n, line in enumerate(lines):
        print('{:4}:{}'.format(n,line.rstrip()))



file = open('고향의봄.txt',mode='r',encoding='utf-8')
alist = list(file)
for i in range((len(alist))):
 print(i,":",alist[i])             #비슷하네 내가원하는것인데 좀더 원시적