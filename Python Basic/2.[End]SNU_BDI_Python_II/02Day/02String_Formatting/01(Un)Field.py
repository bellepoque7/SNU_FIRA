print('{0} : {1}악기에 속한다.'.format('드럼', '타'))

print("{instrument} : {type}악기에 속한다".format(type='현', instrument='기타'))

print('{instrument : {0}악기에 속한다'.format('건반', instrument='키보드')

# print('{instrumnet}: {0}악기에 속한다'.format(instrument='키보드', '건반))
 # 위지 전달인자는 반드시 키워드 전달인자보다 먼저 와야한다.


s = '1 + 2 = { }'    #왜 syntax 에러나지?
s.format ( 1 + 2 )

d = '{ }과 { }곱은 { } 입니다.'
for i in range(1,10):
    j = i+1
    print(d.format(i,j,i*j))