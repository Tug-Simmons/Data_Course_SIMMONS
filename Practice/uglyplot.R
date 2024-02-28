#ugly plot time baby

library(tidyverse)
library(gganimate)
library(ggimage)
library(ggplot2)
library(palmerpenguins)
library(extrafont)
library(showtext)
library(png)
library(grid)
library(ggpubr)
library(cowplot)
library(jpeg)
library(plotly)

img <- readJPEG("C:/Users/Tug/Desktop/gzahn.jpg")
img2 <- readPNG("C:/Users/Tug/Desktop/grad04.png")
p <- penguins
p <- data.frame(p)
p <- p %>% rename(dear_god_Im_begging_you = sex)
p <- p %>% rename(Dr_Zahn_help = species)

p <- p %>% 
  mutate(Dr_Zahn_help = ifelse(Dr_Zahn_help %in% c("Adelie"), "penguin", Dr_Zahn_help))
p <- p %>% 
  mutate(Dr_Zahn_help = ifelse(Dr_Zahn_help %in% c("2"), "?????", Dr_Zahn_help))
p <- p %>% 
  mutate(Dr_Zahn_help = ifelse(Dr_Zahn_help %in% c("Iris"), "Put me out of my misery", Dr_Zahn_help))
p <- p %>% 
  mutate(dear_god_Im_begging_you = ifelse(dear_god_Im_begging_you %in% c("male"), "No", dear_god_Im_begging_you))
p <- p %>% 
  mutate(dear_god_Im_begging_you = ifelse(dear_god_Im_begging_you %in% c("1"), "Yes?", dear_god_Im_begging_you))
p <- p %>% 
  mutate(dear_god_Im_begging_you = ifelse(dear_god_Im_begging_you %in% c("NA"), "YES!", dear_god_Im_begging_you))
p <- p %>% 
  mutate(island = ifelse(island %in% c("Biscoe"), "Definitely", island))
p <- p %>% 
  mutate(island = ifelse(island %in% c("2"), "Maybe", island))
p <- p %>% 
  mutate(island = ifelse(island %in% c("3"), "hmmm", island))

plot <- p %>%
  ggplot(aes(x=body_mass_g,y=bill_depth_mm,
             color=Dr_Zahn_help,
             shape=dear_god_Im_begging_you)) +
  scale_color_manual(values = c("palegreen3","darkmagenta","yellow3")) +
  annotation_custom(
    grob = rasterGrob(img, interpolate = TRUE),
    xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf
  ) +
  theme(plot.background = element_rect(fill = "transparent", color = NA)) +
  geom_point(alpha = 0.1) + geom_smooth() + facet_wrap(~island,scales = 'free') +
  theme_linedraw() +
  theme(axis.title.x = element_text(size = 24, face = "bold", color = "cyan", family = "Comic Sans MS", angle = 180)) +
  theme(axis.title.y = element_text(size = 20, face = "bold", color = "purple", family = "Impact", angle = 12)) +
  ggtitle("This is a cry for help") +
  theme(plot.background = element_rect(fill = "darkgoldenrod3")) +
  annotation_custom(
    grob = rasterGrob(img, interpolate = TRUE),
    xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf
  ) +
  geom_violin(alpha = 0.1) +
  geom_hex(alpha = 0.1) +
  geom_polygon(alpha = 0.1)+
  labs(y = "Is it?") +
  labs(x = "please help me") +
  annotation_custom(rasterGrob(img2, width = unit(1, "npc"), height = unit(1, "npc")), xmin = Inf, xmax = Inf, ymin = -Inf, ymax = -Inf) +
  theme(plot.title = element_text(size = 23, color = "red", face = "bold", family = "Comic Sans MS", hjust = 0.5, vjust = 0.5, lineheight = 2))

       

ggsave("plot4.png", plot = plot, dpi = 70)

