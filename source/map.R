# MAP PLOT: How has incarceration been distributed across the U.S. as of 2018?

incarceration_2018 <- incarceration %>%
  filter(year == 2018) %>%
  select(year, state, county_name, total_jail_pop)

incarceration_2018_map <- leaflet(data = incarceration_2018) %>%
  addTiles() %>%
  setView(lng = -122.3321, lat = 47.6062, zoom = 10)

incarceration_2018_map
