library(ggridges)
mpg %>%
  mutate(class = str_to_title(class)) %>%
  #Reorder the graph in order of means
  ggplot(aes(x = displ, y = fct_reorder(class, .fun = mean, displ))) +
  #
  geom_density_ridges(height = .5, aes(fill = class)) +
  theme_grey() +
  theme(text = element_text(size = 13)) +
  guides(fill = 'none') +
  labs (title = "Class by Engine Displacement",
        x = "Engine Displacment (litres",
        y = NULL)