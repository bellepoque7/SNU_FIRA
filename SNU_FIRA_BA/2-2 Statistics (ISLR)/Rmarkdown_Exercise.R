
library(ISLR)
library(ggplot2)
attach(Auto)
lm.fit <- lm(mpg~horsepower)
summary(lm.fit)
print(summary(lm.fit))

ggplot(Auto,mapping = aes(y= mpg, x=horsepower)) + 
  geom_point() +
  geom_smooth(method ='lm', se = F, color = 'red')+
  theme(plot.title = element_text(hjust = 0.5)) +
  labs(
    title = 'Linear Regression & plot on mpg versus horse'
  )
