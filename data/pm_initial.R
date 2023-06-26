## real time pm2.5 data
library(tidyverse)
library(janitor)


pm_data <- read.csv(url('https://azdohv2staticweb.blob.core.windows.net/$web/nyccas_realtime_DEC.csv')) %>%
clean_names() %>% select(-operator)

pm_data_new <- pm_data %>% pivot_wider(
  names_from = site_name,
  values_from = value
) %>%
  mutate(date = substr(starttime, start=1, stop=10)) %>% 
  relocate(date, .after='starttime')



write_csv(pm_data_new, 'output/pm_data.csv')
##is there any way to export and preserve auto update??? ): 
