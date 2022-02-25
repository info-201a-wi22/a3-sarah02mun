#SCATTER PLOT MATRIX: How has incarceration rate changed over time in King 
# County? (CHANGE OVER TIME)


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
  geom_point(mapping = aes(x = year, y = total_jail_pop))