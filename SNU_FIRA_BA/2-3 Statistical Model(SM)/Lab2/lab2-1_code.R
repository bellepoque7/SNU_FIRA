#####################################################################################
#                 Visualizing historical baby names via ggplot2                     #
#                                   2018.08.14                                      #
#                   Instructor : Sungkyu Jung, TA : Boyoung Kim                     #
#                                                                                   #
#####################################################################################


#Lab 2-1 
#--- 1. Introduction: Joseph 이름을 가진 사람수의 나이 분ㅍ


#install.packages("mdsr")

library(mdsr)
library(babynames)

BabynamesDist <- make_babynames_dist()
head(BabynamesDist, 2)
#기준 2014년 1월 1일 기준

#n : 출생수
#alive_prob : 2014년까지 생존확률
#count_thousands : 출생수 (단위 : 1000명)
#age_today : 2014년의 나이
#est_alive_today : 2014년에 생존수 추정값  html자료의 파란색.



#--- 2. Re-creating Figure 3.21
joseph <- BabynamesDist %>% filter(name == "Joseph", sex == "M") #해당 조건을 만족하는 자료만 추출.

# initial ggplot2 object
name_plot <- ggplot(data = joseph, aes(x = year)) #aes : 색상, 크기 등 외적 요소, ggplot초기화

# add the bars
name_plot <- name_plot +
  geom_bar(stat = "identity", aes(y = count_thousands * alive_prob),
           fill = "#b2d7e9", colour = "white") #adds bars, geom : 점,선,모양 등 기하학적 요소
             # fill 채우는 색깔 colour:테두리 색깔

# the black line
name_plot <- name_plot + geom_line(aes(y = count_thousands), size = 2)  #add black line

# add the labels
name_plot <- name_plot +
  ylab("Number of People (thousands)") + xlab(NULL) #add labels

# computes the median year
#install.packages("Hmisc")
library(Hmisc) 
median_yob <-
  with(joseph, wtd.quantile(year, est_alive_today, probs = 0.5))
# with는 기본 함수이고 data,expression을받음. wid.qunatile을 계산하는 것
median_yob

# overplot a single bar in a darker shade of blue
name_plot <- name_plot +
  geom_bar(stat = "identity", colour = "white", fill = "#008fd5",
           aes(y = ifelse(year == median_yob, est_alive_today / 1000, 0)))
# ifelse구문에서 median_yob과 같으면 1000으로 나누기 아니면 0으로 냅두기(안그리기)

# contain many contextual elements
name_plot +
  ggtitle("Age Distribution of American Boys Named Joseph") +
  geom_text(x = 1935, y = 40, label = "Number of Josephs\nborn each year") +
  geom_text(x = 1915, y = 13, label =
              "Number of Josephs\nborn each year\nestimated to be alive\non 1/1/2014",
            colour = "#b2d7e9") +
  geom_text(x = 2003, y = 40,
            label = "The median\nliving Joseph\nis 37 years old",
            colour = "darkgray") +
  geom_curve(x = 1995, xend = 1974, y = 40, yend = 24,   # end는 끝나는 점의 좌표
             arrow = arrow(length = unit(0.3,"cm")), curvature = 0.5) + ylim(0, 42)
                        # arrow length 0.3, curvateure: 각도 


#--- 3. Re-using name_plot

# obtain an analogous plot for another name
Josephine <- filter(BabynamesDist, name == "Josephine" & sex == "F")
name_plot %+% Josephine

# compare the gender breakdown for a few of the most common of these
many_names_plot <- name_plot + facet_grid(name ~ sex)
mnp <- many_names_plot %+% filter(BabynamesDist, name %in%
                                    c("Jessie", "Marion", "Jackie"))
mnp
