# More properties of atomic vectors
# 20 January 2025
#TEB


#create an empty vector, specify mode and length
z <- vector(mode="numeric", length=0)
print(z)

#now add elements to it

z<- c(z,5)
print(z)
#This "dynamic sizing" is very SLOW

#has 100 0s in a numeric vector
z <- rep(0,100)
head(z)
#but would be better to start with NAs
z <- rep(NA,100)
head(z)
#but what is its type?
typeof(z)

#take advantage of coercion
z[1] <- "washington"
head(z)
typeof(z)
typeof(z[2])

my_vector <- runif(100)
tail(my_vector)
my_names <- paste("species", seq(1:length(my_vector)),sep="")
names(my_vector) <- my_names
head(my_vector)
str(my_vector)
#seq is short for sequence- make a sequence starting at number 1 to my vector which is 100

#rep for repeating elements
rep(0.5,6) #give the element (or vector) and number of times to repeat
rep(x=0.5, times=6) #using the argument names is always prudent
rep(times=6, x=0.5) #with argument names, order is not important
my_vector <- c(1,2,3)
rep(x=my_vector,times=2) # repeat each element individually

my_vec <- c(1,2,3)
rep(x=my_vec,times=2) #applies to entire vectors
rep(x=my_vec,each=2) #repeat each element individually
rep(x=my_vec,times=my_vec) #what does this do?
rep(x=my_vec,each=my_vec) #and this?

seq(from=2, to=4) #set lists for integer sequences
2:4 #very common shortcut without explicit function wrappers
seq(from=2, to=4, by=0.5) #use by a function can generate real numbers
x<- seq(from=2, to=4, length=7) #sometimes easier to just specify the length
my_vec <- 1:length(x) #commonly used, but actually snow
print(my_vec)
seq_along(my_vec) #much faster for models and bigger dats
seq_len(5) #this is also faster than 1:5

runif(5) #5 random uniform values between 0 and 1 (if no specified range)
runif(n=3,min=100, max=101) #3 random uniform numbers between 0-101

rnorm(6) #6 random normal values with a mean of 0 and standard deviation of 1
rnorm(n=5,mean=100,sd=30) #5 random normal values with mean

#Explore distributions by sampling and plotting
library(ggplot2) #do this at the very start
z <- runif(1000) #default uniform (0,1)
qplot(x=z)
z <- rnorm(10000) #default normal (0,1)
qplot(x=z)

long_vec <- seq_len(10)
typeof(long_vec)
str(long_vec)

sampe(x=long_vec) #no other params, this reorders the vector
sample(x=long_vec, size=3) #specify a number (sampling without replacement)
sample(x=long_vec, size=16, replacement=TRUE) #can generate duplicates
my_weights <- c(rep(20,5), rep(100,5)) #create a set of non-zero positive weights (integer or real)
print(my_weights)
sample(x=long_vec, replace=TRUE,prob=my_weights) #sampling with replacement and weights
sample(x=long_vec, replace=FALSE,prob=my_weights) #sampling without replacemetn and weights
sample(x=long_vec, replace=FALSE,prob=long_vec)#what does this do??


z <- c(3.1, 9.2, 1.3, 0.4, 7.5)
#positive index values
z[c(2,3)]
#negative index values exclude elements
z[-c(2,3)]

z[z<3]
tester <- z<3
print(tester)
z[tester]
which(z<3)
z[which(z<3)]
z[-(length(z):length(z)-2))]

z[1:5]
#can also sunset using named vector elements
names(z) <- letters[1:5]
z[c("b","c")]
print(z)

#< less than
#> greater than
# <= less than or equal to
# >= greater than or equal to
# == equal to


#logical operators
#! not
#& and (vector)
# | or (vector)
# xor(x,y)

x <- 1:5
y <- c(1:3,7,7)
x==2 #x is 2
x !=2 #x is not 2
x == 1 & y==7 #can we find a vector spot with x=1 and y=7 (answer is no)
x==1 | y==7 #now OR so generate true if one of these is true
x==3 | y==3
xor(x==3, y==3) #function different than simple or, one or the other can be true but not both!!
#common errors with logicals
# = versus ==
z2 <- 5
z2==4 | 6 #gives wrong answer
z2==4 | z2==6

z<- runif(10) #simple integer sequence
print(z)
set.seed(90) #manually give r environment
z <- runif(10)
print(z)

z<0.5 #create logical vector
z[z<0.5] #use index call

which(z <0.5) #use to get indices for logical
z[which(z< 0.5)] #does same as above
zD <- c(z, NA, NA) #contaminate it
print(z)
zD[zD < 0.5] #NA values carried along!
zD[which(zD < 0.5)] #NA values dropped
zD[zD< 0.5] #NA values carried along
zD[which(zD < 0.5)] #NA values dropped
