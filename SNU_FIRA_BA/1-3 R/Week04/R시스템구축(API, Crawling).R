# 1.  교수님이 생각하는 R 시스템이란?

# API, Crawling, data collection을 한다. 어떤 내용이든 파일로 저장가능(csv등으로)
# 여기서 콜렉션을 DB로 바꾸는건 DB 전문가가 할일이지 우리가 할일은아니다.
# API, crawling는  dplyr 을 이용하여 data structure를 잡는다.(분석목적에 맞게)

# -> analysis : lm, glm, svm, neural network 등을 중간에 채워넣는다. 
# anyalsis 가 되면 결과가 나오겠지 (visualtization): barplot, boxplot, digitplot, ditplot
# API부터 시각화까지 하나의 프로세스라고 볼수 가 있을것이다.
# 통계로 묶어내는게 analysis 시스템이다.

# 이게 돌아가기위해서 우리가 무얼해야할까? 
# 1. (수집)한시간에 한번씩 실행코드를 돌린다 -> 자동화시킨다. 
# 2. R의 실행코드를 돌린다. execute
# 3. (정제)dplyer로 정해진 시간에 실행한다. -> 내가 짠 분석코드를 실행한다 (정해진시간에)
# 4. 정해진 시간에 기록한다. 
# 5. 기록된 데이터를 시각화한다. ( batch: 기록될때마다, interactive하게 보정하면서)
# 그럼 이런 내용을 정해진 시간에 실행하는것 -> R.script.exe 에서 백그라운드에서 실행시킴
# 마지막 작업은 R shiny 앱을 사용하여 interactive 머시기 하는거. 

# 분석은 3학기동안 연습해야하는것이다.
# 반면 수집, 정제(dplyr) 시각화는 이번학기 아니면 안배운다... 감을 잃지 말아야한다.



## 2.번쨰 이야기.

# interactive 범위는 result가 나와있는 batch단위로 쌓이고 실시간으로 상호작용으로
# 업데이트 할수있는 것이다.
# anaylsis까지 interactive하게 하고 싶다?  interactive를 분석까지 확장시키고싶다.
# 그럼 생기는 문제는 시스템 과부화... (시각화는 작은 메모리만 있어도된다)
# 대규모 matirx의 인버젼이나 최적화와 같은 것들이 있다.
# compuation과 memory가 그것 (전자는 CPU를 후자는 메모리를 잡아먹는것)
# 어떠한 분석기법까지 할 수 있는가? 


# 만약 데이터전처리까지 확장하고 싶다면?  할수야 있지만 서비스할수있는사람에 따라
# 달라질것. 서비스 받는 사람이 많아질수록 interactivity가 증가할 것이다. 
