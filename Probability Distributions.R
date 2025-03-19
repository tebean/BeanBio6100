# 06 March 2025
# Probaility Distrubutions
# TEB

#Function: my_histo
#Purpose: creates a ggplot histogram
#Requires ggplot2
#Input: numeric vector
#Output: ggplot histogram

library(ggplot2)
my_histo <- function(x=NULL)
  if(is.null(x)) df=data.frame(x=runif(1000)) else df <- data.frame(x=x)
  p1 <- ggplot(data=df) +
    aes(x=x) +
    geom_histogram(color="black", fill="goldenrod")
  print(p1)
}
my_histo()

library(MASS)

#Poisson distribution
#Discrete X >= 0
#Random events with a constant rate lambda
#Observations per time or per unit area
#Parameter lambda > 0

#note: "zero-inflated poisson" has an addiitonal process. Generating zeros (see ifelse())
#note: "zero-censored poisson" occurs when zeroes are not recorded


#"d" function generates probability density
hits <- 0:10
myVec <- dpois(x=hits, lambda=1)
my_histo(myVec)
plot(myVec,type="b")

hits <- 0:30
myVec <- dpois(x=hits, lambda=20)
plot(myVec,type="b")


sum(myVec)
head(myVec)

# We could
## missing notes bc i was bad girl and not paying attention :(

#The q functio is the inverse of p
#What is the number of hits corresponding to 50% of rhw probability of mass

qpois(p=0.5, lambda=2.5)
ppois(q=2, lambda=2.5)

ranPois <- rpois(n=1000, lambda=2.5)
my_histo(ranPois)

#for real or simulated data, we can use the quantile function to fund the empirical 95% confidence interval on the other side

quantile(x=ranPois,probs=c(0.025, 0.975))


#Bimodal distribution
# p= probability of a dichotomous outcome
#size= number of trials
#x= possible outcomes
#outcome x is bounded between 0 and number of trials
#use "d" binom for density function

hits <- 0:10
myVec <- dbinom(x=hits,size=10,prob=0.5)
plot(myVec,type="b")


myCoins <- rbinom(n=50,size=100,prob=0.5)
plot(myCoins,type="b")
my_histo(myCoins)

quantile(x=myCoins,probs=c(0.025,0.975))

#negative binomial: number of failures (values of MyVec)
# in a series of (Bernouli) with p=probability of success
#before a target number of successes (=size)
#generates a discrete distribution that is more heterogeneous ("overdispersed") than Poisson

hits <-0:40
myVec <- dnbinom(x=hits, size=5, prob=0.5)
my_histo(myVec)
print(myVec)
plot(myVec)


#geometric series is a special case where N=1 success each bar is a constrant fraction 1= "prob" of the bar before it
myVec <-dnbinom(x=hits, size=1, prob=0.1)
plot(myVec, type= "b")
