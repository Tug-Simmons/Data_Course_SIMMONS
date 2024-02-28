library(tidyverse)
library(janitor)
install.packages("skimr")
library(skimr)
df <- read_csv("./Data/Bird_Measurements.csv")
df <- clean_names(df)
skim(df)
df <- df %>%  select(-ends_with("_n"))
species_data <- c("family","species_number","species_name","english_name","clutch_size","egg_mass","mating_system")  

male_df <- identical(names(male_df) %>% str_remove("m_"))

male_df <- df %>% 
  select(species_data,starts_with("m_")) %>% 
  mutate(sex="male")
  
names(male_df) <- names(male_df) %>% str_remove("m_")
  
female_df <- df %>% 
  select(species_data,starts_with("f_")) %>% 
  mutate(sex="female")
  
names(female_df) <- names(female_df) %>% str_remove("f_")
  
unsexed_df <- df %>% 
  select(species_data,starts_with("unsexed")) %>% 
  mutate(sex="unsexed")

names(unsexed_df) <- names(unsexed_df) %>% str_remove("unsexed_")
  
sexed_data <- full_join(male_df,female_df)
all_data <- full_join(sexed_data,unsexed_df)
