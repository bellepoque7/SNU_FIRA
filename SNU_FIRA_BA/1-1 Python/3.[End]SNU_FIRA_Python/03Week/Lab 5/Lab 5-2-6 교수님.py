
def sort_by_word_length(*words):
    t = []
    for w in words:
        t.append((len(w),w))

    t.sort(reverse=True)
    sorted_word = []
    for length, w in t:
        sorted_word.append(w)
    return sorted_word

print(sort_by_word_length('red','blue', 'green', 'brown', 'gray'))

# 축약

def sort_by(*words):
    t = [(len(w), w) for w in words]
    t.sort(reverse=True)
    return [w for length, w in t]

print(sort_by_word_length('red','blue', 'green', 'brown', 'gray'))