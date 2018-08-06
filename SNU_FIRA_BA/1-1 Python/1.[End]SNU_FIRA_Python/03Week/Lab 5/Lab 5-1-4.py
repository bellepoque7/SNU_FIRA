
def expand_rectangle(W, L):
    origin_area = W*L
    W += 5
    L *= 2

    expand_area = W*L
    print('Width = ',W,'\n'+'Length = ',L)
    print('Area Ratio = {:.2f}'.format(origin_area/expand_area))       # 서식 명세 넣기


expand_rectangle(7, 10)