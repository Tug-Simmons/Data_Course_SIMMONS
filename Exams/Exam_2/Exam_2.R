#exam 2
library(tidyverse)
library(readxl)
library(janitor)
library(easystats)

#1. Read in the unicef data (10 pts)

dat <- read_csv("unicef-u5mr.csv")

names(dat)

#2. Get it into tidy format (10 pts)

dat <- as.data.frame(dat)

dat <- dat %>% 
  pivot_longer(starts_with("U5MR"))

dat <- dat %>%
  rename(Year = name)
dat <- dat %>% 
  rename(U5MR = value)
dat <- dat %>% 
  rename(Country = CountryName) %>% 
  mutate(Year = str_remove(Year, "U5MR.")) %>% 
  mutate(Year = as.numeric(Year))

#3. Plot each country’s U5MR over time (20 points)

plot1 <- ggplot(dat, aes(x = Year, y = U5MR)) +
  geom_path() +
  scale_x_continuous(breaks = c(1960, 1980, 2000)) +
  facet_wrap(~Continent)

#4. Save this plot as LASTNAME_Plot_1.png

ggsave("SIMMONS_plot_1.png", plot = plot1)

#5. Create another plot that shows the mean U5MR for all the countries within a given continent at each year (20 pts)

avg_dat <- dat %>% 
  group_by(Continent, Year) %>% 
  summarize(Average_U5MR = mean(U5MR, na.rm = TRUE))

avg_dat <- as.data.frame(avg_dat)

plot2 <- avg_dat %>% 
  ggplot(aes(x = Year, y = Average_U5MR, color = Continent)) +
  geom_path() +
  scale_x_continuous(breaks = c(1960, 1980, 2000)) 
  
#6. Save that plot as LASTNAME_Plot_2.png (5 pts)

ggsave("SIMMONS_plot_2.png",plot = plot2)

#7. Create three models of U5MR (20 pts)


mod1 <- glm(data = dat,
            formula = U5MR ~ Year)

mod2 <- glm(data = dat,
            formula = U5MR ~ Year + Continent)

mod3 <- glm(data = dat,
            formula = U5MR ~ Year * Continent)

#8. Compare the three models with respect to their performance

compare_models(mod1,mod2,mod3)

compare_performance(mod1,mod2,mod3) %>% plot

#model 3 is the best model, as the R2 value indicates that the variability observed is best explained by this model.
#Additionally, when plotted, the performance of the 3rd model is better than the other 2 in every regard.

#9. Plot the 3 models’ predictions like so: (10 pts)

dat$mod1 <- predict(mod1, dat) 
dat$mod2 <- predict(mod2, dat) 
dat$mod3 <- predict(mod3, dat)

dat %>%
  pivot_longer(starts_with("mod"),
               values_to = "Predicted_U5MR") %>% 
  ggplot(aes(x = Year, y = Predicted_U5MR, color = Continent)) +
  geom_smooth(method = "glm") +
  facet_wrap(~name)

  

