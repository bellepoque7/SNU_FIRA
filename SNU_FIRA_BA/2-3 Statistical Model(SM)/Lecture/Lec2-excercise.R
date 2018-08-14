sim.linmod <- function(n,beta.0, beta.1,width, df){
  x<- runif(n, min=width/2, max = width/2)
  
  epsilon<-rt(n,df=df)
  y <- beta.0 + beta.1*x + epsilon
  return(data.frame(x=x, y=y))
  
}

toy.data <- sim.linmod(n=10, beta.0=5, beta.1 = -2, width = 4, df=3)



