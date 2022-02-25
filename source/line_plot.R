# COMPARISON LINE PLOT: Compare how black incarceration rates and white 
# incarceration rates have changed over time in King County

# load data + packages
library(dplyr)
library(tidyverse)
library(ggplot2)
incarceration <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")

# find the jail population for the state of Washington
wa_stats <- incarceration %>%
  filter(state == "WA") %>%
  select(year, state, county_name, aapi_jail_pop, black_jail_pop, latinx_jail_pop, native_jail_pop, white_jail_pop, other_race_jail_pop, total_jail_pop)

# make data frame that shows King County stats
king_county <- wa_stats %>%
  filter(county_name == "King County")

# make plot
black_vs_white <- ggplot(data = king_county) +
  
  # make line plot for Black population
  geom_line(mapping = aes(x = year, y = black_jail_pop, color = "Black Pop")) +
  
  # make line plot for White population
  geom_line(mapping = aes(x = year, y = white_jail_pop, color = "White Pop")) +
  
  # add appropriate axis labels
  labs(
    x = "Year",
    y = "Incarcerated Population",
    color = "Legend",
    title = "Comparing Black and White Incarceration Populations in King County"
  ) +
  
  # label colors
  scale_color_manual(
    name = "Population Type",
    values = c("Black Pop" = "blue", "White Pop" = "red")
  )

black_vs_white
