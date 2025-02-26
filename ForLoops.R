#For Loops
#18 February 2025
#TEB



for (var in seq) { #start of for loop

    #body of for loop

}# end of for loop

for(i in 1:5) {
  cat("stuck in a loop", "\n")
  cat(3 + 2, "\n")
  cat(runif(1),"\n")
}

print(i)

my_dogs <- c("chow", "akita","malamute","husky","samoyed")
for (i in 1:length(my_dogs)){
  cat("i=",i,"my_dogs[i] =" ,my_dogs[i],"\n")
}

my_bad_dogs <- NULL
for (i in 1:length(my_bad_dogs)){
  cat("i=",i,"my_bad_dogs[i] =" ,my_bad_dogs[i],"\n")
}

for (i in seq_along(my_dogs)){
  cat("i=",i,"my_dogs[i] =" ,my_dogs[i],"\n")
}

for (i in 1:length(my_dogs)){
  my_dogs[i] <- toupper(my_dogs[i])
  cat("i =",i,"my_dogs[i] =" ,my_dogs[i],"\n")
}

my_dogs <- tolower(my_dogs)
print(my_dogs)
#operated on every element in vector and did not need a for loop to do this


my_dat <- runif(1)
for (i in 2:10) {
  temp <- runif(1)
  my_dat <- c(my_dat,temp) # do not change vector size in the loop!
  cat("loop number =",i,"vector element =", my_dat[i],"\n")
}
length(my_dat)


my_dat <- 1:10
for(i in seq_along(my_dat)) {
  my_dat[i] <- my_dat[i] + my_dat[i]^2
  cat("loop number =",i,"vector element =", my_dat

z <- c(10,2,4)
for(i in 1:length(z)) {
  cat("i =",i,"z[i] =",z[i],"\n")
}

16/5
16%/%5
16 %% 5

z <- 1:20
#What if we want to work with only the odd-numbered elements?
z< 1:20
for (i in 1:length(z)) {
  if(i %% 2 !==0) next
  print(i)
}

#Another method, probably faster (why?)
z <- 1:20
zsub <- z[z %% 2!=0] #contrast wih logical expression in previous satatement!
length(zsub)
print(zsub)

for (i in seq_along(zsub)) {
  cat("i = ",i,"zsub[i] = ", ***

################################################################################
#Function: ran_walk
#Stochastic random walk
#Input: times=number of time steps
  #n1= initial population size (n=[1])
  #lambda= finite rate of increase
  #noise_sd = sd of a normal distribution with mean 0
#Output: vector with n populatuon size >0
#Until extinction then NA
#_______________________________________________________________________________
#lambda >1 living organism
#lambda = 1.0, no change
#lambda =1.1 , 10% increase
#lambda=0.98, 2% decrease

library(ggplot2)
ran_walk <- function(times=100, n1=50, lambda=1.00, noise_sd=10) {
  n <- rep(NA, times)#creae output vector
  n[1] <- n1 #initialize with starting population size
  noise <- rnorm(n=times,mean=0,sd=noise_sd) #create noise vector
  for(i in 1:(times-1)) {
    n[i + 1] <- lambda*n[i] + noise[i]
    if(n[i +1] <=0) {
      n[i + 1] <- NA
      cat("Population extinction time",i+1,"\n")
      break}
   }

     return(n)
}
ran_walk()

qplot(x=1:100, y=ran_walk(),geom="line")
qplot(x=1:100,y=ran_walk(noise_sd=0),geom="line")
qplot(x=1:100,y=ran_walk(noise_sd=0,lambda=1.1),geom="line")
qplot(x=1:100,y=ran_walk(noise_sd=0, lambda=0.98),geom="line")
qplot(x=1:100,y=ran_walk(),geom="line")

m <- matrix(round(runif(20),digits=2,nrow=5)
            #loop over rows
for (i in 1:nrow(m)) { #could use for (i in seq_len(nrow(m)))
  m[i,] <- m[i,] + i
}
print(m)

#loop over columns
m <- matrix(round(runif(20),digits=2),nrow=5)
for (j in 1:ncol(m)) {
  m[,j] +j
}
print(m)


#function: SpeciesAreaCurve
#creares power function relationship for S and A
#input: A is a vector of island areas
#c is the intercept constant
#z is the slope constant
#output: S is a vector of species richness values
species_area_curve <- function(A=1:5000, c=0.5,z=0.26){
  S <- c*(A^z)
  return(S)
}
head(species_area_curve)

####INSERT MNISSING CODE HERE AND PAY MORE ATTENTION!!!!!!!!

#global variables
c_pars <- c(100,150,175)
z_pars <- c(0.10, 0.16, 0.26, 0.3)
par(mfrow=c(3,4))
for (i in seq_along(c_pars)) {
  for (j in seq_along(z_pars)) {
    species_area_plot(c=c_pars[i], z=z_parsp[j])
  }
}

par(mfrow=c(1,1))

#looping with for
cut_point <- 0.1
z <- NA
ran_data <- runif(100)
for (i in seq_along(ran_data)) {
  z <- randata[i]
  if (z < cut_point) break
}
print(z)
print(i)

z <- NA
cycle_number <- 0
while (iz.na(z) | z <= cutpoint) {
  z <- runif(1)
  cycle_number <- cycle_number + 1

}
print(z)
print(cycle_number)

expand.grid(c_pars,z_pars)
df <- expand.grid(c_pars=c_pars,z_pars=z_pars)
head(df)
str(df)

#function: sa_output
#Summary stats for species-area power function
#input: vector of predicted species richness
#output: list of max-min, coefficient of variation
sa_output <- function(S=runif(10)) {
  sum_stats <- list(s_gain=max(S)-min(S),s_cv=sd(S)/mean(S))

  return(sum_stats)
}
sa_output()

#Build program body with a single loop through
#The parameters in model grame
#global variables
are <- 1:5000
c_pars <- c(100,150,175)
z_pars <- c(0.10, 0.16, 0.26, 0.3)

#Set up model frame
model_frame <- expand.grid(c=c_pars,z=z_pars)
model_frame$s_gain <- NA
model_frame$s_cv <- NA
print(model_frame)


#cycle through model calculations
for (i in 1:nrow(model_frame)) {
  #generate S vector
  temp1 <- species_area_curve(A=area,
                              c=model_grame[i,1],
                              z=model_frame[i,2])
  #calculate output stats
  temp2 <- sa_output(temp1)
  #pass results to columns in data_frame
  model_frame[i,c(3,4)] <- temp2
}
print(model_frame)

library(ggplot)

area <- 1:5 #keep very small initially
c_pars <- c(100,150,175)
z_pars <- c(0.1, 0.16, 0.26, 0.3)

#Set up model frame
model_frame <- expand.grid(c=c_pars, z=z_pars, A=area)
model_frame$S <- NA
for ( i in 1:length(c_pars)) {
  for (j in 1: length(z_pars)) {
    model_frame[model_frame$c==c_pars[i] & model_frame$z==z_pars[j] "S"]
<-  species_area_curve(A=area,c=c_pars[i],z=z_pars[j])
  }
}

for (i in 1:nrow(model_frame)) {
  model_frame[i, "S"] <- species_area_curve(A=model_frame$A[i],
                                            c=model_frame$c[i],
                                            z=model_frame$z[i])
}
head(model_frame)

library(ggplot2)
p1 <- ggplot(data=model_frame)
p1 + geom_line(mapping= aes(x=A,y=S)) +
  facet_grid(c~z)

p2 <- p1
p2 + geom_line(mapping=aes(x=A,y=S,group=z)) +
  facet_grid(.~c)

p3 <- p1
p3 + geom_line(mapping=aes(x=A,y=S,group=c)) +
  facet_grid(z~.)
