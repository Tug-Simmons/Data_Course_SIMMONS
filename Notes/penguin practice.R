library(tidyverse)
install.packages("palmerpenguins")
library(palmerpenguins)





#find mean body mass of female long-beaked penguins
penguins %>% 
  filter(bill_length_mm > 40 & sex == "female") %>% 
  pluck("body_mass_g") %>% 
  mean
  

#do the same, but for each species
penguins %>% 
  filter(bill_length_mm > 40 & sex == "female") %>% 
  group_by(species,island) %>% 
  summarize(mean_body_mass = mean(body_mass_g),
            min_body_mass = min(body_mass_g),
            max_body_mass = max(body_mass_g),
            sd_body_mass = sd(body_mass_g),
            N = n()) %>% 
  arrange(desc(mean_body_mass)) %>% 
  write_csv("./Data/penguin_summary.csv")


penguins$body_mass_g %>% plot

#find the fattie penguins ( body_mass > 5000 )
#count how many are male and how many are female
#return the max body mass for males and females
#bonus: add new column to penguins that says whether they're a fattie


penguins %>% 
  filter(body_mass_g > 5000) %>% 
  group_by(sex) %>% 
  summarize(N = n(),
            max = max(body_mass_g))


penguins %>% 
  mutate(fattie = body_mass_g > 5000)
  
#make the column say the word fattie when penguin is fattie instead of TRUE/FALSE
x <- 
penguins %>% 
  mutate(fatstat  = case_when(body_mass_g > 5000 ~ "fattie",
                              body_mass_g <= 5000 ~ "skinny"))

#plot colors to show fatties and skinnies
x %>% 
  ggplot(mapping = aes(x=body_mass_g,
                       y=flipper_length_mm,
                       color = fatstat,
                       shape = fatstat)) +
  geom_point() +
  geom_smooth() +
  scale_color_manual(values = c("green","blue")) +
  scale_color_viridis_d(option = 'plasma',end=.8) +
    theme_dark() +
    theme(axis.text = element_text(angle=180,face='italic'))


iris %>% 
  mutate(sepa.area = Sepal.Length * Sepal.Width)

# penguins$fattie <- penguins$body_mass_g > 5000