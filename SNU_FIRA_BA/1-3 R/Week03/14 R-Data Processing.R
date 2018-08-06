surveys <- read.csv(file = 'C:/Users/renz/Documents/GitHub/SNU_BDI_-JJJ-R/data/surveys.csv')
getwd()

str(surveys)
names(surveys)     # 5, 6, 9 plot_id, species_id, weight를 확인
surveys[,c(5,6,9)] #  그러나 위 방법은 너무 비효율적 -> match func쓰

match(c("plot_id", "species_id", "weight"),  names(surveys))  # plot_id가  어디있는지 확인
surveys[, match(c("plot_id", "species_id", "weight"),  names(surveys)) ]

surveys[,c("plot_id", "species_id", "weight") ] #열 이름 넣으며 ㄴ바로 나옴
surveys[c("plot_id", "species_id", "weight")] # 가장 좋은 방법은 리스 성질 이용.

# 열만 추출, 행만 출 해보자.

surveys$year == 1995  # year 열에서 조건 해당하는것만 True반
                      # 출력의 길이는vector
surveys[surveys$year == 1995, ] #슬라이싱
head(surveys[surveys$year == 1995, ])

# 기준잡기
surveys[surveys$weight<5, c("species_id", "sex", "weight")]   # 필드값이 없는 경우가 있음.
surveys[which(surveys$weight<5), c("species_id", "sex", "weight")] # which를 이용해 깔끔하게.

# 열 추가
surveys_ex <- surveys # 복사하고
surveys_ex$weight_kg <- surveys_ex$weight/1000
surveys_ex <- surveys_ex[!is.na(surveys_ex$weight_kg),]  # is.na 뜻 NA이면 T, 아니면 F 반환
                                                         # 여기서는 그 반대로 논리식.

# 통계량 계산, 집단 별로 정리하고싶다.

u = unique(surveys$sex)  # M, F, NA 확인 / 벡터를 반환. unique는 char int에서 모두 작동
length(u) # 3라는 뜻은 3개의 종류가 있다는 것. 
class(surveys$sex)
levels(surveys$sex) # 벡터이기 때문에 레벨 확인가능 -> 3가지 나온다 ! 맞다 ! 

# sex 별로 weight 값의 평균을 계산

mean( surveys$weight[surveys$sex == u[1]], na.rm = T )  # unique레벨이 1번째 인 애들의 평균을 계산하자.
mean( surveys$weight[surveys$sex == u[2]], na.rm = T )
mean( surveys$weight[surveys$sex == u[3]], na.rm = T )                                                        #na.rm = T  NA는 없애랑

# 코드가 너무 복잡하다 간단하게 할 수 있는 방법 없을까아?
# 그것은 바로 by 함수이다.

a <- by( data = surveys$weight, INDICES =  surveys$sex, FUN  = mean, na.rm = TRUE)    
                            # INDICES : factor를 가져온다.
                            # FUN: 적용할 함수  / 3줄 -> 1줄로 가능
a
a = unclass(a)
str(a)                    # 언클래스 해서 안에 내용 보기..?

# 인덱스 array를 알아서 만들어주는 함수 aggregate
aggregate(formula = weight ~ sex, data = surveys,
          FUN = mean, na.rm = TRUE)

# 복수계의 아이디를 생성 가능...  by문은 인덱스를 만들어야해서 힘듬

aggregate(formula = weight ~ sex + species_id, 
          data = surveys, FUN = mean, na.rm = TRUE)

aggregate(formula = weight ~ sex + species_id, 
          data = surveys, FUN = sd, na.rm = TRUE)  # 표준편차 구하기.
        # but 평균, 분산, 최소값을 한번에 추출하진 못함.

# 성별의 빈도를 계산해보자
table(surveys$sex)
table(surveys$sex, surveys$plot_id) # 교차 테이블을 만들어준다. 



# plot_id 값의 오름차순으로 데이터 정렬

surveys[order(surveys$plot_id),]

tmp <- surveys 
tmp <- tmp[order(tmp$plot_id),]                  # plot_id를 먼저 정렬
tmp <- tmp[order(tmp$month, decreasing = TRUE),] #그 상태에서 다시정렬
head(tmp)


###  dplyr 패키지 만듬 !!   # http://blog.naver.com/PostView.nhn?blogId=juhy9212&logNo=220843318113
if (!require(dplyr)) { install.packages("dplyr") ; library(dplyr)}

select(.data = surveys, plot_id, species_id, weight)

head(select(surveys, plot_id, species_id, weight))
select(.data = surveys, plot_id, species_id, weight) %>% head()
a = surveys %>% select(plot_id, species_id, weight)   # 이거 뭐지 놓침..
a
# 파이프라인 연산자의 역할 : 체인함수로 data를 계속 입력안해도 되게한다.


filter(.data = surveys, year == 1995) %>% head() 

filter(.data = surveys, year >= 1995 & weight > 20) %>% head() # 동시에 rate가 50보다 큰???
filter(.data = surveys, year >= 1995 , weight > 20) %>% head()


surveys %>%
  filter( !is.na(weight) ) %>%
  filter(weight < 5) %>%
  select(species_id, sex, weight) %>% head()

surveys_ex <- surveys %>% filter( !is.na(surveys$weight)) %>%
  mutate(weight_kg = weight / 1000) 


# 위에서는 by와 aggregate 함수를 이용했던것을 여기선 요러케

surveys %>%
  group_by(sex) %>%       # 묶고싶은 속성을 선택
  summarize(mean_weight = mean(weight, na.rm = TRUE))

surveys %>%
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE))

surveys %>%
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight),
            var_weight = var(weight),
            min_weight = min(weight),
            max_weight = max(weight)) %>%
  print(n = 5)                        # aggregate는 여러번 써야하는데 이건 간단


# 데이터 성별의 빈도를 계산
surveys %>%
  group_by(sex) %>%
  tally()

surveys %>%
  group_by(plot_id, sex) %>%
  tally()

# month가 정렬된 상태에서plot_id로 정렬
surveys %>% arrange(month, plot_id) %>% head()
surveys %>% arrange(desc(month), plot_id) %>% head() # 내림차순하고 싶으면?
                # arrange앞에 surveys가 어야하는데 그걸 받아들이는게 파이프라인
                # arrange한 걸 또 head()에게 넘기는것. 


 ## reshape2

# Long format과 wide  format 서로 바꾸기
# melt 함수는 wide -> long foramt데이터로 변경해준다.

if (!require(dplyr)) { install.packages("dplyr") ; library(dplyr) }
if (!require(reshape2)) { install.packages("reshape2") ; library(reshape2) }


head(airquality, n = 3)

head(melt(airquality), n = 3)  #  순서대로 풀어버린다. array방식으로 

names(airquality) <-  tolower(names(airquality))
aql <- melt(data = airquality, id.vars= c("month","day")) 
      #  id.vars 를 지정하여 long foramt행을 구분하려한다.
head(aql, n = 3)


# dcase는 long format을  wide format으로 변경하는 함수이다.
knitr::include_graphics("./fig/reshape2-1.JPG")


if (!require(reshape2)) { install.packages("reshape2") ; library(reshape2) }

aqw <- dcast(aql, month + day ~ climate_variable, value.var ="climate_value")
   # 왜 ?? 안돼지?


#Skill craft
# 탐색적 자료 분석을 실시해라.
