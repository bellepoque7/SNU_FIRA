rm(list = ls()); gc(reset = T)

# -------------------------------------------
if(!require(OpenStreetMap)){install.packages("OpenStreetMap"); library(OpenStreetMap)}
if(!require(ggplot2)){install.packages("ggplot2"); library(ggplot2)}

# -------------------------------------------
map = OpenStreetMap::openmap(upperLeft = c(43, 119), lowerRight = c(33, 134),
                             type = 'bing')
plot(map)

# -------------------------------------------
map = openmap(upperLeft = c(43, 119), lowerRight = c(33, 134),
              type = 'bing')
plot(map)

# -------------------------------------------
par(mfrow = c(1,2))
map = openmap(upperLeft = c(43, 119), lowerRight = c(33, 134),
              type = 'bing')
autoplot(map)

# -------------------------------------------
nm = c("osm", "mapbox", "stamen-toner", 
       "stamen-watercolor", "esri", "esri-topo", 
       "nps", "apple-iphoto", "osm-public-transport")
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
plot(map1) 
abline(h = 38, col = 'blue')

# -------------------------------------------
str(map1)

# -------------------------------------------
map1$tiles[[1]]$projection

# -------------------------------------------
if(!require(sp)){install.packages("sp"); library(sp)}
map_p <- openproj(map1, projection = CRS("+proj=longlat"))
str(map_p)

# -------------------------------------------
plot(map_p)
abline(h = 38, col = 'blue')

# -------------------------------------------
map_p <- openproj(map1, projection = 
                    CRS("+proj=utm +zone=52N + datum=WGS84"))
plot(map_p)
abline(h = 38, col = 'blue')

# -------------------------------------------
a  <-data.frame(lon =  seq(100,140,by = 0.1),
                lat =  38)
sp::coordinates(a) = ~ lon + lat
str(a)

# -------------------------------------------
sp::proj4string(a) = "+proj=longlat"
#a@proj4string  = CRS("+proj=longlat")
str(a)

# -------------------------------------------
a_tf = spTransform(a,  CRS("+proj=utm +zone=52N + datum=WGS84"))
str(a_tf)

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
if(!require(mapplots)){install.packages("mapplots"); library(mapplots)}
if(!require(OpenStreetMap)){install.packages("OpenStreetMap"); library(OpenStreetMap)}

map = openmap( upperLeft = c(43, 119), lowerRight = c(33, 134),type = 'bing') # upperLeft lowerRight option
seoul_loc = geocode('Seoul')
coordinates(seoul_loc) = ~lon + lat
proj4string(seoul_loc) <- "+proj=longlat +datum=WGS84"
seoul_loc_Tf <- spTransform(seoul_loc, CRS(as.character(map$tiles[[1]]$projection)))
plot(map)
add.pie(z=1:2,labels = c('a','b'), x = seoul_loc_Tf@coords[1], y = seoul_loc_Tf@coords[2], radius = 100000)

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
                          29.73631 <= lat & lat <=  29.78400)

# -------------------------------------------
HoustonMap = qmap("houston", zoom = 14,
                  color = "bw", legend = "topleft")
HoustonMap + geom_point(aes(x = lon, y = lat,
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
HoustonMap +
  geom_point(aes(x = lon, y = lat,
                 colour = offense, size = offense),
             data = violent_crimes) +
  geom_density2d(aes(x = lon, y = lat), size = 0.2 , bins = 4, 
                 data = violent_crimes) +
  stat_density2d(aes(x = lon, y = lat,
                     fill = ..level..,  alpha = ..level..),
                 size = 2 , bins = 4,
                 data = violent_crimes,geom = "polygon")

# -------------------------------------------
setwd("C:/Users/hgkang/Desktop/SKT교육/수정/L12-ggmap")
load('airport.Rdata')
head(airport_krjp)

# -------------------------------------------
head(link_krjp)

# -------------------------------------------
map = ggmap(get_googlemap(center = c(lon=134, lat=36),
                          zoom = 5, maptype='roadmap', color='bw'))
map + geom_line(data=link_krjp,aes(x=lon,y=lat,group=group), 
                col='grey10',alpha=0.05) + 
  geom_point(data=airport_krjp[complete.cases(airport_krjp),],
             aes(x=lon,y=lat, size=Freq), colour='black',alpha=0.5) + 
  scale_size(range=c(0,15))


# -------------------------------------------
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
skorea <- raster::getData(name ="GADM", country= "KOR", level=2)
# skorea <- readRDS("KOR_adm2.rds")
head(skorea,2)

# -------------------------------------------
class(skorea)
head(skorea@polygons[[1]]@Polygons[[1]]@coords, 3)

# -------------------------------------------
if (!require(broom)) {install.packages('broom'); library(broom)}

skorea <- broom::tidy(skorea)
class(skorea)
head(skorea,3)

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
seoul032823.grid <- expand.grid(
  LON = seq(from = LON.range[1], to = LON.range[2], by = 0.01),
  LAT = seq(from = LAT.range[1], to = LAT.range[2], by = 0.01))
# -------------------------------------------
plot(seoul032823.grid)
points(seoul032823, pch= 16,col="red")

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


