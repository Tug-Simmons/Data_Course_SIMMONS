library(tidyverse)
library(ggimage)
library(gganimate)
library(patchwork)
library(gapminder)
library(magick)




table2 %>% 
  pivot_wider(names_from = type,values_from = count)
table3 %>% 
  separate(rate, into = c("cases","Population"))

x <- table4a %>% 
  pivot_longer(-country,names_to = "year",
               values_to = "cases")

y <- table4b %>% 
  pivot_longer(-country,names_to = "year",
               values_to = "population")

x
y
full_join(x,y)

table5 %>% 
  separate(rate, into = c("cases","population"),convert = TRUE) %>% 
  mutate(year = paste0(century,year) %>% as.numeric()) %>% 
  select(-century)

hr <- 
  dat %>% 
  select(-starts_with("BP"))
hr <- 
  hr %>% 
  pivot_longer(starts_with("HR"),
               names_to = "visit",
               values_to = "hr") %>% 
  mutate(visit = case_when(visit == "HR...9" ~ 1,
                           visit == "HR...11" ~ 2,
                           visit == "HR...13" ~ 3))

bp %>% 
  pivot_longer(starts_with("visit"),
               names_to = "visit",
               values_to = "bp",
               names_prefix = "visit",
               names_transform = as.numeric)
paste0("visit",1:n.visits)


hr <- hr %>% 
  pivot_longer(starts_with("BP"),
               names_to = "visit",
               values_to = "hr") %>% 
  mutate(visit = case_when(visit == "BP...8" ~ 1,
                           visit == "BP...10" ~ 2,
                           visit == "BP...12" ~ 3)) %>% 
  bp <- bp %>% separate(bp, into = c("systolic", "diastolic"),convert = TRUE)

df <- full_join(bp,hr)

library(readxl)
dat <- read_xlsx("./Data/messy_bp.xlsx",skip = 3)

bp <- 
  dat %>% 
  select(-starts_with("HR"))

#find all columns labeled as BP... and change them to visit number
names(bp)[which(grepl("^BP",names(bp)))] <- paste0("visit",1:n.visits)

n.visits <- bp %>% 
  select(starts_with("BP")) %>% 
  length()
which(grepl("^BP",names(bp)))

names(bp)[8:10] <- paste0("visit_",1:n.visits)
names(bp)

bp <- 
bp %>% 
  pivot_longer(starts_with("visit"),
               names_to = "visit",
               values_to = "bp",
               names_prefix = "visit",
               names_transform = as.numeric)
paste0("visit",1:n.visits)
# cleanup stuff

install.packages("janitor")
library(janitor)
janitor::clean_names()
#cleanup column names to make sense
df <- df %>% 
  clean_names()

make_clean_names(c("# of bacteria","% caucasian"))

df$race %>% unique

df <- df %>% 
  mutate(race = case_when(race == "Caucasian" | race == "WHITE" ~ "White",
                          TRUE ~ race)) %>% 
  mutate(birthdate = paste(year_birth,month_of_birth,day_birth,sep = "-") %>% as.POSIXct()) %>% 
  mutate(systolic = systolic %>% as.numeric(),
         diastolic = diastolic %>% as.numeric()) %>% 
  select(-pat_id,-month_of_birth,-day_birth,-year_birth) %>% 
  mutate(hispanic = case_when(hispanic == "Hispanic" ~ TRUE,
                              TRUE ~ FALSE)) %>% 
  pivot_longer(cols = c("systolic","diastolic"),names_to = "bp_type",values_to = "bp")
  
df %>% 
  ggplot(aes(x=visit,y=hr,color=sex)) +
  geom_path()+
  facet_wrap(~race)

df %>% 
  ggplot(aes(x=visit,color=sex)) +
  geom_path(aes(y=systolic))+
  geom_path(aes(y=diastolic))+
  facet_wrap(~race)
df %>% 
  ggplot(aes(x=visit,y=bp,color=bp_type)) +
  geom_path()+
  facet_wrap(~race)

