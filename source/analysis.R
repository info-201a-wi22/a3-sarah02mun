# SUMMARY INFORMATION

# Loading Data
library(dplyr)
library(tidyverse)
library(ggplot2)
library(plotly)
library(leaflet)
incarceration <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")


# Add `locations` column to the data frame which tells the state and county
incarceration <- incarceration %>%
  mutate(location = paste(county_name, state, sep = ", "))


# Create a data frame which shows the population of incarcerated people by race
pop_by_race <- incarceration %>%
  select(year, state, county_name, aapi_jail_pop, black_jail_pop, latinx_jail_pop, native_jail_pop, white_jail_pop, other_race_jail_pop)


# Which state had the highest incarceration population in 2018?
location_highest_2018 <- incarceration %>%
  group_by(year) %>%
  filter(total_jail_pop == max(total_jail_pop, na.rm = TRUE) & year == 2018) %>%
  pull(location)


# Which state had the highest incarceration population in 2018?
location_highest_1970 <- incarceration %>%
  group_by(year) %>%
  filter(total_jail_pop == max(total_jail_pop, na.rm = TRUE) & year == 1970) %>%
  pull(location)


# Find the jail population for the state of Washington
wa_stats <- incarceration %>%
  filter(state == "WA") %>%
  select(year, state, county_name, aapi_jail_pop, black_jail_pop, latinx_jail_pop, native_jail_pop, white_jail_pop, other_race_jail_pop, total_jail_pop)
