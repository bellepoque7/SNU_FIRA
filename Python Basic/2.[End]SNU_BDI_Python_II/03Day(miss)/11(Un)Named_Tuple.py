from collections import namedtuple
RGBtuple = namedtuple('RGB', ['red', 'green', 'blue'])
print(RGBtuple)

x1 = RGBtuple(255,51,102)
print(x1)
x2 = RGBtuple(blue=51,red=102,green=152)
print(x2)
x3 = RGBtuple(0,blue=204,green=51)
print(x3)


r,g,b = x2
print(r,g,b)
print(x1[0])
print(x3.red)

# 네임드 튜플의 선택 전달인자 활용

PythonCourse = namedtuple('Studnet', 'id, name, name, exam, exam, grade',
                          rename=True,
                          module='exmaples')

print(PythonCourse)
s = PythonCourse('12345', '홍','길동',91,95,'Ao')
print(s)

## 네임드 튜블의 속성과 메소드 활용
NationalHoliday = namedtuple('국경일', 'name month day')
print(NationalHoliday)

hangulday = NationalHoliday('한글날', '10월','9월')
print(hangulday)

print(getattr(hangulday,'name')) # name이라는 키값을 가지고있는 속성값을 반환
print(hangulday._fields) #_fields 속성은 이름들을 튜플 형식의 문자열로 가지고 있음
print(hangulday._replace(month='October',day='9th')) # _replace(**kwargs) 메소드는 특성한 속성을 새로운 값으로 교체
print(hangulday)  #교체 하고 수정되진 않는다. 원본 그대로

hanguleng = hangulday._replace(month = 'October', day = '9th')
print(hanguleng)
print(hangulday)

print(hangulday._asdict()) # _asdic() 메소드는 필드(속성) 이름과 값을 맵핑하는 새로운 OrderDict의 인스턴스를 반환.
                            # OrderDict 항목을 담을 때 추가된 순서대로 항목을 저장.

constitutionday = hangulday._make(['제헌절', '7월', '17일']) #make 메소드는 자룔르 새로받아 반환.
print(constitutionday) #replace와 달리 원본이 바뀜.

print(hangulday._source) # _source 속성은 클래스 정의를 출력  안돼는데???