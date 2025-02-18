#13 January 2025
#Control Structures
# TEB

5>3
5<3
5>=5
5<=5
5==3
5!=3
FALSE & FALSE
FALSE & TRUE
TRUE & TRUE

5 > 3 & 1!=2
1==2 & 1!=2

#use | for OR
FALSE | FALSE
FALSE | TRUE
TRUE | TRUE
1==2 | 1!=2

#works with vectors
1:5 > 3
a <- 1:10
b <- 10:1
a > 4 & b > 4


xor(FALSE,FALSE)
xor(FALSE,TRUE)
xor(TRUE,TRUE)
a <-c(0,0,1)
b <- c(0,1,1)
xor(a,b)
a | b


#boolean algebra on sets of atomic vectors (logiucal, numeric, character strings)
a <- 1:7
b <- 5:10

#union to get all elements
union(a,b)
c(a,b)
#what is the difference in output
#when we concatinate the functions we do not pay attention to duplicates
# when we use union we are looking for unique- only 1 of each - gets rid of duplicates

unique(c(a,b))
#intersect to get common elements
intersect(a,b)

#set diff to get distinct elements
setdiff(a,b)
setdiff(b,a)

#setequal to check for identical elements
setequal(a,b)

z <- matrix(1:12, nrow=4, byrow=TRUE)
z1 <- matrix(1:12, nrow-4, byrow=FALSE)

#This just compares element by element
z == z1
#Use identical for entire structures
identical(z,z1)
z1 <- z
identical(z,z1)

d <- 12
d %in% union(a,b)

if (condition) {expression}
if (condition) {expression1} else {expression2}
if condition1) {expression1} else
  if(condition2) {expression2} else


z <- signif(runif(1),digits=2)
  print(z)
  z > 0.5
  if (z > 0.5) cat(z, "is bigger than average number","\n")


if (z>0.8){cat(z,"is a larger number","\n")} else
  if (z<0.2){cat(z, "is a small number","\n")} else
  {cat(z, "is a number of typical size", "\n")}
    cat("z^2=",z^2,"\n")}
#Suppose we have an insect population in which each female lays on average 10.2 eggs following a Poisson distribution with lambra=10.2
#However, there is a 35% chance of parasitism, in which case no eggs are laid. Here is the distriubution of eggs laid for 1000 individuals

tester <- runif(1000) #start with random uniform elements
eggs <- ifelse(tester>0.35,rpois(n=1000,lambda=6.2),0) hist(eggs)


pVals <- runif(1000)
z <- ifelse(pVals<=0.025,"loweerTail", "nonSig")
z[pVals>=0.975] <- "upperTail"
table(z)
head(z)

z1 <- rep("nonSig",length(pVals))
z1[pVals<=0.025] <- "lowerTail"
z1[pVals>=0.975] <- "upperTail"
table(z1)
