
def search_char(word, char):
    if char in word:
        return word.index(char)
    return -1


print(search_char('Pyhon','o'))