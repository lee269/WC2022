library(tidyr)
library(dplyr)
library(here)
library(readr)
library(purrr)

# from https://fixturedownload.com/
fifa_wc_2022 <- read_csv("data/fifa-world-cup-2022.csv")

# Create empty match data template from fixtures
matchdata <- fifa_wc_2022 %>% 
     rename_with(tolower) %>% 
     pivot_longer(cols = c(hometeam, awayteam), names_to = "homeaway", values_to = "team") %>% 
     mutate(homeaway = tolower(homeaway),
            goals = NA,
            penalties = NA,
            ycards = NA,
            rcards = NA,
            fouls = NA) %>% 
     select(-result) %>% 
     arrange(matchnumber, desc(homeaway))

write_csv(matchdata, here("data", "matchdata.csv"))

