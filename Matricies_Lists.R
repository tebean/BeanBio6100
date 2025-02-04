#Matrices and Lists
#04 February 2025
#TEB

#a matrix is an atomic vector that is organized into rows and problems


my_vec <- 1:12 #create vector
m <- matrix(data=my_vec,nrow=4) #data going into matrix, set up dimensions (4 rows or columns must be dividible by total number of elements)
print(m)

m <- matrix(data=my_vec,ncol=3)
print(m)

m <- matrix(data=my_vec,ncol=3,byrow=TRUE)
print(m)

#Lists- 3rd major object used when code in R
#Lists are atomic vectors but each elemenbt can hold things of differnt types and sizes

my_list <- list(1:10,matrix(1:8,nrow=4,byrow=TRUE,letters[1:3],pi)
str(my_list)
print(my_list)

my_list <- list(1:10,
                matrix(1:8,nrow=4, byrow=TRUE,letters[1:3],
                       pi)
 str(my_list)
print(my_list)

my_list[4]
my_list[4]-3 #no, cannot subtract a number from the list!

#to gran the object itself use [[]]
my_list[[4]]
my_list[[4]]-3 #now we have the contents

#if a list has 10 elements it is like a train with 10 cars
#[[5]] gives to the contents of car #5
#[c[4,5,6] gives you a little train with cars 4,5,and 6
#once double bracket is called, you can access individual elements as before
my_list[[2]]
my_list[[2]][4,1]
my_list[[2]][4,1]

#name list items when they are created
my_list2 <- list(tester=FALSE, little_m=matrix(1:9, nrow=3))
print(my_list2)
my_list2$little_m[2,3] #get row 2, column 3
my_list2$little_m #shows whole matrix
my_list2$little_m[2,] #show second row, all columns
my_list2$little_m[,2] #show all rows but only second column, written horizontally

my_list2$little_m[,]
my_list2$little_m[]
my_list2$little_m[2] #reverts to atomic vector and tells you second position
#be careful, always have 2 dimensions for matrix


unrolled <- unlist(my_list2)
print(unrolled)
#The most common use of lists: output from a linear model is a list

library(ggplot2)
y_var <- runif(10)
x_var <- runif(10)
my_model <- lm(y_var~x_var)
qplot(x=x_var, y=y_var)
#look at output in my model
print(my_model)
#full results are in summary
print(summary(my_model))

str(summary(my_model))
summary(my_model)$coefficients
summary(my_model)$coefficients["x_var","Pr(>|t|)"]
summary(my_model)$coefficients[2,4]
u <- unlist(summary(my_model))
print(u)
my_slope <- u$coefficients2
my_pval <- u$coefficients8
print(my_slope)
print(my_pval)

#Data Frames- common way to get data in and out of R
# a data frame is a list equal-length vectors

var_a <- 1:12 #always set this variable a
var_b <- rep(c("Con","LowN", "HighN"), each=4)
var_c <- runif(12)
d_frame <- data.frame(var_a, var_b, var_c)
print(d_frame)
str(d_frame)


