# map 그리는 거 어렵다. 왜냐? 잘그릴려고하기때문에.


rm(list = ls()); gc(reset = T)

# -----------------------------
if(!require(maps)){install.packages("maps") ;library(maps)}
if(!require(mapdata)){install.packages("mapdata") ;library(mapdata)}

# ----------------------------- 둘다 경계정보를 가지고 있다.
par(mfrow = c(1,2))
map(database = "usa")    #lines 함수를 이용해서 그리게된것. 점들의 위치로
map(database = "county") ## county map을 이용, 자세한 USA map을 그릴 수 있음

# -----------------------------
map(database = 'world', region = 'South Korea')
# world2Hires에서 보다 높은 자세한 map을 그릴 수 있음
map('world2Hires', 'South Korea')  # 데이터베이스를 바꿔서 좀더 정교하게.
                                   # 여기에 좌표계만 얹어서 더 자세하게 표현 할수
                                   # 도 있을 것.


map("state", "GEORGIA")
map.cities(us.cities, country = "GA")


# -----------------------------
data(us.cities)
head(us.cities)

# ----------------------------- p9  paingting map by statistics
map('world', fill = TRUE, col = rainbow(30))

# -----------------------------
map('world', fill = TRUE, col = rainbow(30))

# -----------------------------
data(unemp) # unemployed rate data
data(county.fips) # county fips data
head(unemp,3)
head(county.fips,3)

# -----------------------------


unemp$colorBuckets <- cut(unemp$unemp, c(0, 2, 4, 6, 8, 10, 100)) # 컷 함수: 벡터레벨 만들기
colorsmatched <- unemp$colorBuckets[match(county.fips$fips, unemp$fips)]

# -----------------------------
colors = c("#F1EEF6","#D4B9DA","#C994C7","#DF65B0","#DD1C77","#980043")   # 파레트 준비
# county의 fips 순서대로 색깔이 칠해진다.


if(!require(mapproj)){install.packages("mapproj") ;library(mapproj)} 
map("county", col = colors[colorsmatched], fill = TRUE,
    resolution = 0, lty = 0, projection = "polyconic")

# -----------------------------
colors = c("#F1EEF6","#D4B9DA","#C994C7","#DF65B0","#DD1C77","#980043")
map("county", col = colors[colorsmatched], fill = TRUE,
    resolution = 0, lty = 0, projection = "polyconic")

# -----------------------------
par(mfrow=c(1,1))

map("county", col = colors[colorsmatched], fill = TRUE,
    resolution = 0, lty = 0, projection = "polyconic")
map("state", col = "white", fill = FALSE, add = TRUE, lty = 1,
    lwd = 0.2,projection = "polyconic")
title("unemployment by county, 2009")

# -----------------------------
colors = c("#F1EEF6","#D4B9DA","#C994C7","#DF65B0","#DD1C77","#980043")
colorsmatched <- unemp$colorBuckets[match(county.fips$fips, unemp$fips)]
map("county", col = colors[colorsmatched], fill = TRUE,
    resolution = 0, lty = 0, projection = "polyconic")
map("state", col = "white", fill = FALSE, add = TRUE, lty = 1,
    lwd = 0.2,projection = "polyconic")
title("unemployment by county, 2009")

# -----------------------------
if(!require(dplyr)){install.packages("dplyr") ;library(dplyr)}
if(!require(ggplot2)){install.packages("ggplot2") ;library(ggplot2)}

wm <- ggplot2::map_data('world')
wm %>% dplyr::select(region) %>% unique()%>%head()
wm[400:500,]                       # 월드맵 400~500 열에서 아프가니스탄 ->다른걸로바뀜
                                  # 지금 월드맵은 같은나라가 다른 색깔로 칠해져있음
                                  # ex)미국의 알래스카 영토
                                  # 이걸 같은 색깔로 바꿔보자. 지역이름기준으로.
                                  # but 그려지는 단위는 나라가아니라 Polygon(다각형)이다.
# -----------------------------
# 세계 중에 한국을 찾아보자.

ur <- wm %>% dplyr::select(region)%>%unique()   
nrow(ur) # 252 개의 나라가 있다.
grep( "Korea", ur$region )   # 어디에 우리나라가있는지 찾자.
ur$region[c(125,185)]

grep( "China", ur$region )
grep( "Japan", ur$region )

# -----------------------------
# 한국지도를 그려보자
map("world", ur$region[c(125,185)],fill = T,
    col = rainbow(4))                          # 같은나라끼리 안칠해진다!!

# 고치기 위해서 한국 찾자
wmr_N <- wm %>% filter(wm$region == 'North Korea')
wmr_S <- wm %>% filter(wm$region == 'South Korea')
unique(wmr_N$group)   # 북한: 1205 ~ 1206
unique(wmr_S$group)   # 남한: 932 ~ 942

# 이거뭐지 위에 숫자를 안쓰고 걍 그렸는데?

map('world', ur$region[c(125,185)], fill =T, col = c(rep('darkblue',11), rep('pink',2)))


# -----------------------------
#파이 차트 맵.(inpired by 사회과부도)

if(!require(mapplots)){install.packages("mapplots") ;library(mapplots)}
if(!require(ggmap)){install.packages("ggmap") ;library(ggmap)}
if(!require(mapdata)){install.packages("mapdata") ;library(mapdata)}

map('worldHires', 'South Korea')
seoul_loc = geocode('seoul')           # 좌표계를 받아오는 함수
busan_loc = geocode('Busan')           # 위도 경도를 가져온다.
add.pie(z=1:2,labels = c('a','b'), 
        x = seoul_loc$lon, y = seoul_loc$lat, radius = 1.0) # radius로 총량 조절가능
add.pie(z=4:3,labels = c('a','b'),
        x = busan_loc$lon, y = busan_loc$lat, radius = 0.7)
abline(h=38, col ='lightblue') # 위도 38도 그을수있다.
