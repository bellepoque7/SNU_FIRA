# list()
# 1개의 전달인자 필요

def string_head(text, length=7, indicator='...'):
    if len(text) > length:
        text = text[:length - len(indicator)] + indicator   #구문 잘 이해안가네. []와 : 가 무슨뜻이징..
    return text
s = '파이썬과 빅데이터 분석'  #길이 12개
string_head(s)
print(string_head(s))
print(string_head(s, 9))
print(s,9,'!!!')  #indicator를 !!!로 바꾸겠다.
print(s,20,'!!!')

# print(string_head(s,length=20,'!!!'))  -> 에러
# print(string_head(s,'!!!')) -> 에러

