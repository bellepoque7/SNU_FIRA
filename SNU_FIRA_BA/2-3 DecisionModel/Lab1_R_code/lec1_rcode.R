#####################################################################################
#                             R Language Essentials                                 #
#                                   2018.08.07                                      #
#                   Instructor : Sungkyu Jung, TA : Boyoung Kim                     #
#                                                                                   #
#####################################################################################




#----- Sec 1: R Basics -------------------------------------------------------------#

#--- 1. R Basic Operations

#R commands are entered at the prompt in the R console window.
a <- 2
a
x <- c(1 ,2 ,3)
x
a+2
xsq = x^2
xsq
rnorm (15)


#Examples of elementary functions
sum(x)
length(x)
mean(x)
sd(x)
plot(x)

#An Exercise(p.7) : Compute the mean and standard deviation of data weight, BMI = weight=(height)2.


#--- 2. Data Types

#Numeric data: 1, 2, 3
x <- c(1, 2, 3); x
is.numeric (x)
as.character(x)

#Character data: "a", "b", "c"
x <- c("1", "2", "3"); x
is.character (x)
as.numeric (x)

#Complex data
c(1, "b", 3)

#Logical data
x <- 1:10 < 5
x
!x
which(x) # Returns index for the 'TRUE ' values in logical vector


#--- 3. Creating Vectors, Matrixes, Factors, Lists, Dataframes

#Vectors(1D)
x <- c( red =" Huey ", blue =" Dewey ", green =" Louie ")
x
names(x)
x[1] <- "Hey"; x
y <- 1:10; names (y) <- letters [1:10]
y[c("b", "d", "f")]

#Matrices (2D): two dimensional structures with data of same type
x <- 1:12
dim (x) <- c (3 ,4); x
x <- matrix (1:12 , nrow = 3, byrow = T)
rownames (x) <- month.abb [1:3] ; x

cbind (A=1:4 ,B=5:8 ,C =9:12)
x <- rbind (A=1:4 ,B=5:8 ,C =9:12); x
t(x)

# Factors (1D) : Categorical variables should be specified as factors in R.
pain <- c(0 ,3 ,2 ,2 ,1)
as.factor(pain)
fpain <- factor(pain, levels=0:3)
levels(fpain) <- c("none", "mild", "medium", "severe")
as.numeric ( fpain )
levels(fpain)
#If the variable is ordinal, use ordered.


#List: to combine a collection of objects into a larger composite object

intake.pre <- c (5260 ,5470 ,5640 ,6180 ,6390 , 6515 ,6805 ,7515 ,7515 ,8230 ,8770)
intake.post <- c (3910 ,4220 ,3885 ,5160 ,5645 ,4680 ,5265 ,5975 ,6790 ,6900 ,7335)
mylist <- list( before = intake.pre , after = intake.post )
mylist$new <- as.matrix (c("n"))
mylist

#Many of R's built-in functions compute more than a single vector of values and 
#return their results in the form of a list.


#Data Frames (2D): what other statistical packages call a "data matrix" or a "data set".
d <- data.frame(intake.pre , intake.post )
head(d)
d$intake.pre


#--- 4. Indexing, Missing Values, Sorting

#Subsetting by indices
intake.pre[5]
intake.pre [c(3 ,5 ,7)]
intake.pre [-c(3 ,5 ,7)]
x <- matrix (1:12 , nrow = 3, byrow = T)
x[1:2,]

#Subsetting by logical selection
intake.post[intake.pre > 7000]
x[,(1:4)==(1:4)^2]


# missing values are denoted by a special NA value.
x <- 1:10
x [2] <- NA
is.na(x)
x>0

x <- c( red =" Huey ", blue =" Dewey ", green =" Louie ")
x[4] <- NA
x

# The function sort returns a vector in ascending or descending order
sort(10:1)

# The function order returns a sorting index for sorting an object
sortindex <- order(iris[,1] , decreasing = FALSE ) # iris : a data set preloaded for any R system.
sortindex [1:12]
iris[sortindex,][1:3 ,]






#----- Sec 2: R environment  -------------------------------------------------------#

#--- 1. Getting Around

#List objects in current R session
ls ()
#Delete some of the objects
rm( intake.post , intake.pre )
rm( list =ls ())
#Return content of current working directory
dir()
#Return path of current working directory
getwd()
#Change current working directory
setwd ("/home/user") #ALWAYS USE FORWARD SLASHES (/).



#--- 2. R script

#It is better to work with R scripts, collections of lines of R
#code stored either in a file or in computer memory somehow.

# Execute an R script from within R
source("my_script.R")

# Execute an R script interactively
# Mac: cmd + enter, Windows: F5
# R studio : ctrl + F5



#--- 3. Packages

#Installation of CRAN Packages
install.packages(c("ISwR", "pkg2"))

# Load a library
library(ISwR)

# Lists all functions and datasets defined by a library
library(help="ISwR")


#--- 4. Getting Help
help(aggregate)
?aggregate
??aggregate


#--- 5. Built-in Data, Data Inspection, Data Manipulations

thuesen
data(thuesen)

# Example (p.25) : Load and view first few lines of data frames melanom, iris, 
#                   USArrests, and cabbages from MASS package.

# Data Inspection
head ( thuesen )
nrow ( thuesen )
ncol ( thuesen )
dim ( thuesen )
str ( thuesen )
summary ( thuesen )


# attach and detach
plot ( thuesen$blood.glucose , thuesen$short.velocity )
attach ( thuesen ); search ();
plot ( blood.glucose , short.velocity )
detach ( thuesen ); search ();
#search function : Gives a list of attached packages (see library), and R objects, usually data.frames.


# subset, transform, and within
thue2 <- subset ( thuesen , blood.glucose <7)
thue3 <- transform ( thuesen , log.gluc = log( blood.glucose ))
thue4 <- within ( thuesen ,{
  log.gluc <- log(blood.glucose)
  m <- mean(log.gluc)
  centered.log.gluc <- log.gluc - m
  rm(m)
  })



#--- 6. Data Entry: Manual Entry, Reading from and Writing to text files

# Gas miliage of Japanese luxury cars(p. 28)

# Create data frame mileages
y1 = c(22 , 26)
y2 = c(28 , 24, 29)
y3 = c(29 , 32, 28)
y4 = c(23 , 24)
y = c(y1 , y2 , y3 , y4)
Model = c( rep ("A", 2), rep("B", 3), rep ("C", 3), rep ("D", 2))
mileages = data.frame (y, Model )
str ( mileages )
mileages

#Exercise: Change the variable name "y" to "mileage"


# Read from files: read.table, read.csv
setwd ("C:/R")
webhits <- read.table ("webhits.txt", header = TRUE )

#Read p.29 : Arguments of read.table(file,...)


# Write a data fame to a file: write.table and write.csv
write.table (twins , "twins2.txt ")





#----- Sec 3: Probability and Distributions ----------------------------------------#

#--- 1. Prussian horsekick data (p. 32)
k = c(0, 1, 2, 3, 4)
x = c(109 , 65, 22, 3, 1)
p = x / sum (x) # relative frequencies
print (p)
par ( mfrow = c(1 ,2)) #multiple graphs
barplot (x, names = k); pie(x)
r = sum (k * p) # mean
v = sum (x * (k - r)^2) / 199 # variance
f = dpois (k, r) #poisson density, 단위 시간당 죽음이 일어날 횟수에 대한 기대값이 r일때, k번 일어날 확률
print( cbind (k, p, f)) # 사망수, 실제 사망수 비율, 포아송 분포(기대값 0.61일때)로부터의 사망수 확률


#--- 2. Random sampling

#sample function : random sampling from finite population
sample (1:40 ,5)
sample (c("H","T"), 10, replace =T)
sample (c("s", "f"), 10, replace =T, prob =c(0.9 , 0.1))

# Exercises (p. 33)

#--- 3. The built-in distributions in R

#dnorm, pnorm, qnorm, and rnorm
x = seq ( -4 ,4 ,0.1); pp = seq (0 ,1 ,0.001);
par( mfrow = c(2,2))
plot (x, dnorm(x), type = "l")       #Density or point probability
plot (x, pnorm(x), type = "l")       #Cumulated probability, distribution function
plot (pp , qnorm (pp), type = "l")    #Quantiles
plot ( rnorm (200))                   #random numbers

#read about more distributions(p.36)

#Exersises (p.37)





#----- Sec 4: R Graphics -----------------------------------------------------------#

#--- Generic x-y plot


# Example 1: plot, text and abline
par (mfrow = c(1 ,1))
x <- runif(50,0,2); y <- runif(50,0,2) #random sample in uniform(0,2) distribution
plot (x, y, main =" Main title ", sub =" subtitle ",
      xlab ="x- label ", ylab ="y- label ")
abline (a = 0.5 , b = 1) #a: intercept, b : slope
abline (h = 0.5 , col = 'red ')
abline (v = 0.5 , col = " blue ")
text (0.5 ,0.6 , " text at x = 0.5 , y = 0.6 ")


# Example 2: plot, text and lines
head ( USArrests )
attach ( USArrests )
plot ( Murder , Assault , pch = 20, col = " red ") #pch : plotting character
text ( Murder , Assault , rownames ( USArrests ), cex = 0.5) #cex : scaling of text
localregfit <- lowess ( Assault ~ Murder ) 
#lowess returns an object containing components x and y which give the coordinates of the smooth
#추세선 찾는 방법 중 하나.
lines ( localregfit $x, localregfit $y)


# Example 3: Print the rownames instead of symbols
plot ( Murder , Assault , type = "n")
text ( Murder , Assault , rownames ( USArrests ), cex = 0.5)


# Example 4: Scatterplot matrix for multi-variate data frame
plot( USArrests ) #or
pairs( USArrests )


#Read Remarks (p.43,44) and Important high-level plotting functions(p.45)





#----- Sec 5: R Programming Basics -------------------------------------------------#

#--- 1. Flow Control

#Conditional Executions: if statement

if(1==0){
  print(1)
}else{
  print(2)
}

# Conditional Executions: ifelse statement operates on vectors
x <- 1:10
ifelse (x <5, x, 0)

# for Loops : Loops over a fixed set of values
x <- seq (0, 1 ,.05)
plot (x, x, ylab ="y", type ="l")
for ( j in 2:8 ) lines (x, x^j)

# while Loops: Iterates as long as a condition is true
z <- 0
while(z <5){
  z <- z + 2
  print (z)
}

# while Loop with break statement
z <- 0
while(T) {
  z <- z+ 1
  print(z)
  if(z>2) break
}



#--- 2. The apply function family (p. 52)
#: apply a function to each element of a set of values or vectors and collect the results in a single structure.


apply ( USArrests , 2, mean )

#lapply : returns a list
#sapply : tries to simplify the result to a vector or a matrix if possible.

#library(ISwR)
lapply(thuesen, mean, na.rm=T)
sapply ( thuesen , mean , na.rm=T)

#tapply : factor에 따라 첫번째 인자의 function값을 출력 
#median of energy expenditure for each level (lean, obese)
data ( energy )
tapply ( energy $ expend , energy $ stature , median ) 



#--- 3. Your Own R functions (p. 55)

# most of the R software can be viewed as a series of R functions.
# easily write custom functions

# R function example 1
myfn <- function (x1 , x2 =5) {
  z1 <- x1 / x1
  z2 <- x2 * x2
  myvec <- c(z1 , z2)
  return ( myvec )
}
myfn(x1=2, x2=3)
myfn(2,3)
x <- myfn(5); x

# R function example 2
hist.with.normal <- function (x, xlab = deparse (substitute(x)) ,...){
    h <- hist (x, plot =F, ...)
    s <- sd(x)
    m <- mean (x)
    ylim <- range (0,h$ density , dnorm (0, sd=s)) #min, max value
    hist (x, freq =F, ylim =ylim , xlab =xlab , ...)
    curve ( dnorm (x,m,s), add =T)
}

hist.with.normal(USArrests$Murder)


# R function exercises (p. 58)