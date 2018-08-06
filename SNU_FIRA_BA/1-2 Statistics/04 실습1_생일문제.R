실습1

The Birthday problem

q = 1
p = 1 - q
n = 1

while (p<0.5){
  n = n + 1
  q = q*((366-n)/365)
  p = 1-q
}

n