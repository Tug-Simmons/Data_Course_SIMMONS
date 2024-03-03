library(tidyverse)
install.packages("measurements")
library(measurements)
library(readxl)
library(janitor)
install.packages("lubridate")
library(lubridate)
x <- c(12,31,44)
measurements::conv_unit(x, from = 'inch', to = 'ft')
measurements::conv_unit(x, from = 'inch', to = 'parsec')






path <- "./Data/CW_CameraData_2019.xlsx"

sites <- c("South Oak Spring Site 2","North Oak Spring Site 1")

sites[1] %>% str_replace_all(" ","_")      
    



South_Oak_Spring_Site_2 <- 
read_trap_data(path = path,
               sheet = sites[1],
               range1 = "B17:I17",
               range2 = "A2:I12")

North_Oak_Spring_Site_1 <- 
read_trap_data(path = path,
               sheet = sites[1],
               range1 = "B15:I15",
               range2 = "A2:I12")






trap_days <- read_xlsx(path,sheet = sites[1],range = "B17:I17",col_names = FALSE)

South_Oak_Spring_Site_2 <- 
read_xlsx(path,sheet = sites[1],range = "A2:I12") %>% 
  clean_names() %>% 
  mutate(across(-species,as.numeric)) %>% 
  pivot_longer(-species,
               names_to = "month",
               values_to = "obs_count") %>% 
  mutate(site = sheet,
         month = str_to_sentence(month),
         species = str_to_sentence((species)) %>% 
           mutate(month = case_when(str_detect("[J,j]an") ~ "January",
                                    str_detect("[F,f]eb") ~ "February",
                                    str_detect("[M,m]ar") ~ "March",
                                    str_detect("[A,a]pr") ~ "April",
                                    str_detect("[M,m]ay") ~ "May",
                                    str_detect("[J,j]un") ~ "June",
                                    str_detect("[J,j]ul") ~ "July",
                                    str_detect("[A,a]ug") ~ "August",
                                    str_detect("[S,s]ep") ~ "September",
                                    str_detect("[O,o]ct") ~ "October",
                                    str_detect("[N,n]ov") ~ "November",
                                    str_detect("[D,d]ec") ~ "December",
                                    TRUE ~ month))
                                    

South_Oak_Spring_Site_2 <- 
South_Oak_Spring_Site_2 %>% 
  full_join(
    data.frame(month = South_Oak_Spring_Site_2)
  )
data.frame(month = South_Oak_Spring_Site_2$month %>% unique,
           trap_days = trap_days[1,] %>% as.numeric())
  )

trap_days[1,] %>% as.numeric()