rm(list = ls()); gc(reset = T)

# -------------------------------------------
if(!require(OpenStreetMap)){install.packages("OpenStreetMap"); library(OpenStreetMap)}
if(!require(ggplot2)){install.packages("ggplot2"); library(ggplot2)}

# -------------------------------------------
map = OpenStreetMap::openmap(upperLeft = c(43, 119), lowerRight = c(33, 134),
                             type = 'bing')
autoplot(map) # 좌표계 확인 가능

# -------------------------------------------
nm = c("osm", "mapbox", "stamen-toner", 
       "stamen-watercolor", "esri", "esri-topo", 
       "nps", "apple-iphoto", "osm-public-transport") # 제각기 다른타입의 그림이 그려ㅈ

par(mfrow=c(3,3),  mar=c(0, 0, 0, 0), oma=c(0, 0, 0, 0)) 

for(i in 1:length(nm)){
  map <- openmap(c(43,119),
                 c(33,134),
                 minNumTiles = 3,
                 type = nm[i])
  plot(map, xlab = paste(nm[i]))
}

par(mfrow = c(1, 1))
# -------------------------------------------
map1 <- openmap(c(43.46,119.94),
                c(33.22,133.98))
autoplot(map1) 
abline(h = 38, col = 'blue')  # 수평선그리기.. 근데 안나오네..? 좌표게가 다르기때문이지!!
abline(h= 4500000, lwd = 3, col ='red')

#해결 방법1: 우리가 아는 위경도 좌표계로 가져온다.
#해결 방법2: 우리가 직접 숫자를 맞춰 그린다??

# -------------------------------------------
str(map1) # tiles와 bbox 두가지 정보로 구성되어있다.
          # bbox의 p1, p2는 왼쪽위 오른쪽 아래..?
          # tiles 아래 list 5개 그곳에 color data가 RGB형식으로 있다.
          # bbox,와 projection (정사영) -> 3차원을 어떻게 2차원으로 내렸는가...
          # package 'sp'를 쓰고있고 slot을 가지고있다.Chain 개념
          # 리스트와 비슷하지만 하위개념 참조시 $가 아닌 @를 사용함
          # @ 에는 projection argument
# -------------------------------------------
# projargs 찾아 들어가긔

str(map1$tiles[[1]]$projection)
map1$tiles[[1]]$bbox
map1$tiles[[1]]$projection@projargs # 위경도좌표계가 아닌 Mercator 좌표계임

# -------------------------------------------
# Mercartor -> 위경도로 바꿔야하는데 복잡 그래서 패키지
if(!require(sp)){install.packages("sp"); library(sp)}  # spatial의 약자
map_p <- openproj(map1, projection = CRS("+proj=longlat"))
str(map_p)  # projection 내용이 바뀌었다! bbox의 값도 바뀌었다.

# -------------------------------------------
plot(map_p)
abline(h = 38, col = 'blue')  # 오오 작동한다

# -------------------------------------------
map_p <- openproj(map1, projection = 
                    CRS("+proj=utm +zone=52N + datum=WGS84"))
                       # +의 뜻은 좌표계를 설정해주기위한 옵션 구분자
plot(map_p)
abline(h = 38, col = 'blue')
str(map_p)


# -------------------------------------------
# 점을 만든다음에 이어볼까??
# Coordinator Reference System.
# 1. 좌표계로 변환 -> sp 클래스 변환, projection 설정 -> 좌표계변환 -> 지도위에 맵핑

# -------------------------------------------
a  <-data.frame(lon =  seq(100,140,by = 0.1),
                lat =  38)
sp::coordinates(a) = ~ lon + lat   # sp 라이브러리 안에있는 coordinates
                                   # 숫자를 좌표계로 바꾼다. lon,lat 은 각각 위도 경ㄷ
str(a)                           # dataframe 에서 3슬롯으로 바뀜.
a@coords

sp::proj4string(a) = "+proj=longlat"    # proj4string 에 넣는다.
#a@proj4string  = CRS("+proj=longlat")  같은 표현방법
str(a)

#spatial point만듬: 위경도 좌표계에서 점들을 생성한것임.


# -------------------------------------------
# 좌표계 변환(sp::CRS)
a_tf = spTransform(a,  CRS("+proj=utm +zone=52N + datum=WGS84")) # map을 바꾸는..? 
str(a_tf)     #bbox, coordinate도 바뀜

# -------------------------------------------
plot(map_p)
points(a_tf@coords[,1], a_tf@coords[,2], type = 'l', col = 'blue')

# -------------------------------------------
if(!require(mapplots)){install.packages("mapplots"); library(mapplots)}

map = openmap(upperLeft = c(43, 119),lowerRight = c(33, 134))
seoul_loc = geocode('Seoul')
coordinates(seoul_loc) = ~lon + lat
proj4string(seoul_loc) = "+proj=longlat +datum=WGS84" 
seoul_loc_Tf = spTransform(seoul_loc,
                           CRS(as.character(map$tiles[[1]]$projection)))
plot(map)
add.pie(z=1:2,labels = c('a','b'),
        x = seoul_loc_Tf@coords[1],
        y = seoul_loc_Tf@coords[2], radius = 100000)



# -------------------------------------------
if(!require(ggmap)){install.packages("ggmap"); library(ggmap)}

# -------------------------------------------
data(crime)
head(crime, 2)

# -------------------------------------------
violent_crimes = subset(crime,
                        offense != "auto theft" & 
                          offense != "theft" & 
                          offense != "burglary")
violent_crimes$offense <- factor(violent_crimes$offense,
                                 levels = c("robbery", "aggravated assault", "rape", "murder"))
violent_crimes = subset(violent_crimes,
                        -95.39681 <= lon & lon <= -95.34188 &
                          29.73631 <= lat & lat <=  29.78400) #위치정리.

# -------------------------------------------
HoustonMap = qmap("houston", zoom = 14,
                  color = "bw", legend = "topleft")
HoustonMap + geom_point(aes(x = lon, y = lat,         # layer깔고 올릴수있다. qmap짱짱편함
                            colour = offense, size = offense),
                        data = violent_crimes)

# -------------------------------------------
HoustonMap +
  geom_point(aes(x = lon, y = lat,
                 colour = offense, size = offense),
             data = violent_crimes) +
  geom_density2d(aes(x = lon, y = lat), size = 0.2 , bins = 4, 
                 data = violent_crimes)



# -------------------------------------------
# 밀도가 높은곳과 낮은 곳을 색칠
HoustonMap +
  geom_point(aes(x = lon, y = lat,
                 colour = offense, size = offense),
             data = violent_crimes) +
  geom_density2d(aes(x = lon, y = lat), size = 0.2 , bins = 4, 
                 data = violent_crimes) +
  stat_density2d(aes(x = lon, y = lat,
                     fill = ..level..,  alpha = ..level..), # .. :ggplot에서 만든 내부변수
                 # fill이 뭘뜻할까?
                 size = 2 , bins = 4,
                 data = violent_crimes,geom = "polygon")


# -------------------------------------------
# 서울지역의 미세먼지 데이터 이용해보자

setwd('C:/Users/renz/Documents/GitHub/SNU_BDI_-JJJ-R/Week05~06')

if (!require(sp)) {install.packages('sp'); library(sp)}
if (!require(gstat)) {install.packages('gstat'); library(gstat)}
if (!require(automap)) {install.packages('automap'); library(automap)}
if (!require(rgdal)) {install.packages('rgdal'); library(rgdal)}
if (!require(e1071)) {install.packages('e1071'); library(e1071)}
if (!require(dplyr)) {install.packages('dplyr'); library(dplyr)}
if (!require(lattice)) {install.packages('lattice'); library(lattice)}
if (!require(viridis)) {install.packages('viridis'); library(viridis)}

# -------------------------------------------

seoul032823 <- read.csv ("seoul032823.csv")
head(seoul032823)

# -------------------------------------------
skorea <- raster::getData(name ="GADM", country= "KOR", level=2) #GADM에서 다운받기
# skorea <- readRDS("KOR_adm2.rds")
head(skorea,2)

# -------------------------------------------
class(skorea) # sp 패키지에서 다룰수 있다는걸 알수있다.
head(skorea,2 )
head(skorea@polygons[[1]]@Polygons[[1]]@coords, 3)

 # -------------------------------------------
if (!require(broom)) {install.packages('broom'); library(broom)}

skorea <- broom::tidy(skorea)
class(skorea)
head(skorea,3)  # datafram으로 바ㅜ낌

# -------------------------------------------
ggplot() + geom_map(data= skorea, map= skorea,
                    aes(map_id=id,group=group),fill=NA, colour="black") +
  geom_point(data=seoul032823, aes(LON, LAT, col = PM10),alpha=0.7) +
  labs(title= "PM10 Concentration in Seoul Area at South Korea",
       x="Longitude", y= "Latitude", size="PM10(microgm/m3)")


# -------------------------------------------
class(seoul032823)
coordinates(seoul032823) <- ~LON+LAT
class(seoul032823)

# -------------------------------------------
LON.range <- c(126.5, 127.5)
LAT.range <- c(37, 38)
seoul032823.grid <- expand.grid(  # 격자잡아줌
  LON = seq(from = LON.range[1], to = LON.range[2], by = 0.01),
  LAT = seq(from = LAT.range[1], to = LAT.range[2], by = 0.01))
# -------------------------------------------
plot(seoul032823.grid)
points(seoul032823, pch= 16,col="red")    # 격자를 만들어놓고 점찍기

# -------------------------------------------
coordinates(seoul032823.grid)<- ~LON+LAT ## sp class
gridded(seoul032823.grid)<- T
plot(seoul032823.grid)
points(seoul032823, pch= 16,col="red")

# -------------------------------------------
if(!require(automap)){install.packages("autoKrige"); library(automap)}

seoul032823_OK <- autoKrige(formula = PM10~1,
                            input_data = seoul032823,
                            new_data = seoul032823.grid )

# -------------------------------------------
head(seoul032823_OK$krige_output@coords, 2)
head(seoul032823_OK$krige_output@data$var1.pred,2)

# -------------------------------------------
myPoints <- data.frame(seoul032823)
myKorea <- data.frame(skorea)
myKrige <- data.frame(seoul032823_OK$krige_output@coords, 
                      pred = seoul032823_OK$krige_output@data$var1.pred)   

# -------------------------------------------
if(!require(viridis)){install.packages("viridis"); library(viridis)}

ggplot()+ theme_minimal() +
  geom_tile(data = myKrige, aes(x= LON, y= LAT, fill = pred)) +
  geom_map(data= myKorea, map= myKorea, aes(map_id=id,group=group),
           fill=NA, colour="black") +
  coord_cartesian(xlim= LON.range ,ylim= LAT.range) +
  labs(title= "PM10 Concentration in Seoul Area at South Korea",
       x="Longitude", y= "Latitude")+
  theme(title= element_text(hjust = 0.5,vjust = 1,face= c("bold")))+
  scale_fill_viridis(option="magma")


