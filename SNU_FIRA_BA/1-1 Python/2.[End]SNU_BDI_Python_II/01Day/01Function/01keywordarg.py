def product_in_units(i,j,k,*, units='squrare meters'):   # *위치 뒤 에는 위치전달인자 못오고 키워드 전달인자만 올수 있음
    result = i*j*k
    return '{} {}'.format(result,units)

print(product_in_units(2,3,4))
print(product_in_units(2,3,4, units='square inches'))
# print(product_in_units(2,3,4, 'square inches'))  --> 에러.  함수 정의에서 *,를 제거하면 작동함. Line 12

def product1(i,j,k, units='square meters'):
    result = i*j*k
    return '{} {}'.format(result,units)
print(product1(2,3,4, 'square inches revised'))


def print_setup(*, paper = 'A4', copies=1, color=False):
    print("프린터 셋팅: paper = '{}', copies = {}, color={}". format(paper, copies, color))

print(print_setup())  #기본 값 출력
print(print_setup(paper='Letter', color = True))
# print(print_setup('Letter'))  -> 에러 반환 위치전달인자로 쓰면 안됌., print_setup함수에서 * 빼면 정상작동

