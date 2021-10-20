#Count histogram with facet_wrap
NHANES_tidied %>%
  #Filter dataset so we just have education and BMI
  filter(!is.na(Education) & !is.na(BMI)) %>%
  #Group by education
  group_by(Education) %>%
  #What data do we want in our plot, and which part of it coloured
  ggplot(aes(x = BMI, fill = Education)) +
  #what plot do we want
  geom_histogram() +
  #What do we want our key to be coloured
  guides(fill = 'none') +
  #Adding title and labeling axes
  labs(title = "Examining the effect of educaton level on BMI",
       x = "BMI",
       y = "Number of cases") +
  #Separate visualisations for each education level
  facet_wrap(~ Education, 
             #Each y axis scale is independent
             scales = "free")
            
#Density histogram with facet_wrap
NHANES_tidied %>%
  #Filter by education and BMI
  filter(!is.na(Education), !is.na(BMI)) %>%
  #Group by education
  group_by(Education) %>%
  #What data do we want
  ggplot(aes(x = BMI, fill = Education)) +
  #What plot do we want
  geom_histogram(aes(y = ..density..)) +
  #We want the density added as well
  geom_density(aes(y = ..density..)) +
  #Remove the key
  guides(fill = 'none') +
  labs(title = "Examining the effect of education level on BMI",
       x = 'BMI',
       y = "Number of cases") +
  facet_wrap(~ Education)
  
             