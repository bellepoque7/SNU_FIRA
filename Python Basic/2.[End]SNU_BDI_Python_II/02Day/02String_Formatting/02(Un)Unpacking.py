kor = '포도'
eng = 'grape'
d = dict(eng='apple', kor='사과')

s = '{kor}의 영어 표현은 {eng}입니다.'
print(s.format(**locals()))
print(s.format(**d))

d = {'재고품목': ['펜','연필', '편지 봉투', '종이 클립','메모장']}
print('우리가 현재 재고로 가지고 있는 품목은 {재고품목[0]}, {재고품목[2]}입니다.'.format(**d))