#----
#chicago

install.packages('gamair')
library(gamair)

data(chicago)
head(chicago)
str(chicago)

plot(death ~tmpd, data = chicago,
     xlab = 'Temperatrue(Farenheit)',
     ylab = 'Mortality(deaths/day)',
     main = 'Plot of the data with the estimated liner model')

death.temp.lm <- lm(death ~ tmpd, data = chicago)
abline(death.temp.lm, col = 'blue')
