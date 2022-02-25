# COMPARISON LINE PLOT: Compare how black incarceration rates and white 
# incarceration rates have changed over time in King County

black_vs_white <- ggplot() +
  geom_line(data = king_county, mapping = aes(x = year, y = black_jail_pop, color = "Black Pop")) +
  geom_line(data = king_county, mapping = aes(x = year, y = white_jail_pop, color = "White Pop")) +
  labs(
    x = "Year",
    y = "Incarcerated Population",
    color = "Legend",
    title = "Comparing Black and White Incarceration Populations in King County"
  ) +
  scale_color_manual(
    name = "Population Type",
    values = c("Black Pop" = "blue", "White Pop" = "red")
  )

black_vs_white
