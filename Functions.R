# Working with fnctions and creating user-defined functions
# 11 February 2025
# TEB

sum(3,2) # a "prefix" function
3 + 2 # an "operator", but it is actually a funciton
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
