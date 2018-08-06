counts = table(state.region)
counts/sum(counts)
barplot(counts/sum(counts), main = "simple bar chart",  # 상대빈도로 변경
        xlab = "region", ylab = "freq")                 


head(mtcars)             #mtcars를 불러오기
table(mtcars$cyl)

freq.cyl = table(mtcars$cyl)
freq.cyl/sum(freq.cyl)
barplot(freq.cyl/sum(freq.cyl), main = 'simple bar chart', col ='orange')

cyl.name =  c("4 cyl", "6 cyl", "8 cyl") # 이름 바꾸기/
rel.cyl = freq.cyl/sum(freq.cyl)
round(rel.cyl,3)
barplot(freq.cyl, main = "simple bar chart", col ="orange",
        names.arg = cyl.name)

if ((sum(rel.cyl)-1)! = 0)            # 이거 뭐하는 거지ㅏ?
{
  d = sum(rel.cyl) -1
rel.cyl[which.max(rel.cyl)] = 
rel.cyl[which.max(rel.cyl)] - d

cyl.name = names(freq.cyl)
cyl.name2 = paste0( cyl.name, "(", freq.cyl, "%)")
pie(freq.cyl, labels = cyl.name2,     # labe 리믕여ㅝㄴ
    col = rainbow(length(freq.cyl)), main = "pie chart")
}

cyl.name


#Frequency of mutivariate variables

if(!require(vcd)){install.packages("vcd"); library(vcd)}
head(Arthritis, n = 3)

my.table <- xtabs( ~ Treatment + Improved, data = Arthritis)
my.table

barplot( my.table,
         xlab = "Improved", ylab = "Frequency", legend.text = TRUE,
         col = c("green", "red"))


# x,y 축 변경
barplot( t(my.table),
         xlab = "Improved", ylab = "Frequency", legend.text = TRUE,
         col = c("green", "red", "orange"))

# y축을 상대도수로 변경해보자 / 잘모르겠다.
t(my.table)

cbind(my.table[,1]/43,
my.table[,2]/41)

a < - colSums(my.table)  # 에러나네.
for (i in 1:length(a))
{
  my.table[i] = my.table[,i]/a[i]
}
my.table/rep(a, each =3)   # 첫번째 열은 1로 나누고 두번째 열은 2로 나눔.
sweep(my.table, 2,a, FUN = '/')  # 스윕은 나중에 배울함수.


#부모님의 안전벨트 착용 유무
tmp = c("buckled", "unbuckled")
belt <- matrix( c(58, 2, 8, 16), ncol = 2, 
                dimnames = list(parent = tmp, child = tmp))
belt

spine(belt, main="spine plot for child seat-belt usage",
      gp = gpar(fill = c("green", "red")))


# countinous variables and visualization

x = rnorm(100)                                  #boxplot
boxplot(x, main = "boxplot", col ='lightblue')


# histogram
x = faithful$waiting
hist(faithful$waiting, nclass =8)
boxplot(x, main = "boxplot", col ='lightblue')  #boxplot보면 봉우리2개인것 
#알수가 없다.

x = faithful$waiting
hist(faithful$waiting, breaks = seq(min(x), max(x), length = 10),
     probability = T)

x = faithful$waiting
hist(faithful$waiting, nclass = 10, probability = T)
fit = density(x)
lines(x = fit$x,               #x, y 추가
      y = fit$y,
      col = "red", lwd = 2)
y = density(x)
str(y)
y$y #y에 y이름을 가진 것이 높이??


if(!require(vioplot)){install.packages("vioplot"); library(vioplot)}

x = rpois(1000, lambda = 3)
vioplot(x, col = "lightblue")