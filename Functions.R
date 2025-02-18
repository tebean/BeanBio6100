# Working with fnctions and creating user-defined functions
# 11 February 2025
# TEB

sum(3,2) # a "prefix" function
3 + 2 # an "operator", but it is actually a function
`+`(3,2)

y <-3
print(y)
`<-`(yy,3)
print(yy)

sd #shows the code
sd(c(3,2)) #call the function with parameters
sd() #call function with default values for parameters

functionName <- function(parX=defaultX, parY=defailtY,parZ=defaultZ) {
# curly bracket open marks the start of the function body
  #body of the function goes here

  #lines of function goes here
  #lines of R code and annotations
  #may also call the cnction'#may also create functions
  #may also create local variable

  return(z)
} #curly bracket ends

functionNames()
#calls the function with user specified values for each parameter
FunctionName(parX=myMatrix,parY="Order", parZ=c(0.3,1.6,2,6))


###################################################################
#FUNCTION: HardyWeinberg
#input: an allele frequency p(0,1)
#output: p and the frequencies of the 3 genotypes AA, AB, BB
#------------------------------------------------------------------
HardyWeinberg <- function(p=runif(1)) {
    q <- 1-p
    fAA <- p^2
    fAB <- 2*p*q
    fBB <- q^2
    vecOut <- signif(c(p=p,AA=fAA,AB=fAB,BB=fBB),digits=3)

    return(vecOut)
}
HardyWeinberg()

HardyWeinberg2<- function(p=runif1) {
  if (p >1.0 | p< 0.0){
    return("Function failure: p must be >= 0.0 and <= .0")
  }
  q <- 1-p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2
  vecOut <- signigicant(c(p=p,AA=fAA,AB=fAB,BB=fBB), digits=3
                        return(vecOut)
##################################################################

HardyWeinberg3()
HardyWeinberg3<- function(p=runif1) {
  if (p >1.0 | p< 0.0){
    stop("Function failure: p must be >= 0.0 and <= .0")
  }
  q <- 1-p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2
  vecOut <- signigicant(c(p=p,AA=fAA,AB=fAB,BB=fBB), digits=3
                        return(vecOut)
HardyWeinberg3()
z <_ HardyWeinberg3(1.1)

my_function <- function(a=3,b=4) {
  z <- a + b
  return(z)
}
my_func()

my_func_bad <- function(a=3) {
  z <- a + b
  return(z)
}
my_func_bad() # crashes because it can't find b

b <- 100

my_func_bad() #Okay now because b exists as a global variable

my_func_ok <- function(a=3)
  bb <- 100
  z <- a + bb
  return(z)
}
my_func)ok() # no problem now
  print(bb) #but this variable is still hidden from the global environment
  print(a)
  print(z)

fit_linear <- function(x=runif(20), y=runif(20)) {
  my_mod <- lm(y~x) #fit the model
  my_out <- c(slope=summary(my_mod)$coefficients[2,1],
              p_value=summary(my_mod)$coefficients[2,4])
  plot(x=x, y=y) #quick and dirty ploit to check output
  return(my_out)
}
fit_linear()

fit_linear2 <- function(p=NULL) {
  if(is.null(p)) {
    p <- list(x=runif(20),y=runif(20))
  }
  my_mod <- lm(p$y~p$x) #fit the model
  my_out <- c(slope=summary(my_mod)$coefficients[2,1],
              p_value=summary(my_mod)$coefficients[2,4])
  plot(x=p$x, y=p$y) #quick and dirty ploit to check output
  return(my_out)
}
fit_linear()


fit_linear2()
my_pars <- list(x=1:10,y=sort(runif(10)))
fit_linear2(p=my_pars)

z <- c(runif(99),NA)
mean(z) #oops. mean doesn't work if there is an NA
mean(x=z,na.rm=TRUE)# change the default value for na.rm
mean(x=z,na.rm+TRUE,trim=0.05)#check out the "trim" option in help
l <- list(x=z,na.rm=TRUE,trim=0.05) #bundle parameters as a list
l <- list(x=z,na.rm=TRUE,trim=0.05)
do.call(mean,l)#use the do.call function with the function name and the parameter list
