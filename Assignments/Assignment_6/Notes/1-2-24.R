mtcars

#1.
#build a data frame from mtcars with only rows that have
#more than 4 cylinders (cyl)
data.frame(mtcars)

mtcars <- mtcars
df <- mtcars[mtcars$cyl > 4,]



#2.
# pull out just the miles per gallon of those cars (mpg)
# and find the mean, min, and max

mean(df$mpg)
min(df$mpg)
max(df$mpg)


## object types ####
## logical ####
c(TRUE,TRUE,FALSE)
## integer ####
c(1L,2L,3L)
## character ####
letters[3]
## data.frame ####
mtcars[rows,cols]
## numeric ####
1:10
## factor ####
# annoying but useful
as.factor(letters)

haircolors <- c("brown","blonde","black","red","red","black")
c(as.factor(haircolors),"purple")
haircolors_factor <- 

as.character(1:5) #convert to character
as.numeric(letters)
letters[3]
as.numeric(c("1","b","35"))
x <- as.logical(c("true","t","F","False","T"))
sum(x,na.rm = TRUE)
sum(TRUE)
TRUE + TRUE


# type conversions ####
1:5 # numeric
as.numeric(letters)


# data frames ####
str(mtcars)
names(mtcars)

# convert each columns data into characters
#long way 
as.character(mtcars$mpg) #etc. etc.

#faster way (forloop)
for(col in names(mtcars)) {
  mtcars[,col] <- as.character(mtcars[,col])
}
str(mtcars)
data("mtcars") #resets built in data frame
str(mtcars)


path <- "./Data/cleaned_bird_data.csv"
df <- read.csv(path)

#convert all columns into characters

for(col in names(df)) {
  df[,col] <- as.character(df[,col])
}
str(df)

write.csv(df,file = "./Data/cleaned_bird_data_characterpractice.csv")


#apply faily function ####

lapply(list, function)
sapply(list, function)
vappy(list, function, FUN.VALUE = type, ...)

# packages ####

## tidyverse ####
library(tidyverse)
#filter helps us subset data frames by rows
mtcars %>% 
  filter(mpg > 19 & vs ==1)
mtcars %>% #ctrl+shift+m
  
mtcars %>% 
  filter(mpg > 19)
library(tidyverse)
mtcars %>% 
  filter(mpg > 19)
%>% %>% %>% %>% %>%  #pipe (ctrl+shift+m)
  #thing on the left side of the pipe becomes the first argument to the thing on the right side of the pipe
  
mtcars$mpg %>% mean()