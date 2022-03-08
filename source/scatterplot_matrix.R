#SCATTER PLOT MATRIX: How has incarceration rate changed over time in King 
# County? (CHANGE OVER TIME)

# load data + packages
library(dplyr)
library(tidyverse)
library(ggplot2)
incarceration <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")


# find the prison population for the state of Washington
wa_stats <- incarceration %>%
  filter(state == "WA") %>%
  select(year, state, county_name, total_prison_pop)


# make data frame that shows King County stats
king_county <- wa_stats %>%
  filter(county_name == "King County")


# make plot for `total_prison_pop`
total <- ggplot(data = king_county) + 
  geom_point(mapping = aes(x = year, y = total_prison_pop)) +
  geom_smooth(mapping = aes(x = year, y = total_prison_pop), formula = y ~ x, method = "lm") +
  labs(
    x = "Year", 
    y = "Prison Population",
    title = "Total prison population in King County between 1970 and 2016"
  )

total
