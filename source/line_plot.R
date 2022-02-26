# COMPARISON LINE PLOT: Compare how black incarceration rates and white 
# incarceration rates have changed over time in King County

# load data + packages
library(dplyr)
library(tidyverse)
library(ggplot2)
incarceration <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")


# make data frame that shows average incarceration population by year for black
# and white groups
avg_black_white_by_year <- incarceration %>%
  group_by(year) %>%
  summarize(avg_black_year = mean(black_prison_pop, na.rm = TRUE), avg_white_year = mean(white_prison_pop, na.rm = TRUE))


# make plot
black_vs_white <- ggplot(data = avg_black_white_by_year) +
  
  # make line plot for Black population
  geom_line(mapping = aes(x = year, y = avg_black_year, color = "Black Pop")) +
  
  # make line plot for White population
  geom_line(mapping = aes(x = year, y = avg_white_year, color = "White Pop")) +
  
  # add appropriate axis labels
  labs(
    x = "Year",
    y = "Incarcerated Population",
    color = "Legend",
    title = "Comparing Black and White Incarceration Populations"
  ) +
  
  # label colors
  scale_color_manual(
    name = "Population Type",
    values = c("Black Pop" = "blue", "White Pop" = "red")
  )

black_vs_white
