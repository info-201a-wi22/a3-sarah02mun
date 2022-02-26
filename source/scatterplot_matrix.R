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
  select(year, state, county_name, aapi_prison_pop, black_prison_pop, latinx_prison_pop, native_prison_pop, white_prison_pop, other_race_prison_pop, total_prison_pop)


# make data frame that shows King County stats
king_county <- wa_stats %>%
  filter(county_name == "King County")


# make plot for `aapi_prison_pop`
aapi <- ggplot(data = king_county) +
  geom_point(mapping = aes(x = year, y = aapi_prison_pop))

aapi

# make plot for `black_prison_pop`
black <- ggplot(data = king_county) +
  geom_point(mapping = aes(x = year, y = black_prison_pop))

black

# mke plot for `latinx_prison_pop`
latinx <- ggplot(data = king_county) +
  geom_point(mapping = aes(x = year, y = latinx_prison_pop))

latinx 

# make plot for `native_prison_pop`
native <- ggplot(data = king_county) +
  geom_point(mapping = aes(x = year, y = native_prison_pop))

native

# make plot for `white_prison_pop`
white <- ggplot(data = king_county) +
  geom_point(mapping = aes(x = year, y = white_prison_pop))

white

# make plot for `other_race_prison_pop`
other <- ggplot(data = king_county) +
  geom_point(mapping = aes(x = year, y = other_race_prison_pop))

other 

# make plot for `total_prison_pop`
total <- ggplot(data = king_county) + 
  geom_point(mapping = aes(x = year, y = total_prison_pop)) +
  geom_smooth(mapping = aes(x = year, y = total_prison_pop), formula = y ~ x, method = "lm")

total

# make scatter plot matrix
matrix <- ggplot(data = king_county, mapping = aes(x = year, y = total_prison_pop)) +
  geom_point() +
  facet_wrap(~ aapi_prison_pop + black_prison_pop + latinx_prison_pop + native_prison_pop + white_prison_pop + other_race_prison_pop) +
  labs( x = "Year",
        y = "prison Population",
        title = "Demographic in King County"
  )

matrix
