mpg %>%
  mutate(class = str_to_title(class)) %>%
  ggplot(aes(x = cty, y = displ)) +
  #geom_point is used to create scatterplots
  geom_point(aes(colour = class)) +
  #Adds in a line of best fit
  geom_smooth(se = FALSE) +
  theme(text = element_text(size = 13)) +
  theme_gray() +
  labs(x = "City Fuel Economy (mpg)",
       y = "Engine Displacement (litres)",
       colour = "Vehicle Class")
          