# 한개 이상의 점수(0점이상 100점 이하)를 받아 가장 높은 수부터 낮은 점수까지 차례대로 출력하는 함수 구현

def sort_scores(*score):
    alist = sorted(list(score),reverse=True)
    num = len(alist)
    for i in range(num):
        print(alist[i])

print(sort_scores(100,27,65,88,46,97,75,53))   #왜 띄어쓰기로 안돼징.. for형태로 바꿔야함

