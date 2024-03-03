# SETUP ####
library(tidyverse)
library(readxl)
library(measurements)

# DATA ####
path <- "C:/Users/Tug/BIO3100/Data_Course_SIMMONS/Data/human_heights.xlsx"
dat <- read_xlsx(path)

# CLEAN ####
dat <- 
dat %>% 
  pivot_longer(everything(),
               names_to = "sex",
               values_to = "height") %>% 
  separate(height, into = c("feet","inches"),convert = TRUE) %>% 
  mutate(inches = (feet*12) + inches) %>% 
  mutate(cm=conv_unit(inches, from='in',to='cm'))

dat %>% 
  ggplot(aes(x=cm,fill=sex)) +
  geom_density(alpha=.5)


# T.test

t.test()
  
x ~ y 
t.test(dat$cm ~ factor(dat$sex))

mod <- glm(data=dat,
    formula = cm ~ sex)

summary(mod)

model <- mpg


modelf <- glm(data=model,
    formula = cty ~ cyl)
summary(modelf)

model %>% 
  ggplot(aes(x=cyl,y=cty)) +
  geom_point() +
  geom_smooth(method = 'glm')
glam(data = model,
     formula = cty ~ manufacturer) %>% 
  summary()


install.packages("easystats")
library(easystats)

report(model)
report(mod)


performance(mod)
performance::check_model(mod)


data.frame(A = rnorm(50000,mean = 0,sd=1),
           B = rnorm(50000,mean = 5, sd =1)) %>% 
  pivot_longer(everything()) %>% 
  ggplot(aes(x=value,fill=name)) +
  geom_density()
           
rnorm(10,mean = 0, sd = 1)
