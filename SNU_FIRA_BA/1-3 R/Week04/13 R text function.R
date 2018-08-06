# 텍스트 마이닝은 가장 많이 그리고 노가다 의 단락
# http://maedoop.dothome.co.kr/2231

paste("감자로","만든","감자칩", sep='-')
paste("감자로","만든","감자칩", sep='')
paste("감자로","만든","감자칩")
paste(c("감자로 만든","고구마로 만든"), c("감자칩", "고구마칩"), sep=' ')
  # component wisley operation.
paste0(1:12, c("st", "nd", "rd", rep("th", 9)))


# collapse 옵션 사용
paste0(1:12, collapse = "-")  # paste0 : 아무 공백 없이 붙이겠다는 것.
paste(1:4,5:8, sep = ';')
paste(1:4,5:8, sep = ';', collapse = '-')   # sep이랑 collapse 햇갈림

paste0(1:12, collapse = '') # 그냥 다 붙여버려랴
paste(1:12, sep = ' ')
paste(1:12, collapse = ' ')    # 뭐가 다르냐...


# grep 문자열에 패턴이 포함되어있는지,  포함되어있으면 그 위치를 반환함
grep("pole", c("Equator", "North Pole", "South pole", "poles"))
  # 대 소문자 구별기때문에 3,4 

grep('a', 'bbb') #  첫번째 위치에 앞이 패턴을 가지고 있다. 
grep('a', c('bbb', 'bbabb')) # 2번째 원소에 앞의 패턴을 가지고있다

nchar(c("South Pole", "한글 문자열", NA)) # 공백 포함해서 해주네.


# substr 반드시 시작, 끝남 위치가 정해져야 하고  substirn은 예외
substr("Equator", start=2, stop=4)
substr("한글 문자열 추출", start=2,stop=4)
substring("한글 문자열 추출", first=2)  # substring
?substr


#string silpit

# \\t, 탭 / \\n 엔터 / \\d ==[0-9] 숫자.

strsplit("6-16-2011", split = '-')  # 파이썬과 동일하게 구분자는 날려버리기
strsplit("6*16*2011", split = '*') #이게머야.. 다 하나씩 나눠져??
                                   # * 애스터리크는 모든문자를 말하는거

strsplit("6*16*2011", split = '*', fixed = TRUE) # fixed?
?strsplit

strsplit("6*16*2011", split = '\\*')   #  이거 뭘까...?
                                  #\\* 는 하나의 문자열 *를 나타내느것.
strsplit('list.files', split = '\\.')
strsplit('list.files', split = '.') # 이건 왜 다나눠질까? 


a = strsplit('list.files', split = '.', fixed = T)
a


tmp = c()
#tmp = rep(NA, length(a))
for (i in 1:length(a)){
  b = a[[i]]
  if (length(b) == 2){
    tmp = c(tmp, tail(b, n = 1))
    #tmp[i] = tail(b, n = 1)
  }
}
tmp

# reg expr 함수: 
regexpr("감자", "맛있는 감자칩")  

a <- regexpr("감자", "맛있는 감자칩") # 
attr(a, 'match.length')  # attribute 확인 가능 

# gsub  완전 중요 많이 쓰는 함수 
gsub(pattern = "감자", replacement='고구마',
     x= "머리를 감자마자 감자칩을 먹었다.") # 웹스크래핑 했을때 바꾸고싶ㅇ서

gsub(pattern = "<br>", replacement='',
     x= "머리를 감자마자 <br>감자칩을 먹었다.")

# 정규표현식 ->> 어려운거..6 개의 큰 카테고리로 나누워서 설명


strsplit('감자, 고구마, 양파 그리고 파이어볼', split ='(,)|(그리고)')

# ^함수 를 쓰면 시작하는 문자열만 제거 
grep(pattern = '^(감자)', x = '감자는 고구마를 좋아해')
grep(pattern = '^(감자)', x = '고구마는 감자를 안 좋아해')
?grep


# $ 함수를 쓰면 끝나 문자열만 제거 
grep(pattern = '(좋아해)$', x = '감자는 고구마를 좋해')
grep(pattern = '(좋아해)$', x = '고구마는 감자를 안 좋아해')


# any : 어떤거 하나라도 있으면 T
gregexpr(pattern = '[아자차카]', text = '고구마는 감자를 안 좋아해')  # 아자차카 1개의 문자 4종류의 요소
  # 감'자', 좋'아' 패턴과 일치하는 곳.
  # 4개의 글자가 묶여있으니 '아'자'차'카' 로 각각 찾는다.소

  # cf) [아자]{2}  [아자]라는 문자가 2번 반복되는것
  # (ab){2} : abab 
  # ab{2}: abb


gregexpr(pattern = '[(사과)(감자)(양파)]', text = '고구마는 감자를 안 좋아해')
# 사, 과, 감, 자 , 양, 파  각 탐색
#[] 안에 ()는 작동 안한다.

gregexpr(pattern = '[(사과)(감자)(양파)]', text = '고구마는 감자를 안 좋아해')
# 시작하는 곳없어서 - 1를 반환.

# Everything except. 
grep(pattern = '^[^(사과)(감자)(양파)]', x = '감자는 고구마를 좋아해')
    # 처음 ^: ~로 시작하는 이라느 의미 ^사과감자양파를 제외한 어떤거라도 올수있다.
    # 끝은 $
    # ^의 의미는 []안 밖에서 다르다.  이해 안간다...


grep(pattern = '^ab{2,3}', x = 'ab')  #{}는 바로 앞문자 b만 가르키는것  2번에서 3번 반복
grep(pattern = '^ab{2,3}', x = 'abab') 
grep(pattern = '^ab{2,3}', x = 'abbb')
grep(pattern = '^(ab){2,3}', x = 'abab') # 반복과 같이쓸때는 작동.
  #  ab가 하나의문자처럼 작동.

grep(pattern = '^(ab){2,3}', x = 'bab')

# a*  
# a+ a가 한번은 와야하고 
# a? a가 오든지 안오든지. 
# .은 어떤 문자라도 1개

# 텍스트 마이닝이 많다.

^[1-9][0-9]*$  # 10 올 수 있는가? ㅇㅇ 7 되나? ㅇㅇ* 안아와도 된다.
# 124 가능 ㅇㅇ
# $ 끝나라 표시. [0-9]* 계속해서 반복할수있다.
  
  ^(0|([1-9][0-9]*))$ # 0을 포함한 자연수.
  
  ^[0-9]+(\\.[0-9]{1,2})?$  # 3.141592 올수 있을까? ㄴㄴ
  #  + 뒤에 무족권 하나는 와야하\\. 진짜.으로 쓸것이다.
  # 0-9까지 1번 또는 2번 반복될 수 있다.
  # ?: 2번 올수 있다.
  # 3 올 수 있을까? ㅇㅇ
  # 뒤에서 ? 때문에 반복허용 안할수있다.

  
  ^[_a-z0-9-]+(\\.[_a-z0-9-]+)* @[a-z0-9-]+(\\.[a-z0-9-]+)*$  # 맨뒤에 * 붙어있기때문에 소괄호 안에 와도안도도된다.
  
  # [] 문자는 항상 한개다. 반복은 항상 앞에것만을 가르킨다. 전체를 가르키고싶으면 소괄호 써라. (ab){2}
  # + 는 한번 이상 ? 는 0 또는 1, * 는 0번 이상.
  # jj-.__.jeon@gmail.kr.com   
  # 앞에 문자열들이 반복된다음에 .. 온다. 
  # ^[_a-z0-9-] jj-o  중간 대괄호은 .jean(a)
  # .jean(a) = putacte8
    #jj,jeon@gmail.com 쉼표 만들곳 없어 못한다.
  
  
  
if(!require(stringr)){install.packages("stringr"); library(stringr)}
hw <- "Hadley Wickham"
str_sub(hw, 1, 6)  
str_sub(hw, -5)  

strsplit(hw, split='')[[1]][2]


shopping_list <- c("apples x4", "flour", "sugar", "milk x2", "사과")
str_extract(shopping_list, "\\d") # \\d : 숫자로 들어가있는거 찾아라
str_extract_all(shopping_list, "\\d+")
str_extract(shopping_list, '[가-힣]+')  #한글도 가져올 수 있음
 

# Gsub와 같은것

fruits <- c("one apple", "two pears", "three bananas")
str_replace(fruits, "[aeiou]", "-")

# html 태그를 표현하는 정규표현식 (네이버검색ㄱ)