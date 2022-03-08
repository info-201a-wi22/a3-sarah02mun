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
  select(year, state, county_name, aapi_prison_pop, black_prison_pop, latinx_prison_pop, native_prison_pop, white_prison_pop, other_race_prison_pop)


# Make list of summary values
summary_info <- list()

# Which location had the highest incarceration population in 1970?
summary_info$
  location_highest_1970 <- incarceration %>%
  group_by(year) %>%
  filter(total_prison_pop == max(total_prison_pop, na.rm = TRUE) & year == 1970) %>%
  pull(location)

# Which location had the highest incarceration population in 2016?
summary_info$location_highest_2016 <- incarceration %>%
  group_by(year) %>%
  filter(total_prison_pop == max(total_prison_pop, na.rm = TRUE) & year == 2016) %>%
  pull(location)

# What was the average total prison population in 2016?
summary_info$avg_total <- incarceration %>%
  filter(year == 2016) %>%
  summarize(avg_total = mean(total_jail_pop, na.rm = TRUE)) %>%
  pull(avg_total)

# Which racial group had the highest average prison population in 2016?
summary_info$avg_aapi <- pop_by_race %>%
  group_by(year) %>%
  filter(year == 2016) %>%
  summarize(avg_aapi_pop = mean(aapi_prison_pop, na.rm = TRUE)) %>%
  pull(avg_aapi_pop)

summary_info$avg_black <- pop_by_race %>%
  filter(year == 2016) %>%
  summarize(avg_black_pop = mean(black_prison_pop, na.rm = TRUE)) %>%
  pull(avg_black_pop)

summary_info$avg_latinx <- pop_by_race %>%
  filter(year == 2016) %>%
  summarize(avg_latinx = mean(latinx_prison_pop, na.rm = TRUE)) %>%
  pull(avg_latinx)

summary_info$avg_native <- pop_by_race %>%
  filter(year == 2016) %>% 
  summarize(avg_native_pop = mean(native_prison_pop, na.rm = TRUE)) %>%
  pull(avg_native_pop)

summary_info$avg_white <- pop_by_race %>%
  filter(year == 2016) %>%
  summarize(avg_white_pop = mean(white_prison_pop, na.rm = TRUE)) %>%
  pull(avg_white_pop)

summary_info$avg_other <- pop_by_race %>%
  filter(year == 2016) %>%
  summarize(avg_other_pop = mean(other_race_prison_pop, na.rm = TRUE)) %>%
  pull(avg_other_pop)

# What is the ratio between the average female prison population and the average 
# male prison population in 2016?
avg_male_pop <- incarceration %>%
  filter(year == 2016) %>%
  summarize(avg_male_pop = mean(male_prison_pop, na.rm = TRUE)) %>%
  pull(avg_male_pop)

avg_female_pop <- incarceration %>%
  filter(year == 2016) %>%
  summarize(avg_female_pop = mean(female_prison_pop, na.rm = TRUE)) %>%
  pull(avg_female_pop)

summary_info$ratio_male_female <- avg_male_pop / avg_female_pop

