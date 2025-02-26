#dplyr lecture
#26 February 2025
#TEB

#dply is for data manipulation and structuring your data frames
#The core verbs you might use in dplyr are going to be:
#filter(), arrange(), select(), summarize(), and group_by(), and mutate()

#start with a built- in data set
library(tidyverse)

#You might need to specify which package you are using if it's masked by another package
dplyr::filter()
data(starwars)
class(starwars)
#this data set is a tibble: in general, tibbles do less as a tradeoff to make code simpler and less prone to crashing

glimpse(starwars) #alternative to the str() function
head(starwars) #shows first 6 rows of data set, also an alternative

# cleaning up our data set
#base R has the complete.cases function - this will remove rows with NAs if you do not want them

starwarsClean <-starwars[complete.cases(starwars[,1:10]), ]
#gets rid of all rows with NAs

#you can check for NAs
is.na(starwarsClean[,1])

anyNA(starwarsClean[,1:10])

#filter() function-this will pick or subset observations based on their values
#use >, <, >=, <=, ==, !=,
#logical operators like & and |
#filter will automatically exclude NA, have to ask for them specifically

filter(starwarsClean, gender== "masculine" & height < 180)
filter(starwars, gender =="masculine", height < 180, height > 100)
filter(starwars, eye_color %in% c("blue", "brown"))
# we can %in% for a few different conditions, similar to ==

#arrange() reorder rows
arrange(starwarsClean, by= height)
arrange(starwarsClean, by=desc(height)) #use desc to order it in descending order
arrange(starwarsClean, height, desc(mass)) #Additional columns will break ties in preceeding column
starwars1 <- arrange(starwars, height)
tail(starwars1) #last 6 rows

##select () choose variables by the name
#we can use this in base r
starwarsClean[1:10,]
select(starwarsClean, 1:10)
select(starwarsClean, name:species) #you can subset everything except particular variables

#rearrange columns
select(starwarsClean, homeworld, name, gender, species, everything())

select(starwarsClean, contains("color")) #other helpers include: ends_with, starts_with, mathes(reg ex), num_range

#rename columns
select(starwars, haircolor=hair_color) #actual name of column comes after stating the new name you want

rename(starwarsClean, haircolor=hair_color) #rename keeps all the variables

#mutate() create new variables with fi=unctions of existing variables
#create column of height divided by mass
mutate(starwarsClean, ratio=height/mass)

starwars_lbs<-mutate(starwarsClean, mass_lbs=mass*2.2)
select(starwars_lbs, 1:3, mass_lbs, everything())#using select allows us to bring it to the beginning
#if you only wanted the new variable, you can use transmute function
transmute(starwarsClean, mass_lbs=mass*2.2)
transmute(starwarsClean, mass, mass_lbs=mass*2.2)

#summarize() and group_by() collapse many values down to single summary
summarize(starwarsClean, meanHeight=mean(height)) #gives the summary stat for the entire tibble

summarize(starwars, meanHeight=mean(height))
#Get NA because there are NA values in this dataset, does not work properly if data set is not clean

summarize(starwars, meanHeight=mean(height, na.rm=TRUE), TotalNumber=n())
#use group_by() for additional calculations
starwarsGender <- group_by(starwars, gender)
head(starwarsGender)

summarize(starwarsGender, meanHeight=mean(height, na.rm=TRUE), number=n())

##pipe statements, or piping %>%
#these are sequences of actions that wull change your dataset
#it will let you pass an intermediate result onto the next function in sequence
#you should avoid this when you need to manipulate more than one object at a time, or if there are meaningful intermediate objects
#formatting: should always have a space before it and usually followed by a new line (usually automatic indent)

starwarsClean%>%
  group_by(gender)%>%
  summarize(meanHeight=mean(height, na.rm=T), number=n())

#case_when() is useful for multiple conditional ifelse statements

starwarsClean%>%
  mutate(sp=case_when(species=="Human" ~ "Human", TRUE ~"Non-human"))%>%
  select(name, sp, everything())

#long to wide format and vice-versa
glimpse(starwarsClean)
#make dataset wider
wideSW <- starwarsClean%>%
  select(name, sex, height)%>%
  pivot_wider(names_from=sex, values_from=height, values_fill=NA)
wideSW
pivotSW<-starwars%>%
  select(name, homeworld)%>%
  group_by(homeworld)%>%
  mutate(rn=row_number())%>%
  ungroup()%>%
  pivot_wider(names_from=homeworld, values_from=name)
head(pivotSW)

#make dataset longer
glimpse(wideSW)
wideSW%>%
  pivot_longer(cols = male: female, names_to="sex", values_to="height", values_drop_na=T)
