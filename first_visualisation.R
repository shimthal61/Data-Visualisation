messy_graph <- mpg %>%
  #Change our x varible labels to title case
  mutate(manufacturer = str_to_title(manufacturer)) %>%
  #Specify our axis
  ggplot(aes(x = manufacturer, y=cty)) +
  #'Jittering' our points so they're not stacked vertically
  geom_jitter(width = .2, alpha = .75, size = 2) +
  #Specify the format of our plot
  geom_point() + 
  #Rotate the x axis labels and move them down
  theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = .5)) + 
  #Making our font size larger
  theme(text = element_text(size = 13)) +
  #Adding a title and changing the labels of our axis to make it clearer
  labs(title = "City Fuel Economy by car Manufacturer",
       x = "Manufacturer",
       y = "City Fuel Economy (mpg)")

boring_summarised <- mpg %>%
  mutate(manufacturer = str_to_title(manufacturer)) %>%
  ggplot(aes(x = manufacturer, y = cty)) + 
  #Adding the mean and defining the colour and size
  stat_summary(fun.data = mean_cl_boot, colour = "black", size = 1) +
  #This is a minimalist theme with no background annotations
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = .5)) + 
  theme(text = element_text(size = 13)) +
  labs(title = "City Fuel Economy by car Manufacturer",
       x = "Manufacturer",
       y = "City Fuel Economy (mpg)")

coloured_summarised <- mpg %>%
  mutate(manufacturer = str_to_title(manufacturer)) %>%
  #Reorder the values on our x variable in order of mean and adding colour
  ggplot(aes(x = fct_reorder(manufacturer, .fun = mean, cty), y = cty,
             colour = manufacturer)) +
  #Adds confidence intervals and mean to our data
  stat_summary(fun.data = mean_cl_boot, size = 1) +
  geom_jitter(alpha = .25) +
  theme_minimal() +
  theme(text = element_text(size = 13)) +
  labs(title = "City Fuel Economy by car Manufacturer",
       x = "Manufacturer",
       y = "City Fuel Economy (mpg)") +
  guides(colour = 'none') +
  #Flips the axis around
  coord_flip()

mpg %>%
  #Remove 'suv' from our mpg dataset
  filter(class != "suv") %>%
  mutate(class = str_to_title(class)) %>%
  ggplot(aes(x = displ, y = cty, colour = class)) +
  geom_jitter(width = .2) +
  #Add a grey background and white gridlines
  theme_grey() +
  theme(text = element_text(size = 13)) +
  labs(title = "City Fuel Economy by Engine Displacement",
       x = "Engine Displacement (litres)",
       y = "City Fuel Economy (mpg)") +
  guides(colour = 'none') +
  #Shows individual plots for each of our mpg classes
  facet_wrap(~ class)
  
  
