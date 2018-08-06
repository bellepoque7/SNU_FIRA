
def vowel(s):
    vowels = ('a','e', 'i', 'o', 'u')
    count = 0
    for char in s:
        if char == vowel:
            count += 1

vowel('Apple')