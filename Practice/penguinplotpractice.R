library(tidyverse)
library(palmerpenguins)
install.packages("leaflet")
install.packages("palmerpenguins")
df <- data.frame("palmerpenguins")

p <- penguins
p %>% 
  summarize(mean_body_mass = mean(body_mass_g)
p %>% pluck("body_mass_g") %>% mean

p %>% 
  ggplot(mapping = aes(x=species,
                       y=body_mass_g)) +
  geom_boxplot() +
  geom_jitter(height = 0, width = .1,alpha=.2)


p %>% 
  ggplot(aes(x=body_mass_g,fill=species)) +
  geom_density(alpha=.25)


df <- read_delim("./Data/datasaurusDozen.tsv")
df %>% 
  group_by(dataset) %>% 
  summarise(meanx = mean(x),
            sdx=sd(x),
            minx=min(x),
            medianx=median(x))
df %>% ggplot(aes(x=x,y=y)) +
  geom_point() +
  facet_wrap(~dataset)



install.packages("GGally")
library(GGally)
ggpairs(penguins)


p %>% 
  filter(!is.na(sex)) %>% 
  ggplot(aes(x=body_mass_g,y=bill_depth_mm,
             color=species,
             shape=sex)) +
           geom_point() + geom_smooth() + facet_wrap(~species,scales = 'free')
                                                     