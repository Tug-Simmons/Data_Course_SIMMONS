
read_trap_data <- 
function(path,sheet,range1,range2){
  trap_days <- read_xlsx(path,sheet = sheet,range = range1,col_names = FALSE)

x <- 
  read_xlsx(path,sheet = sheet,range = range2) %>% 
  clean_names() %>% 
  pivot_longer(-species,
               names_to = "month",
               values_to = "obs_count") %>% 
  mutate(site = sheet,
         month = str_to_sentence(month),
         species = str_to_sentence(species))
         

x <- 
  x %>% 
  full_join(
             data.frame(month = South_Oak_Spring_Site_2)
           )
         data.frame(month = South_Oak_Spring_Site_2$month %>% unique,
                    trap_days = trap_days[1,] %>% as.numeric()
  )}