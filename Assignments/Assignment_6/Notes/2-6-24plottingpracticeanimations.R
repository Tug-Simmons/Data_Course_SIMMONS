library(tidyverse)
library(ggimage)
library(gganimate)
library(patchwork)
library(gapminder)
library(magick)


#plotting

df <- data.frame(gapminder)


p <- ggplot(df,aes(x=country,y=lifeExp,color=continent)) +
  geom_point(aes(size=pop)) +
  facet_wrap(~continent) +
  scale_color_viridis_d()

p.dark <- p +
  theme_dark()

p + p.dark

(p + p.dark) / p.dark + plot_annotation("MAIN TITLE") +
  patchwork::plot_layout(guides = 'collect')

p +
  facet_wrap(~continent)

df$year %>% range

p3 <- 
  ggplot(df,
         aes(x=gdpPercap,y=lifeExp,color=continent)) +
  geom_point(aes(size=pop)) +
  geom_text(aes(label=mycountries))


mycountries <- c("Venezuela","Rwanda","Nepal","Iraq","Afghanistan")

df <- 
df %>% 
  mutate(mycountries = case_when(country %in% mycountries ~ country))

p3 +
  transition_time(time = year) +
  labs(title= 'Year: {frame_time}')

anim_save("./Notes/gapminder_animation.gif")

ggsave("./Notes/plot_example.png",width = 3,height = 15, dpi = 72)
