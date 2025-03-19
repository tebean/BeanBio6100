#Learning the basics of SQL
#27 February 2025

library(sqldf)
library(tidyverse)

#read in the data set and take a look at it

species_clean <-read.csv("site_by_species.csv")
var_clean<-read.csv("site_by_variables.csv")
head(species_clean)
head(var_clean)

#start with using operations/functions on just 1 file
#How to subset rows
#dplyr method-using filter()
species<-filter(species_clean, Site<30)

#SQL Method for subsetting rows
query<-"SELECT Site, Sp1, Sp2, Sp3 FROM species WHERE Site<'30'"
sqldf(query)

#Method for subsetting columns
#dplyr
edit_species<-species%>%
  select(Site, Sp1, Sp2, Sp3)
Edit_species2<-species%>%
  select(1,2,3,4)

#SQL Method for subsetting columns
#querying the entire table
query="SELECT * FROM species"
a<-sqldf(query)
sqldf(query)

#Renaming column
#in dplyr, we just rename() the function
species<-rename(species, Long=Longitude.x., Lat-Latitude.y.(species$Site)))
#Pull out all the numeric columns
num_species<-species%>%
  mutate(letters=rep(letters, length.out=length(Species$Site)))
num_species<-select(num_species, Site, Long, Lat, sp1, letters)
num_species_edit<-select(num_species, where(is.numeric)) #Addng the 'where' helper function serves to sort add conditions to your selct function
#Pivot longer will lengthen the data, decrease the number of columns, and increase the number of rows. Can also use gather() but it is outdated

species_long<-pivot_longer(edit_species, cols = c(Sp1, Sp2, Sp3), names_to="ID")
species_wide<-pivot_wider(species_long, names_from=ID)

#Aggregating the data, getitng some kind of calculation
#SQL
query="SELECT SUM(Sp1+Sp2+Sp3) FROM species_wide GROUP BY SITE"
sqldf(query)

#query="ALTER TABLE species_wide ADD new_column VARCHAR"
#sqldf(query)

#2 file operation-joining datasets together
#Left/Right/Union joins
#First start with clean-rest the species var variables, and then filter o them to a managable size
edit_species<-species_clean%>%
  filter(Site<30)%>%
  select(Site , Sp1, Sp2, Sp3, Sp4, Longitude.x., Latitude.y.)

edit_var<- var_clean%>%
  filter(Site<30)%>%
  select(Site, Longitude.x., Latitude.y., BIO1_Annual_mean_temperature, BIO12_Annual_precipitation)

#Left_join- left-joining basically means stitching the matching rows of file B to File A- does require a matching marker/column to link the two data sets

left<-left_join(edit_species, edit_var, by="Site")
right<-right_join(edit_species, edit_var, by="Site")

#Inner joins retains the rows that matches between both files A and B
#This one loses a lot of information if they aren't matching very well
inner<-inner_join(edit_species, edit_var, by="Site")

#Full join - opposite of inner join, retains all values and all rows, instead of losing data, get additional data with NAs

full<-full_join(edit, edit_var, by="Site")

#SQL method for joining data
query="SELECT BIO1_Annual_mean_temperature, BIO12_Annual_precipitation from edit_var LEFT JOIN edit_species ON edit_var.Site = edit_species.Site"
x<-sqldf(query)
x
