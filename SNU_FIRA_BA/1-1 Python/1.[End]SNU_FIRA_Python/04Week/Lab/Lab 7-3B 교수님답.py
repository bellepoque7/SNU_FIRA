import string
from collections import defaultdict

words = defaultdict(int)

strip = string.whitespace + string.punctuation + string.digits

filename = input('파일 이름..:')

with open(filename, encoding='utf-8') as f:
    for line in f:
        for word in line.lower().split():
            word = word.strip(strip)
            if len(word) == 0: continue
            words[word] += 1

for word in sorted(words):
    print('<{}> : {} 번출현'.format(word, words[word]))