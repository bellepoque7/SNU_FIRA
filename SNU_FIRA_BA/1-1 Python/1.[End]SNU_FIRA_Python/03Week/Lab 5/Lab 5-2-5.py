
def sort_scores(*n):
    r_order = sorted(n, reverse=True)
    for i in range(len(r_order)):
        print(r_order[i])

sort_scores(100, 99,70, 94, 60)