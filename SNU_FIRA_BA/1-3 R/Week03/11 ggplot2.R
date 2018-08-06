#ggplot은  인터넷에 책이 공개되어있으니 잘사용할것



rm(list = ls()); gc(reset = T)

# ----------------------
if(!require(ggplot2)){install.packages("ggplot2"); library(ggplot2)}
if(!require(reshape2)){install.packages("reshape2"); library(reshape2)}
if(!require(dplyr)){install.packages("dplyr"); library(dplyr)}

# ----------------------
head(msleep[,c(3, 6 ,11)])

# ----------------------
ggplot(data = msleep, aes(x = bodywt, y = sleep_total)) + geom_point()

# ---------------------- 보기힘드니까 x축에 log취하자.
ggplot(data = msleep, aes(x = log(bodywt), y = sleep_total)) + geom_point()
# 잠과 체중은 선형관계가 있어보인다.

# ----------------------
scatterplot = ggplot(data = msleep, 
                     aes(x = log(bodywt), y = sleep_total, col = vore)) + 
  geom_point()
scatterplot   # 이쁘긴한데 보기힘드네.

# ---------------------- 따로따로 봐보자
scatterplot = ggplot(data = msleep, 
                     aes(x = log(bodywt), y = sleep_total, col = vore)) + 
  geom_point() + facet_grid(~vore)
scatterplot 

# ---------------------- #aes는 축을 지정해주는 옵션
ggplot(data = msleep, aes(x = bodywt, y = sleep_total))

# ---------------------- #geom_point에 아무것도 안들어있음.
                         # x, y축은 앞에서 가져옴.
ggplot(data = msleep, aes(x = bodywt, y = sleep_total)) + geom_point()

# ----------------------
ggplot(data = msleep, aes(x = log(bodywt), y = sleep_total)) + geom_point()

# ---------------------- gglplot을 저장하고 색깔을 지정해주자.
                        # col = vore -> 벡터임
scatterplot = ggplot(data = msleep, 
                     aes(x = log(bodywt), y = sleep_total, col = vore)) + 
  geom_point()
scatterplot

# ---------------------- # facet_grid 이용하여 각각나눔.
scatterplot1 = ggplot(data = msleep, 
                      aes(x = log(bodywt), y = sleep_total, col = vore)) + 
  geom_point() + facet_grid(~vore.)  # vore 값에따라 생성하겠다.
scatterplot

# ----------------------Scatterplot <- scatterplot + geom_point(size = 5) + 

scatterplot1 <- scatterplot + geom_point(size = 5) +
xlab('Log Body Weight') +  ylab("Total Hours Sleep") + 
  ggtitle('Some Sleep Data')
scatterplot1

# ---------------------- # 데이터 비교가 잘 안된다 힝
stripchart <- ggplot(msleep, aes(x = vore, y = sleep_total)) + geom_point()
stripchart

# ---------------------- #geom_jitter를 사용하자
stripchart <- ggplot(msleep, aes(x = vore, y = sleep_total, col = vore)) + 
  geom_jitter(position =  position_jitter(width = 0.2), size = 5, alpha = 0.5)
stripchart                                # 0.2 만큼 흔들어라 # 크기, # 투명도0.5


# --- 그려보기
dane <- data.frame(mylevels=c(1,2,5,9), myvalues=c(2, 5, 3, 4))
head(dane)
ggplot(dane, aes(x=factor(mylevels), y=myvalues)) + geom_line(group = 1) + 
geom_point(size=3)

# ----------------------
data(economics)
data(presidential)

# ----------------------
ggplot(economics, aes(date, unemploy)) + geom_line()
 
# ----------------------
presidential = subset(presidential, start > economics$date[1])

ggplot(economics) + geom_rect(aes(xmin = start,xmax = end, fill = party), 
                              ymin = -Inf, ymax = Inf, data = presidential) +
  geom_line(aes(date, unemploy), data = economics)

# ----------------------
if(!require(datasets)){install.packages("datasets"); library(datasets)}
data(airquality)
plot(airquality$Ozone, type = 'l')

# ----------------------
aq_trim <- airquality[which(airquality$Month == 7 |
                              airquality$Month == 8 |
                              airquality$Month == 9), ]
aq_trim$Month <- factor(aq_trim$Month,labels = c("July", "August", "September"))

# ----------------------
ggplot(aq_trim, aes(x = Day, y = Ozone, size = Wind, fill = Temp)) +
  geom_point(shape = 21) +   ggtitle("Air Quality in New York by Day") +
  labs(x = "Day of the month", y = "Ozone (ppb)") +
  scale_x_continuous(breaks = seq(1, 31, 5))

# ----------------------festival.data <- read.table(file = 'DownloadFestival.dat', sep = '\t', header = T)
getwd()
festival.data <- read.table(file = 'DownloadFestival.dat', sep = '\t', header = T)
head(festival.data)

# ---------------------- # x축만 설정해도됨.
Day1Histogram <- ggplot(data = festival.data, aes( x= day1))
Day1Histogram + geom_histogram()

# ----------------------
Day1Histogram + geom_histogram(color = 'royalblue1', fill = 'royalblue2')

# ---------------------- binwidth로 사각형의 크기 설정가능.
Day1Histogram + geom_histogram(color = 'royalblue1', fill = 'royalblue2', 
                               binwidth  = 0.1)

# ---------------------- y축을 상대 빈도로 설정가능하다. # bin은 갯수
Day1Histogram + geom_histogram(binwidth = 0.2, aes( y = ..density..), 
                               color= 'royalblue3', fill = 'yellow', bins = 35) 

# ----------------------
Day1Histogram +geom_histogram(binwidth = 0.1, aes(y=..density..), 
                              color="black",                    # alpha: 투명도 fill:핑크
                              fill="lightblue") + geom_density(alpha=.2, fill="#FF6666") 

# ---------------------- 날짜별 성별 Festival 만족도 조사해보자. 
                         # 그러긴 위해서는 Long format 사용해야해서 melt 함수사용
festival.data.stack <- melt(festival.data, id = c('ticknumb', 'gender'))
colnames(festival.data.stack)[3:4] <- c('day', 'score')


# ----------------------
Histogram.3day2 <- ggplot( data = festival.data.stack, aes(x = score)) + 
  geom_histogram(binwidth = 0.4, color= 'black', fill = 'yellow') + 
  labs( x = 'Score', y = 'Counts')
Histogram.3day2

# ----------------------
Histogram.3day2 + facet_grid(~gender) # 젠더 나눠서 그릴수 있다.

# ----------------------
Histogram.3day2 + facet_grid(gender~day) # 그래프의 문제: 데이터가 빈도로 되어있기 때ㅜㅁㄴ에
                                        # 비교가 힘들다.

# ----------------------
Histogram.3day2 <- ggplot( data = festival.data.stack, aes(x = score,
                                                           y = ..density..)) + 
  geom_histogram(binwidth = 0.4, color= 'black', fill = 'yellow') + 
  labs( x = 'Score', y = 'relative freq')
Histogram.3day2

# ----------------------
Histogram.3day2 + facet_grid(~gender) # female 넓게준다.

# ----------------------
Histogram.3day2 + facet_grid(gender~day)   # 완전 달라졌다.
                                          # Female day1는 정규분포 형태 
                                          # day2는 skew 되어있다.

# ---------------------- scatter plot 사용하는데 jitter를 이용했다.
                        # 그래도 별로인거같아서 box plot이용
Scatterplot <- ggplot(data = festival.data.stack, aes(x = gender, y = score, color = gender)) + 
  geom_point(position = 'jitter') + facet_grid(~day)
Scatterplot   

# ----------------------
Scatterplot + scale_color_manual(values = c('darkorange', 'darkorchid4'))

# ---------------------- # 여성이 조금더 잘 주는거같긴한데
                        # 날짜기 지나면 지날수록 산포가 커진다.
Scatterplot + geom_boxplot(alpha = 0.1, color= 'black', fill = 'orange')




