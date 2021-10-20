mpg %>%
  ggplot(aes(x = displ)) +
  #Create a histogram, specify the bar width and colour
  geom_histogram(binwidth = .5, fill = "grey") +
  labs(title = "Histogram of Engine Displacement",
       y = "Engine Displacement",
       x = "Count")