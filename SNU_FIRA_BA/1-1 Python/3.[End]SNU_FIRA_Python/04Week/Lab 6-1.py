
from collections import Counter
L = [1, 1, 7, 7, 7, 4, 4, 4, 2, 1, 5, 5, 9, 11, 3, 'a', 'x', 9, 8, 'b', 'b', 'z', 'b']


counts = Counter(L)
print(counts)
print(counts.keys)
for key in counts.keys():
    if counts[key] > 2:
        print(key)