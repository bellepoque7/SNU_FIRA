
def reverse_odd_text(*s):
    count = 0
    for i, j in enumerate(s):
        if len(s[i]) % 2 == 0:
            print(j)
        else:
            print(j[::-1])
            count += 1
    return count



print(reverse_odd_text('blue','red','나는 뭐입니까'))
