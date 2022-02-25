# MAP PLOT: How has incarceration been distributed across the U.S. as of 2018?

# load data + packages
library(dplyr)
library(tidyverse)
library(ggplot2)
library(plotly)

install.packages("maps")
library(maps)
install.packages("mapdata")
library(mapdata)

incarceration <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")


# load U.S. data
usa <- map_data("usa")

# give state boundaries a white border
l <- list(color = toRGB("white"), width = 2)

# specify some map projection/options
g <- list(
  scope = 'usa',
  projection = list(type = 'albers usa'),
  showlakes = TRUE,
  lakecolor = toRGB('white')
)

# find total incarceration for 2018
incarceration_2018 <- incarceration %>%
  filter(year == 2018) %>%
  select(year, state, county_name, total_jail_pop)

incarceration_2018_map <- leaflet(data = incarceration_2018) %>%
  addTiles() %>%
  setView(lng = -122.3321, lat = 47.6062, zoom = 10)

incarceration_2018_map
