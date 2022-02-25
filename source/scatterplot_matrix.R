#SCATTER PLOT MATRIX: How has incarceration rate changed over time in King 
# County? (CHANGE OVER TIME)

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


# make plot for `aapi_jail_pop`
aapi <- ggplot(data = king_county) +
  geom_point(mapping = aes(x = year, y = aapi_jail_pop))


# make plot for `black_jail_pop`
black <- ggplot(data = king_county) +
  geom_point(mapping = aes(x = year, y = black_jail_pop))


# mke plot for `latinx_jail_pop`
latinx <- ggplot(data = king_county) +
  geom_point(mapping = aes(x = year, y = latinx_jail_pop))


# make plot for `native_jail_pop`
native <- ggplot(data = king_county) +
  geom_point(mapping = aes(x = year, y = native_jail_pop))


# make plot for `white_jail_pop`
white <- ggplot(data = king_county) +
  geom_point(mapping = aes(x = year, y = white_jail_pop))


# make plot for `other_race_jail_pop`
other <- ggplot(data = king_county) +
  geom_point(mapping = aes(x = year, y = other_race_jail_pop))


# make plot for `total_jail_pop`
total <- ggplot(data = king_county) + 
  geom_point(mapping = aes(x = year, y = total_jail_pop)) +
  geom_smooth(mapping = aes(x = year, y = total_jail_pop), formula = y ~ x, method = "lm")


# make scatterplot matrix
matrix <- ggplot(data = king_county, mapping = aes(x = year, y = total_jail_pop)) +
  geom_point() +
  facet_wrap(~ aapi_jail_pop + black_jail_pop + latinx_jail_pop + native_jail_pop + white_jail_pop + other_race_jail_pop) +
  labs( x = "Year",
        y = "Jail Population",
        title = "Demographic in King County"
  )

matrix
