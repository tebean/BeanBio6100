# Introduction to R scripts
#28 January
#TEB

#Using the assignment operator
x <- 5 #preferred
y = 4 #legal but not used except in function defaults
y = y + 1.1
print (y)
y <- y + 1.1
print (y)

z <- 3 #begin with lower case letter
plantHeight <- 10 #option "camelCaseFormatting"
plant.height <- 4.2 # avoid periods
plant_height <- 3.3 #optimal "snake_case_formatting"
. <- 5.5 # reserve this for a genetic temporary variable (more later)
print (.)

#R's 4 data types
#whether the data is homogeneous (all elements of same type) or heterogeneous can be 1-dimensional or 2-dimensional
#1-D homogeneous = atomic vector
#2-D homogeneous = matrix
#1-D heterogeneous = list
#2-D heterogeneous = data frame (list of equal length vectors)
#each vector in data frame is a single column and elements of column is same type
#multi-dimensional homogenous = array

#types of atomic vectors
# character strings
#integers (single count values)
#double (rational numbers with decimal points)
#integers and doubles are "numeric"
#logical
#(factor)
#vector of lists!
#TRUE or FALSE (T or F) = logical variables

# the combine function
z <- c(3.2, 5, 5, 6)
print(z)
typeof(z) #check what type of variable you have
is.numeric(z) #hand you back a logical value (true or false).. asking is this variable a numeric variable and answer is yes

# c() always "flattens" to an atomic vector
z <- c(c(3,4), c(5,6))
print(z)
z <- c(3, 4, 5, 6)
print (z)

# character strings with single or double quotes
z <- c("perch", "bass", 'trout')
print (z)
typeof(z)

#usee both with an internal quote
z <- c("This is only 'one' caracter string", 'a second')
print (z)
typeof(z)
is.character(z)

#building logicals
#Boolean, not ith quotes, all caps
z <- c(TRUE, TRUE, FALSE)
#avoid abbreviations T, F which will work
print(z)
typeof(z)
is.logical(z)
is.integer(z)


#three properties of a vector
z <- c(1.1, 1.2, 3, 4.4)
typeof(z)
is.numeric(z)
z <- as.character(z) #as. coerces variable
print(z)
typeof(z)


length(z) #gives number of elements that are in it
length(y) #throws error if variable does not exist

z <- runif(5)
#optional attribute not initial
names(z)
print(z)

#add names later after variable is created
z <- runif(5) #random number generator
print(z)
names(z) <- c("chow", "pug", "beagle", "greyhound", "akita")
print(z)
print(z["pug"])


print(z[2]) #second element from vector
#add names when variable is built (with or without quotes)
z2 <- c(gold=3.3, silver=10, lead=2)
print(z2)

#reset names
names(z2) <- NULL
#names can be added for onyl a few elelments
#names do not have to be distinct, but often are
names(z2) <-c ("copprt", "zinc")
print(z2)

#NA values for missing data
z <- c(3.2, 3.3, NA) #NA is a missing value
typeof(z)
length(z)
typeof(z[3]) #what is the type of third element

z1 <- NA
typeof(z1) #different types of NAs
is.na(z) #logical operator to find missing vlaues
mean(z) #won't work because of NA
is.na(z) #evaluate to find missing values
!is.na(z) #use ! for NOT missing values
mean(!is.na(z)) #wrong answer based on TRUE
#! means NOT
mean(z[!is.na(z)]) #correct use of indexing!

#NaN, -Inf, and Inf from numeric division
z <- 0/0 #NaN
typeof(z)
print(z)
z <- 1/0 # Inf
print(z)
z <- -1/0 #-Inf
print(z)


#NULL is an object that is nothing!
#a reserved word inR
z <- NULL
typeof(z)
length(z)
is.null(z) #only operation hat works on a null

#Three notable features opf atomic vectors
#All atomics are of the same type
#if they are different, R coerces them
#logical -> integer -> double -> character
a <- c (2, 2.0)
print(a)
typeof(a) #technically interger coerced to numeric

b <- c ("purple", "green")
typeof(b)
d <- c(a,b)
print(d)
typeof(d) #atomic vector of character strings (reading in data frame for first time)

a <-runif(10)
print(a)
#comparison operators yield a logical result
a > 0.5
#do math on a logical and it coerces to an integer
sum(a > 0.5) #how many elements in vector are greater than 5
#what proportion of the numbers of the vector elelments are greater than 0.5
mean(a > 0.5)

#break down th resilt
. <- a > 0.5
print (.)
. <- as.integer(.)
print(.)
print(sum(.))
print(mean(.))

mean(rnorm(1000) > 2
mean (a > 0.5)
. <- a > 0.5
print (.)
. <- as.integer(.)

#adding a constant to a vector
z <- c(10,20,30)
z + 1
#what happens when vectors are added
y <- c(1,2,3)
z + y
z^2

#but what if the vector lengths are not equal
z <- c(10,20,30)
x <-c(1,2)
z + x


