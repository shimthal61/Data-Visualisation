mpg %>%
  ggplot(aes(x = displ)) +
  geom_histogram(binwidth = .5, fill = "grey") +
  labs(title = "Histogram of Engine Displacement",
       y = "Engine Displacement",
       x = "Count")
