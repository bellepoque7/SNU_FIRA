#####################################################################################
#                   Data Wrangling to explore baseball database                     #
#                                   2018.08.14                                      #
#                   Instructor : Sungkyu Jung, TA : Boyoung Kim                     #
#                                                                                   #
#####################################################################################



#install.packages("Lahman")
library(Lahman)
library(dplyr)

#help("Lahman-package") #check the Sean Lahman’s Baseball Database

# Manny Ramirez in the Batting table
manny <- filter(Batting, playerID == "ramirma02")

# Manny's total career
manny %>% summarise(
  span = paste(min(yearID), max(yearID), sep = "-"),
  numYears = n_distinct(yearID), numTeams = n_distinct(teamID),      # n_distinct: 1개로 인식
  BA = sum(H)/sum(AB), tH = sum(H), tHR = sum(HR), tRBI = sum(RBI)
)

# This player ID is known as a key in the Master table
Master %>% 
  filter(nameLast  == "Ramirez" & nameFirst == "Manny") 

# His carrer, age in each year
Batting   %>%
  filter(playerID  == "ramirma02") %>%
  inner_join(Master, by = c("playerID"  = "playerID"))  %>% # by 기준(playerID)으로만 table합쳐준다.batting과 mater
  group_by(yearID) %>%
  summarise(
    Age = max(yearID - birthYear), numTeams = n_distinct(teamID),
    BA = sum(H)/sum(AB), tH = sum(H), tHR = sum(HR), tRBI = sum(RBI)
  )   %>%
  arrange(yearID) 

# Which season was Ramirez’s best as a hitter? 
mannyBySeason <- Batting %>%
  filter(playerID == "ramirma02") %>%
  inner_join(Master, by = c("playerID"  = "playerID")) %>%
  group_by(yearID) %>%
  summarise(
    Age = max(yearID - birthYear), numTeams = n_distinct(teamID),
    BA = sum(H)/sum(AB), tH = sum(H), tHR = sum(HR), tRBI = sum(RBI),
    OBP = sum(H + BB + HBP) / sum(AB + BB + SF + HBP),
    SLG = sum(H + X2B + 2*X3B + 3*HR) / sum(AB)
  ) %>%
  mutate(OPS   = OBP + SLG) %>%
  arrange(desc(OPS))
mannyBySeason
#OPS으로 Remirez의 성과를보는건 좋은데.. 만약 모든 선수들이 약물파동으로 인해 높은 성과를 냈다면?
# 각 리그마다 OPS를 구해보자.



# leage average OPS in each year
mlb <- Batting %>%
  filter(yearID %in% 1993:2011) %>%
  group_by(yearID) %>%
  summarise(lgOPS =
              sum(H + BB + HBP, na.rm = TRUE) / sum(AB + BB + SF + HBP, na.rm = TRUE)  +
              sum(H + X2B + 2*X3B  + 3*HR,  na.rm = TRUE)  / sum(AB,  na.rm = TRUE))

# match the league average OPS values to the corresponding entries for Ramirez
mannyRatio <- mannyBySeason %>%
  inner_join(mlb, by = c("yearID" = "yearID")) %>%
  mutate(OPSplus = OPS / lgOPS) %>%                # OPSplus: manny가 잘할수록 높게나타날것
  select(yearID, Age, OPS, lgOPS, OPSplus) %>%
  arrange(desc(OPSplus))                            # 내림차순으로 살펴보자
mannyRatio
#결국 2000년도에는 Manny는 잘했다. 잘해따 우쭈


# Ramirez appears in the all-star games for 12 years.
mannyAllstar <- AllstarFull %>% filter(playerID == "ramirma02")
# 올스타에 12번 나갔음을 확


mannyBySeason %>% 
  left_join(mannyAllstar, by = c("yearID" = "yearID")) %>%
  select(yearID, Age, OPS, GP, startingPos)  
# left_join: 왼쪽 변수는 다살리고 오른쪽 table은 맞는것만 끼우기
