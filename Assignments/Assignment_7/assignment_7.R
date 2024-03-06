library(tidyverse)
library(easystats)

dat <- read_csv("Utah_Religions_by_County.csv")
dat <- as.data.frame(dat)

names(dat)

unrelated_cols <- c("County", "Pop_2010", "Religious", "Non-Religious")

unrelated_cols_positions <- which(names(dat) %in% unrelated_cols)

cols_to_pivot <- setdiff(seq_along(dat), unrelated_cols_positions)

dat <- pivot_longer(dat, cols = cols_to_pivot, names_to = "religion", values_to = "belief_value")
dat <- pivot_longer(dat, cols = c(Religious, "Non-Religious"), names_to = "Category", values_to = "Percentage")

#Proportion of Religious vs. Non-Religious in each county
ggplot(dat, aes(x = County, y = Percentage, fill = Category)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Religious vs Non-Religious Proportions in Utah Counties",
       y = "Percentage",
       fill = "Religious Affiliation") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#average religion percentage across the state
avg_dat <- dat %>% 
  group_by(religion) %>% 
  summarize(Average_Belief = mean(belief_value, na.rm = TRUE))

ggplot(avg_dat, aes(x = reorder(religion, -Average_Belief), y = Average_Belief)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Average Percent of Belief in Each Religion in Utah",
       x = "Religion",
       y = "Average Percentage") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#Correlation between county population and belief_value?
mod1 <- glm(data = dat,
            formula = belief_value ~ Pop_2010)
summary(mod1)
performance(mod1)


#The extremely low R2 value, almost zero would lead one to believe that it is highly unlikely in any fashion that these 
#two things correlate
names(dat)
#correlation between LDS proportion and proportion of non-religious people?

subset_df <- dat[dat$religion == "LDS" | dat$Category == "Non-religious", ]

str(subset_df)

pivoted_df <- subset_df %>%
  pivot_wider(names_from = Category, values_from = belief_value)

mod2 <- glm(Percentage ~ `Non-Religious`, data = pivoted_df, family = gaussian)

summary(mod2)
performance(mod2)

mod2 %>% plot

#With a high R2 value of .757 and .053 square error, I would see this as indicating correlation
#between the proportion of LDS belief per county and the proportion of non-religious
#I may have janked up a bit plotting, am unsure, may check this with you later