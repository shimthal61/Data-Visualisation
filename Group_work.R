library(tidyverse, Hmisc, ggridges)

tidy_starwars <- starwars %>%
  filter(!is.na(height))

head(tidy_starwars)

tidy_starwars %>%
  mutate(hair_color = str_to_title(hair_color)) %>%
  ggplot(aes(x = hair_color, y = height)) + 
  geom_point(aes(colour = hair_color)) +
  geom_smooth(se = FALSE) +
  geom_jitter(width = .2, alpha = 0.75, size = 2) +
  theme_minimal() +
  guides(colour = 'none') +
  theme(axis.text.x = element_text(angle = 45, size = 9, vjust = 0.5)) +
  labs(title = "Height of starwars species",
       x = "Hair Colour",
       y = "Height(cm)")

density_starwars <- tidy_starwars %>%
  ggplot(aes(x = height)) +
  geom_histogram(aes(y = ..density..), binwidth = 5, fill = "purple") +
  geom_density(aes(y = ..density..)) +
  labs(title = "Density of height",
       x = "Height (cm)",
       y = "Density")
  



  