library(tidyverse)

(iris$species) %>% 
  stringr::str_to_tile %>% 
  unique()
iris
iris$Species %>% 
  stringr::str_to_title() %>% 
  unique()

#convert following code into pipe format expressions

unique(stringr::str_to_title(iris$Species)
       
       #converted:
       iris$Species %>% 
         stringr::str_to_title() %>% 
         unique()
       
max(round(iris$Sepal.Length),0)
#converted
iris$Sepal.Length %>% 
  round(1)
  
#convert
mean(abs(rnorm(100,0,5)))

#convert

median(round(seq))
       