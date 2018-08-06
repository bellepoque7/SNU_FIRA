
def search_char(letter, target):
    if target in letter:
        return letter.index(target)
    return -1

print(search_char('Letter', 'e'))