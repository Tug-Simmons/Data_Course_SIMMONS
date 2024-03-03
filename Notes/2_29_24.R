library(tidyverse)
library(easystats)
library(MASS)
dat <- mpg

mod1 <- glm(data = dat,
             formula = cty ~ displ)
class(mod1)
summary(mod1)

mod1$coefficients

mod1$residuals  

mod1$formula

names(mpg)

mpg$cyl

mpg <- mpg %>% 
  mutate(auto = grepl("auto",trans))

mod4 <- glm(data = mpg,
            formula = cty ~ displ * cyl)

mod2 <- glm(data = mpg,
            formula = cty ~ displ + cyl)



mod3 <- glm(data = mpg,
                    formula = cty ~ displ * cyl)

mod4 <- glm(data = mpg,
            formula = cty ~ displ * cyl * auto)

mod5 <- glm(data = mpg,
            formula = cty ~ displ + year + cyl * trans * drv *  fl + class)

formula(mod5)

compare_models(mod1,mod2,mod3,mod4)

compare_performance(mod1,mod2,mod3,mod4,mod5) %>% plot



#remove nonsignificant aspects to a model to simplify the model and only factor in important data

step <- stepAIC(mod5)
step$formula

mod_best <- glm(data = mpg, formula = formula(step)) 



summary(mod4)

mpg$pred <- predict(mod1,mpg)
mpg$pred2 <- predict(mod2,mpg)
mpg$pred3 <- predict(mod3,mpg)

mpg %>% 
  ggplot(aes(x = cty, y = pred3)) +
  geom_point()

mpg %>% 
  pivot_longer(starts_with("pred")) %>% 
  ggplot(aes(x = displ, y = cty, color = factor(cyl))) +
  geom_point() + 
    geom_point(aes(y = value), color = 'black') +
  facet_wrap(~name)
  
check_model(mod5)
mpg$pred

predict(mod1,data.frame(displ = 1:100)) %>% plot

mod1$formula

#mod1 graph#mod1 graphplotly::
mpg %>% 
  ggplot(aes(x=displ,y=cty,)) +
  geom_smooth(method = 'glm')



#mod3 graph
mpg %>% 
  ggplot(aes(x=displ,y=cty, color = factor(cyl))) +
  geom_smooth(method = 'glm')

