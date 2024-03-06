library(tidyverse)
library(easystats)
library(palmerpenguins)

#does body_mass_g vary significantly between species

dat <- penguins

mod1 <- glm(data = dat,
    formula = body_mass_g ~ species)

summary(mod1)
performance(mod1)

#predict if penguin is gentoo based off of continuous numerical values

#create a true/false column for gentoos

mod2 <- dat %>% 
  mutate(gentoo = case_when(species == "Gentoo" ~ TRUE,
                           TRUE ~ FALSE)) %>% 
  glm(data =.,
      formula =gentoo ~ bill_depth_mm + body_mass_g + flipper_length_mm + bill_length_mm,
      family = 'binomial') #logistic regression
check_model(mod2)

summary(mod2)

dat$pred <- predict(mod2,penguins,type='response')


dat %>% 
  ggplot(aes(x=body_mass_g,y=pred,color=species)) +
  geom_point()
preds <- 
dat %>% 
  mutate(outcome = case_when(pred < 0.01 ~ "Not Gentoo", 
                             pred > .75 ~ "Gentoo")) %>% 
  select(species,outcome) %>% 
  mutate(correct = case_when(species == "Gentoo" & outcome == "Gentoo" ~ TRUE,
                            species != "Gentoo" & outcome == "Not Gentoo" ~TRUE,
                            TRUE ~ FALSE))

preds %>% 
  pluck("correct") %>% 
  sum() / nrow(preds)


dat2 <- read_csv("./Data/GradSchool_Admissions.csv")
str(dat2)

mod3 <- glm(data = dat2,
            formula = as.logical(admit) ~ (gre + gpa) * rank,
            family = 'binomial')
dat2$pred <- predict(mod3,dat2,type = 'response')

dat2 %>% 
  ggplot(aes(x = factor(rank), y = pred, color = factor(rank))) +
  geom_jitter(alpha=.25) +
  geom_boxplot()

dat2$gre %>% summary






