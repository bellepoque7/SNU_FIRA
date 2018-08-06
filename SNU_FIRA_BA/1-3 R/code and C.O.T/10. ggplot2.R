rm(list = ls()); gc(reset = T)

# ----------------------
if(!require(ggplot2)){install.packages("ggplot2"); library(ggplot2)}
if(!require(reshape2)){install.packages("reshape2"); library(reshape2)}
if(!require(dplyr)){install.packages("dplyr"); library(dplyr)}

# ----------------------
head(msleep[,c(3, 6 ,11)])

# ----------------------
ggplot(data = msleep, aes(x = bodywt, y = sleep_total)) + geom_point()

# ----------------------
ggplot(data = msleep, aes(x = log(bodywt), y = sleep_total)) + geom_point()

# ----------------------
scatterplot = ggplot(data = msleep, 
                     aes(x = log(bodywt), y = sleep_total, col = vore)) + 
  geom_point()
scatterplot

# ----------------------
scatterplot = ggplot(data = msleep, 
                     aes(x = log(bodywt), y = sleep_total, col = vore)) + 
  geom_point() + facet_grid(~vore)
scatterplot

# ----------------------
ggplot(data = msleep, aes(x = bodywt, y = sleep_total))

# ----------------------
ggplot(data = msleep, aes(x = bodywt, y = sleep_total)) + geom_point()

# ----------------------
ggplot(data = msleep, aes(x = log(bodywt), y = sleep_total)) + geom_point()

# ----------------------
scatterplot = ggplot(data = msleep, 
                     aes(x = log(bodywt), y = sleep_total, col = vore)) + 
  geom_point()
scatterplot

# ----------------------
scatterplot1 = ggplot(data = msleep, 
                      aes(x = log(bodywt), y = sleep_total, col = vore)) + 
  geom_point() + facet_grid(~vore)
scatterplot1

# ----------------------Scatterplot <- scatterplot + geom_point(size = 5) + 
xlab('Log Body Weight') +  ylab("Total Hours Sleep") + 
  ggtitle('Some Sleep Data')
Scatterplot

# ----------------------
stripchart <- ggplot(msleep, aes(x = vore, y = sleep_total)) + geom_point()
stripchart

# ----------------------
stripchart <- ggplot(msleep, aes(x = vore, y = sleep_total, col = vore)) + 
  geom_jitter(position =  position_jitter(width = 0.2), size = 5, alpha = 0.5)
stripchart

# ----------------------
stripchart <- ggplot(msleep, aes(x = vore, y = sleep_total)) + geom_point()
stripchart

# ----------------------
stripchart <- ggplot(msleep, aes(x = vore, y = sleep_total, col = vore)) + 
  geom_jitter(position =  position_jitter(width = 0.2), size = 5, alpha = 0.5)
stripchart

# ----------------------
dane <- data.frame(mylevels=c(1,2,5,9), myvalues=c(2, 5, 3, 4))
head(dane)

# ----------------------
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
festival.data <- read.table(file = 'DownloadFestival.dat', sep = '\t', header = T)
head(festival.data)

# ----------------------
Day1Histogram <- ggplot(data = festival.data, aes( x= day1))
Day1Histogram + geom_histogram()

# ----------------------
Day1Histogram + geom_histogram(color = 'royalblue1', fill = 'royalblue2')

# ----------------------
Day1Histogram + geom_histogram(color = 'royalblue1', fill = 'royalblue2', 
                               binwidth  = 0.1)

# ----------------------
Day1Histogram + geom_histogram(binwidth = 0.2, aes( y = ..density..), 
                               color= 'royalblue3', fill = 'yellow', bins = 35) 

# ----------------------
Day1Histogram +geom_histogram(binwidth = 0.1, aes(y=..density..), 
                              color="black", 
                              fill="lightblue") + geom_density(alpha=.2, fill="#FF6666") 

# ----------------------
festival.data.stack <- melt(festival.data, id = c('ticknumb', 'gender'))
colnames(festival.data.stack)[3:4] <- c('day', 'score')

# ----------------------
Histogram.3day2 <- ggplot( data = festival.data.stack, aes(x = score)) + 
  geom_histogram(binwidth = 0.4, color= 'black', fill = 'yellow') + 
  labs( x = 'Score', y = 'Counts')
Histogram.3day2

# ----------------------
Histogram.3day2 + facet_grid(~gender)

# ----------------------
Histogram.3day2 + facet_grid(gender~day)

# ----------------------
Histogram.3day2 <- ggplot( data = festival.data.stack, aes(x = score,
                                                           y = ..density..)) + 
  geom_histogram(binwidth = 0.4, color= 'black', fill = 'yellow') + 
  labs( x = 'Score', y = 'Counts')
Histogram.3day2

# ----------------------
Histogram.3day2 + facet_grid(~gender)

# ----------------------
Histogram.3day2 + facet_grid(gender~day)

# ----------------------
Scatterplot <- ggplot(data = festival.data.stack, aes(x = gender, y = score, color = gender)) + 
  geom_point(position = 'jitter') + facet_grid(~day)
Scatterplot

# ----------------------
Scatterplot + scale_color_manual(values = c('darkorange', 'darkorchid4'))

# ----------------------
Scatterplot + geom_boxplot(alpha = 0.1, color= 'black', fill = 'orange')




