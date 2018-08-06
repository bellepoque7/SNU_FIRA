rm(list = ls()); gc(reset = T)

# -------------------------------------
if(!require(ggplot2)){install.packages("ggplot2"); library(ggplot2)}
if(!require(reshape2)){install.packages("reshape2"); library(reshape2)}
if(!require(dplyr)){install.packages("dplyr"); library(dplyr)}

# -------------------------------------
if(!require(maps)){install.packages("maps"); library(maps)}
load(file="storms.RData")
wm = map_data("world")

# -------------------------------------
str(wm)

# -------------------------------------
substorms = storms %>% filter(Season %in% 1999:2010) %>%
  filter(!is.na(Season)) %>%
  filter(Name!="NOT NAMED")
substorms$ID = as.factor(paste(substorms$Name, 
                               substorms$Season, sep = "."))
substorms$Name = as.factor(substorms$Name)

# -------------------------------------
map1 = ggplot(substorms, 
              aes(x = Longitude, y = Latitude, group = ID)) + 
  geom_polygon(data = wm, 
               aes(x = long, y = lat, group = group), 
               fill = "gray25", colour = "gray10", size = 0.2) + 
  geom_path(data = substorms, 
            aes(group = ID, colour = Wind.WMO.),
            alpha = 0.5, size = 0.8) +
  xlim(-138, -20) + ylim(3, 55) + 
  labs(x = "", y = "", colour = "Wind \n(knots)")

# -------------------------------------
map1

# -------------------------------------
map2 = ggplot(substorms, 
              aes(x = Longitude, y = Latitude, group = ID)) + 
  geom_polygon(data = wm, 
               aes(x = long, y = lat, group = group), 
               fill = "gray25", colour = "gray10", size = 0.2) + 
  geom_path(data = substorms, 
            aes(group = ID, colour = Wind.WMO.), size = 0.5) + 
  xlim(-138, -20) + ylim(3, 55) + 
  labs(x = "", y = "", colour = "Wind \n(knots)") + 
  facet_wrap(~Month) 

# -------------------------------------
map2

# -------------------------------------
par(bg="white")
set.seed(1)
a=seq(1:100) + 0.1*seq(1:100)*sample(c(1:10) , 100 , replace=T)
b=seq(1:100) + 0.2*seq(1:100)*sample(c(1:10) , 100 , replace=T)
size = 3 +(a/30) + rnorm(length(a))
d = (b/300) + rnorm(length(a),0, 0.1)
d[d<0] = 0
rdata<- data.frame(x = a, y = b, size = size, temp = d)
myplot <- ggplot(data = rdata, aes ( x = x, y = y)) + 
  geom_point(aes(x,y, colour = temp), size = size) + 
  scale_color_gradient2(midpoint = 0.5, low="#EF5500", 
                        mid="#FFFF77", high="blue")

# -------------------------------------
par(bg="white")
set.seed(1)
a=seq(1:100) + 0.1*seq(1:100)*sample(c(1:10) , 100 , replace=T)
b=seq(1:100) + 0.2*seq(1:100)*sample(c(1:10) , 100 , replace=T)
size = 3 +(a/30) + rnorm(length(a))
d = (b/300) + rnorm(length(a),0, 0.1)
d[d<0] = 0
rdata<- data.frame(x = a, y = b, size = size, temp = d)
myplot <- ggplot(data = rdata, aes ( x = x, y = y)) + 
  geom_point(aes(x,y, colour = temp), size = size) + 
  scale_color_gradient2(midpoint = 0.5, low="#EF5500", mid="#FFFF77", high="blue")
myplot



