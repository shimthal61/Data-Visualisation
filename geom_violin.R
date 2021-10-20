library(tidyverse, NHANES)

#See the number of columns in the dataset
ncol(NHANES)
#See the number of rows in the dataset
nrow(NHANES)

NHANES %>%
  select(ID) %>%
  #Work out the number of distinct IDs
  n_distinct()

#Making a new tibble without duplicate individuals  
NHANES_tidied <- NHANES %>%
  distinct(ID, .keep_all = TRUE)

NHANES_tidied %>%
  ggplot(aes(x = BMI)) +
  geom_histogram(bins = 100, fill = "black", na.rm = TRUE) +
  theme_minimal() +
  labs(title = "Histogram of BMI",
       y = "Amount of people",
       x = "BMI")

NHANES_tidied %>%
  #Group by education
  group_by(Education) %>%
  #Summarise by the median of BMI, removing missing data points
  summarise(median = median(BMI, na.rm = TRUE)) %>%
  #Arrange it from the highest median BMI to the lowest
  arrange(-median)
  
NHANES %>%
  #Filter so we just have education and BMI 
  filter(!is.na(Education) & !is.na(BMI)) %>%
  #Add what data we want on our axis, and what we want it coloured by
  ggplot(aes(x = Education, y = BMI, colour = Education)) +
  #We want our graph to be a violin plot
  geom_violin() +
  #We 'jitter' our points so they don't fall vertically
  geom_jitter(alpha = .2, width = .1) +
  #Adding boxplots and their size
  geom_boxplot(alpha = .5) +
  #This removes our key
  guides(colour = 'none') +
  labs(title = "Examining the effect of education on BMI",
       x = "Education Type",
       y = "BMI")

NHANES_tidied %>%
  filter(!is.na(Education), !is.na(BMI) & !is.na(Diabetes)) %>%
  ggplot(aes(x = Education:Diabetes, y = BMI, colour = Education)) +
  geom_violin() +
  geom_jitter(alpha = .2, width = .1) +
  geom_boxplot(alpha = .5) +
  guides(colour = 'none') +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, vjust = 0.5)) +
  labs(title = "Examining the effect of education level on diabetes and BMI",
       x = "Education Level x Diabetes",
       y = "BMI")
  

