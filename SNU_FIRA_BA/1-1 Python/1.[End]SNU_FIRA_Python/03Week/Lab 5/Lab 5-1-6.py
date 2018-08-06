
def vowel(L):

    candiate = 'aeiou'
    each_letters = []
    count = 0
    for i in range(len(L)):
        each_letters.append(L[i])

    for j in range(len(each_letters)):
        for alpabet in range(len(candiate)):
            if each_letters[j] == candiate[alpabet]:
                count += 1

    return count



vowel('apples')


