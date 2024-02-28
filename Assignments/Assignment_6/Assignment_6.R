library(tidyverse)
library(gganimate)

#Cleans this data into tidy (long) form

dat <- read_csv("./BioLog_Plate_Data.csv")

dat <- as.data.frame(dat)

dat <- dat %>% 
  pivot_longer(cols = c("Hr_24", "Hr_48", "Hr_144"), names_to = "Hour") %>%
  mutate(Hour = gsub("Hr_", "", Hour)) %>%
  rename(Carbon_Absorption = value) %>% 
  rename(Sample_ID = 'Sample ID')


dat$Hour <- as.numeric(as.character(dat$Hour))


#Creates a new column specifying whether a sample is from soil or water

dat <- dat %>% 
  mutate(Sample_Type = case_when(
    grepl("Clear_Creek", `Sample_ID`) ~ "water",
    grepl("Waste_Water", `Sample_ID`) ~ "water",
    grepl("Soil_1", `Sample_ID`) ~ "soil",
    grepl("Soil_2", `Sample_ID`) ~ "soil",
    TRUE ~ NA_character_
  ))

#Generates a plot that matches this one (note just plotting dilution == 0.1):

filtered_data <- dat %>% filter(Dilution == 0.01)

filtered_data %>% 
  ggplot(aes(x = Hour, y = Carbon_Absorption, color = Sample_Type)) +
  geom_smooth(se = FALSE) +
  scale_x_continuous(breaks = c(0, 50, 100, 150)) +
  facet_wrap(~ Substrate) +
  ggtitle("Dilution = 0.1")

#Generates an animated plot that matches this one (absorbance values are mean of all 3 replicates for each group):
#This plot is just showing values for the substrate “Itaconic Acid”

It.Acid <- 
  dat %>% 
  filter(Substrate == "Itaconic Acid") %>% 
  group_by(Sample_ID, Dilution, Hour) %>% 
  summarize(Average_Absorption = mean(Carbon_Absorption))

It.Acid %>% 
  ggplot(aes(x = Hour, y = Average_Absorption, color = Sample_ID)) +
  geom_line() +
  labs(y = "average_absorption") +
  facet_wrap(~ Dilution) +
  transition_reveal(Hour)

