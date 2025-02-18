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
