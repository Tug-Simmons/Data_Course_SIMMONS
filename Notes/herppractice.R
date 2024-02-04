library(tidyverse)

herps <- read_csv(file = "./Data/AllHerpData2019_2023.csv")

herps$species
herps %>% 
  filter(
herps[herps$species == "Great Basin Rattlesnake",] 
herps[herps$species == "Yellow-Bellied Racer",]
    
herps$weight_g %>% plot
group_by(species)


herps %>% group_by(species) %>% 
filter(AliveorDea == "Alive")

herps %>% filter(species == "Great Basin Rattlesnake", "Gopher Snake", "Striped Whipsnake")
herps$species = "Great Basin Rattlesnake""Yellow-Bellied Racer""Striped Whipsnake""Gopher Snake"
herps %>% 
  ggplot(mapping = aes(x=length_cm,y=weight_g,
                       color=species,
                       shape=species))

  data.frame(herps)
  herps
as.factor("species")  
dev.off
plot(rnorm(50), rnorm(50))
