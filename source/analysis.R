# Assignment 3: Data Visualization (Incarceration)

# Loading Data
library(dplyr)
library(tidyverse)
library(ggplot2)
library(plotly)
library(leaflet)
incarceration <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")



# SUMMARY INFORMATION
### Create a data frame which shows the population of incarcerated people 
### by race
pop_by_race <- incarceration %>%
  select(year, state, county_name, aapi_jail_pop, black_jail_pop, latinx_jail_pop, native_jail_pop, white_jail_pop, other_race_jail_pop)

### Create a data frame that shows the highest `total_jail_pop` for each year 
### along with its respective county/state
highest_jail_pop <- incarceration %>%
  group_by(year) %>%
  filter(total_jail_pop == max(total_jail_pop, na.rm = TRUE)) %>%
  arrange(year) %>%
  select(year, state, county_name, total_jail_pop)

### Find the jail population for the state of Washington
wa_stats <- incarceration %>%
  filter(state == "WA") %>%
  select(year, state, county_name, aapi_jail_pop, black_jail_pop, latinx_jail_pop, native_jail_pop, white_jail_pop, other_race_jail_pop, total_jail_pop)



# CHARTS + MAPS 
### How has incarceration rate changed over time in King County? (CHANGE OVER 
### TIME)
king_county <- wa_stats %>%
  filter(county_name == "King County")

aapi <- ggplot(data = king_county) +
  geom_point(mapping = aes(x = year, y = aapi_jail_pop))

black <- ggplot(data = king_county) +
  geom_point(mapping = aes(x = year, y = black_jail_pop))

latinx <- ggplot(data = king_county) +
  geom_point(mapping = aes(x = year, y = latinx_jail_pop))

native <- ggplot(data = king_county) +
  geom_point(mapping = aes(x = year, y = native_jail_pop))

white <- ggplot(data = king_county) +
  geom_point(mapping = aes(x = year, y = white_jail_pop))

other <- ggplot(data = king_county) +
  geom_point(mapping = aes(x = year, y = other_races_jail_pop))

total <- ggplot(data = king_county) + 
  geom_point(mapping = aes(x = year, y = total_jail_pop))

### How has incarceration been distributed across the U.S. as of 2018? (MAP)
incarceration_2018 <- incarceration %>%
  filter(year == 2018) %>%
  select(year, state, county_name, total_jail_pop)

incarceration_2018_map <- leaflet(data = incarceration_2018) %>%
  addTiles()

### Compare how black incarceration rates have changed over time to white
### incarceration rates (COMPARE TWO VARIABLES TO EACH OTHER)
