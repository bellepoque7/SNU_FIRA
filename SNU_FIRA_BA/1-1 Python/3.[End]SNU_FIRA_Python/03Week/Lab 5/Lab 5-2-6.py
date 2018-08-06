#딕셔너리를 만들어라

#{ 1:'


def sort_by_word_length(*s):
    letters = []

    for i in range(len(s)):
        letters.append(s[i])

    for j in range(len(letters)):
        number = len(letters[j])
        letters[j] = str(number) + letters[j]

    letters = sorted(letters, reverse=True)

    print(letters)

    for k in range(len(letters)):
        letters[k] = letters[k][1:]
    return letters

print(sort_by_word_length('red','blue', 'green', 'brown', 'gray'))