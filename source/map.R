# MAP PLOT: How has incarceration been distributed across the U.S. as of 2016?

# load data + packages
library(dplyr)
library(tidyverse)
library(ggplot2)
library(plotly)

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

# find total incarceration for 2016
incarceration_2016 <- incarceration %>%
  filter(year == 2016) %>%
  select(year, state, county_name, black_jail_pop)

incarceration_2016_map <- leaflet(data = incarceration_2016) %>%
  addTiles() %>%
  setView(lng = -122.3321, lat = 47.6062, zoom = 10)

incarceration_2016_map



map_data <- incarceration %>%
  group_by(state) %>%
  filter(year == 2016) %>%
  summarize(total_prison_pop = mean(total_prison_pop, na.rm = TRUE)) %>%
  select(state, total_prison_pop)


# give state boundaries a white border
l <- list(
  color = toRGB("white"), 
  width = 2
)

# specify some map projection/options
g <- list(
  scope = 'usa',
  projection = list(type = 'albers usa'),
  showlakes = TRUE,
  lakecolor = toRGB('white')
)

map <- plot_geo(map_data, locationmode = 'USA-states')

map <- map %>% 
  add_trace(
    z = ~total_prison_pop, locations = ~state,
    color = ~total_prison_pop, colors = "Blues"
)

map <- map %>% 
  colorbar(title = "Population")

map <- map %>% 
  layout(
    title = "2016 Average Prison Population",
    geo = g
)

map
