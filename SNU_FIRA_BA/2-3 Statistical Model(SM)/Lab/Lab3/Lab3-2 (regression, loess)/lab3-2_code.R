#####################################################################################
#                         Visualizing regression results                            #
#                                   2018.08.22                                      #
#                   Instructor : Sungkyu Jung, TA : Boyoung Kim                     #
#                                                                                   #
#####################################################################################


library(tidyr)
library(dplyr)
library(ggplot2)

#install.packages("mosaicData")
library(mosaicData)

# RailTrail data
data(RailTrail)
#help(RailTrail)

# hightemp vs. volume
ggplot(RailTrail, aes(hightemp)) +
  geom_point(aes(y = volume))

# A simple linear regression is fitted:
mod1 <- lm(volume ~ hightemp, data = RailTrail)
summary(mod1)



#--- Predictions

# generating an evenly spaced grid of values that covers the region where our data lies
#install.packages("modelr")
library(modelr)
grid <- RailTrail %>% 
  data_grid(hightemp) 
grid 

grid <- grid %>% 
  add_predictions(mod1) 
grid



#--- Visualize predictions
ggplot(RailTrail, aes(hightemp)) +
  geom_point(aes(y = volume)) +
  geom_line(aes(y = pred), data = grid, colour = "red", size = 1)



#--- Visualize residuals
# residuals with the original dataset
RailTrail_r <- RailTrail %>% 
  add_residuals(mod1) %>% dplyr::select(hightemp, volume, resid)
head(RailTrail_r)


ggplot(RailTrail_r, aes(hightemp, resid)) + 
  geom_ref_line(h = 0) +
  geom_point() 



# 참고 : Polynomial regression (2차 다항회귀)
mod2 <- lm(volume ~ hightemp + I(hightemp^2), data=RailTrail)
summary(mod2)

RailTrail_r2 <- RailTrail %>% 
  add_predictions(mod2) %>% 
  add_residuals(mod2) %>% 
  dplyr::select(hightemp, volume, pred, resid)
head(RailTrail_r2)

ggplot(RailTrail_r2, aes(hightemp, volume)) + 
  geom_point() +
  geom_line(aes(y=pred), colour = "red", size=1)

ggplot(RailTrail_r2, aes(hightemp, resid)) + 
  geom_ref_line(h = 0) +
  geom_point()

