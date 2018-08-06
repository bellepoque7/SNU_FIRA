
mylist = [1,2,3]
mytuple = ('a','b','c')


def search(seq,e):
    if e in seq:
        return seq.index(e)
    return False

