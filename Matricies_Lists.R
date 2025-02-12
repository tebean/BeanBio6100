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

#add another row with rbind
#make sure yiu add a list, with each item corresponding to a new column
# newData <- data.frame(list(varA=13, varB="HighN", varC=0.668), stringsAsFactors=FALSE)
new_data <- list(var_a=13, var_b="HighN", var_C=0.668)
print(new_data)
str(new_data)

d_Frame <- rbind(d_frame, new_data)
str(d_frame)
tail(d_frame)

#adding another column is easier
# newVar <- data.frame(varD=runif(13))
new_var <- runif(14)
d_frame <- cbind(d_frame, new_var)
head(d_frame)

#important distinctions between lists and matricies

# create a matrix and data frame with same structures
z_mat <- matrix(data=1:30, ncol=3, byrow=TRUE)
z_dframe <- as.data.frame(z_mat) #coerce it

str(z_mat) #an atomic vector with 2 dimensions
str(z_dframe) #note horizontal layout of variables

head(z_dframe) #note automatic variable names
head(z_mat) #note identical layout

# element referencing is the same in both
z_mat[3,3]
z_dframe[3,3]

z_mat[,3] #comma is break between designation of rows and columns
z_dframe[,3]
#grabbing column 3 and keeping all of the rows we have

z_dframe$V3
#same result

z_mat[3,]
z_dframe[3,]

#what happens if we reference only one dimension?

z_mat[2] #take the second element of an atomic vector (column fill)
print(z_mat)

z_dframe[2] #takes the second atomic vector
print(z_frame)

z_dframe["V2"]
z_dframe$V2

zd <- runif(10)
print(zd)
#handful of random numbers

zd[c(5,7)] <- NA
print(zd)
#substitue NA into this place

complete.cases(zd)
zd(complete.cases(zd)] #clean them out
which(!complete.cases(zd)) #find NA slots

m <- matrix(1:20, nrow=5)
m[1,1] <- NA
m[5,4] <- NA
print(m)

m[complete.cases(m),]
#keeping all columns, applying complete cases to all the rows

#now get complete cases for only certain column
m[complete.cases(m),]
m[complete.cases(m[,c(1,2)]),] #drops row 1
#complete cases applied to everything inside parentheses
#only drop out first row because first row had missing value in column 1
#did not lose last row because we didn't screen out the last column

m[complete.cases(m[,c(2,3)],] #no drops
m[complete.cases(m[,c(3,4)],] # drops row 4
m[complete.cases(m[,c(1,4)],] #drops 1 and 4

#same principle applied to both dimensions of matrix
m <- matrix(data=1:12, nrow=3)
dimnames(m) <- list(paste("Species", LETTERS[1:nrow(m)],sep=""),paste("Site", 1:ncol(m),sep=""))
print(m)

#subsetting based on elements
m[1:2, 3:4]
#same subsetting based on character strings but no negative elements
m[c("SpeciesA", "SpeciesB", c("Site3","Site4")]

#use blanks before or after com
m[1:2,]
m[,3:4]

colSums(m) > 15
m[, colSums(m) >15
m[rowSums(m)==22,]
m[rowSums(m)!=22,]


#eg choose all rows for which numbers for site 1 are less than 3
#AND choose all columns for which the numbers for species A are less than 5
#first, try out this logical for rows
m[, "Site1"]<3
m[m[, "Site1"]<3,]

#and try this logical for columns
m["SpeciesA",]<5

m[m[, "Site1"]<3,m["SpeciesA",<5]
print(m)

#Caution!!! Simple subscripting to a vector changes the data type!

z <- m[1,]
print(z)
str(z)
#back to atomic vector because only 1 dimension

z2 <- m[1, ,drop=FALSE]
print(z2)
str(z2)

m2 <- matrix(data=runif(9),nrow=3)
print(m2)
m2[2, ]
m2[2]
m2[2,1]
m2[m2>0.6] <- NA
print(m2)

data <-read.csv(file="antcountydata.csv",header=TRUE,sep=",")
str(data)

data[3,2]
data_names <- data[c("state","country")]
str(data_names)

data_names <- data[ ,c("county", "ecoregion")]
str(data_names)

#code for reading in a data frame from a .csv file
my_data <- read.table(file="ToyData.csv",
                      header=TRUE,
                      sep=",",
                      comment.char="#")
#inspect object
str(my_data)
head(my_data)

write.table(x=my_data,
              file="SampleOutputFile.csv",
            HEADER=TRUE,
            sep=",")

saveRDS(my_data, file="my_data.RDS") #.RDS suffic is not required but good for clarity

restored_my_data <-readRDS("my_data.RDS")

