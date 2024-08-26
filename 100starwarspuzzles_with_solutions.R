 #  *** 100 StarWars tidyverse Puzzles  ***

#   *** MAY THE FORCE BE WITH YOU  ***

# Requires the following:
# install.packages("tidyverse")
library(tidyverse)

# 1.  Display the entire starwars dataset.

starwars

# 2.  View the starwars dataset in the viewer.

View(starwars)

# 3.  Display the first few rows of the dataset.

head(starwars)

# 4.  Display the last 5 rows of the dataset.

tail(starwars, 5)

# 5.  Get a snapshot of the dataset column names,  
#     data types and first few rows.

glimpse(starwars)

# 6.  Select rows 6 through 10 of the dataset.

slice(starwars,6:10)

# 7.  Select a random sample of 10 rows.

slice_sample(starwars,n =10)

# 8. Select the rows with the 5 tallest characters.

slice_max(starwars,height, n=5)


# 9.  Show all the column names in the dataset.

names(starwars)

# 10. Extract the eye_color column.

pull(starwars, eye_color)

# 11. Rename the mass column weight.

rename(starwars, weight = mass)

# 12. Switch the order of the hair and skin color columns.

starwars %>%
  relocate(hair_color, .after = skin_color)

# 13. Get a list of unique skin colors.

starwars %>%
  distinct(skin_color)

# 14. Select the name and species columns from the dataset.

starwars %>% 
  select(name, species)

# 15.  Select the name through species columns.

starwars %>% 
  select(name:species)

# 16. Select the name through mass columns and the homeworld
#     column.

starwars %>% 
  select(name:mass, homeworld)

# 17. Select all columns except vehicles and starships.

starwars %>% 
  select(-vehicles, -starships)

# 18. Select Species first and then include all the other columns.

starwars %>% 
  select(species, everything())

# 19. Select all columns that start with the word "birth":
  
starwars %>% 
  select(starts_with("birth"))

# 20. Select all columns that end with the letter "r":

starwars %>% 
  select(ends_with("r"))

# 21. Select all columns whose header includes the word color.

starwars %>% 
  select(contains("color"))



# 22. Select column names that begin with hair or skin.

starwars %>% 
  select(matches("^(hair|skin)"))


# 23. Select name, species and homeworld and sort by species.

starwars %>% 
  select(name, species, homeworld) %>% 
  arrange(species)

# 24. Select name, species and homeworld and sort by species then homeworld.

starwars %>% 
  select(name, species, homeworld) %>% 
  arrange(species, homeworld)

# 25. Select name, species and mass and sort by mass descending.

starwars %>% 
  select(name, species, mass) %>% 
  arrange(desc(mass))

# 26. Select name, homeworld and mass and sort by homeworld ascending and mass
# descending. 

starwars %>% 
  select(name,  homeworld, mass) %>% 
  arrange(homeworld, desc(mass))

# 27. Select name, homeworld and species where the species is 
#     Gungan

starwars %>% 
  select(name, homeworld, species) %>% 
  filter(species == "Gungan")

# 28. Select name, homeworld species where the homeworld is Naboo
#     and the species is Human.

starwars %>% 
  select(name, homeworld, species) %>% 
  filter(homeworld == "Naboo", species == "Human")

# 29. Select name, homeworld species where the homeworld is Endor
#     or the species is Droid.

starwars %>% 
  select(name, homeworld, species) %>% 
  filter(homeworld == "Endor" | species == "Droid")

# 30. Select name, skin color, species where the skin colOr is 
#     grey, pale or tan.

starwars %>%
  select(name, skin_color, species) %>%  
  filter(skin_color %in% c("grey", "pale", "tan")) 

# 31. Select name and height of characters whose height is  > = 188 cm'

starwars %>%
select(name, height) %>%       
  filter(height >= 188)     

# 32. Find all characters whose mass is between 15 and 40 and sort by
#     mass from largest to smallest.

starwars %>%
  select(name, mass) %>%       
  filter(between(mass, 15, 40)) %>% 
  arrange(desc(mass))

# 33. Find characters whose mass is greater than the mean mass.
#     Sort by mass descending.

starwars %>%
  select(name, mass) %>% 
  filter(mass > mean(mass, na.rm = TRUE)) %>% 
  arrange(desc(mass))
   


# 34. Select characters who have no homeworld listed.


starwars %>%
  select(name, homeworld) %>% 
  filter(is.na(homeworld))

# 35. Find all character whose Species name includes the substring "ookie"

starwars %>% 
  select(name, species, homeworld) %>% 
  filter(str_detect(species, "ookie"))

# 36. Create a new column that joins species and homeworld.
#     Separate them with a colon.

starwars %>% 
  select(name, homeworld, species) %>% 
  mutate(specworld = str_c(species, homeworld, sep = ":"))


# 37. Combine the name and homeworld columns into a single
#     column called name_homeworld, separated by a hyphen (-):

starwars %>%
  unite(col = "name_homeworld", name, homeworld,
        sep = " - ", na.rm = TRUE) %>% 
  select(name_homeworld) %>% 
  head(5)


# 38. Make a first name column. Hint:  Use a regular expression.

starwars %>%
  select(name) %>% 
  mutate(first_name = str_extract(name, "^[^ ]+"))


# 39. Make first and last name columns. If the character has more than
#     2 names  concatenate the extra names as one string. If only one name, 
#     leave last name as NA.

starwars %>%
  select(name) %>% 
  separate(name, into = c("first_name", "last_name"),
           sep = " ", extra = "merge", fill = "right")



# 40. Take all droids and split them into 2 columns, one for unit and one for 
#     model number e.g Model R2 Unit D2

starwars %>% 
  select(name, species) %>% 
  filter(species == "Droid") %>% 
  separate(name, into = c("Model No.", "Unit No."), sep = "-", fill = "right")


# 41. Extract the last word in the name column as last name

starwars %>%
  mutate(last_name = str_extract(name, "\\b\\w+$")) %>%
  select(name, last_name)

# 42.  Find all names that end with a vowel.

starwars %>%
  filter(str_detect(name, "[aeiouAEIOU]$")) %>%
  select(name)


# 43. Find the homeworld(s) that start with K.

starwars %>%
  filter(!is.na(homeworld)) %>%  
  filter(str_detect(homeworld, "^K")) %>%  
  select(homeworld) %>% 
  distinct() 


# 45. Select name, height and mass and convert the height column 
#     from centimeters to meters and save the dataset as anewhope.

anewhope <- starwars %>% 
              select(name, height, mass) %>% 
              mutate(height = height/100) 
              
anewhope

# 46. Make a BMI column in anewhope. The formula for Body Mass Index
#     divide the mass in kilograms by the height in meters squared.

anewhope %>% 
    mutate(BMI = mass/(height^2)) %>% 
    arrange(desc(BMI))

# 47. Count the number of characters from each homeworld and sort descending.

starwars %>% 
  count(homeworld) %>% 
  arrange(desc(n))

# 48. Count the number of characters from each species who have 
#     mass greater than 60


starwars %>%
  filter(mass > 60) %>%           
   count(species, sort = TRUE)   


# 49. Create a simple histogram plot for height

starwars %>%
  ggplot(aes(x = height)) +
  geom_histogram(binwidth = 10, fill = "blue", color = "black") +
  labs(title = "Height Distribution of Star Wars Characters")



# 50. Create a simple scatter plot for height and mass.  Guess
#   who the mass outlier is?

starwars %>%
  ggplot(aes(x = mass, y = height, color = species)) +
  geom_point(size = 5) +
  labs(title = "Mass vs Height of Star Wars Characters",
       x = "Mass (kg)",
       y = "Height (cm)") +
  theme_dark()  

# JABBA THE HUTT

# 51. Calculate the average height for characters from each species.

starwars %>%
  group_by(species) %>%
  summarize(avg_height = mean(height, na.rm = TRUE))


# 52. Calculate the median mass for characters from each homeworld.

starwars %>%
  group_by(homeworld) %>%
  summarize(median_mass = median(mass, na.rm = TRUE))

# 53. Find the maximum height for each eye color.

starwars %>%
  group_by(eye_color) %>%
  summarize(max_height = max(height, na.rm = TRUE))

# 54. Filter out na for hair color, use birth year as age and group by age and summmarize
#     by minimum age for each hair color ignoring nulls.

starwars %>%
  select(name, birth_year, hair_color) %>%
  filter(!is.na(hair_color)) %>%
  rename(age = birth_year) %>%
  mutate(age = as.numeric(age)) %>%
  group_by(hair_color) %>%
  summarize(min_age = min(age, na.rm = TRUE))

# 55. Calculate the median height and mass for each species,
#     and add a column to show the difference between the median height and mass. 

starwars %>%
  filter(!is.na(height) & !is.na(mass)) %>%  # Remove NA values
  group_by(species) %>%
  summarize(
    median_height = median(height, na.rm = TRUE),
    median_mass = median(mass, na.rm = TRUE),
    height_mass_diff = median_height - median_mass
  )


# 56. Count the number of characters and the proportion of
#     each gender within each species.

starwars %>%
  group_by(species, gender) %>%
  summarize(
    count = n(),
    proportion = count / sum(count)
  ) %>%
  ungroup()  

# 56. Identify the top 3 most frequent species
#     and calculate the average height and mass for characters in these species.

starwars %>%
  group_by(species) %>%
  filter(!is.na(height) & !is.na(mass)) %>%
  summarize(count = n()) %>%
  top_n(3, count) %>%
  select(species) %>%
  inner_join(starwars, by = "species") %>%
  group_by(species) %>%
  summarize(
    avg_height = mean(height, na.rm = TRUE),
    avg_mass = mean(mass, na.rm = TRUE)
  )


# 57. Calculate the standard deviation of mass
#     for each species that has more than 2 characters.

starwars %>%
  filter(!is.na(mass)) %>%
  group_by(species) %>%
  filter(n() > 2) %>%
  summarize(
    sd_mass = sd(mass, na.rm = TRUE)
  )

# 58. Select name, mass and species and calculate the normalized mass
#     for all  species in a new column. Normalized mass = mass/mean(mass).

starwars %>%
  select(name, mass, species) %>%
  mutate(mass_norm = mass / mean(mass, na.rm = TRUE))



# 59. Select name, mass and species and calculate the normalized mass
#   for each species in a new column.

starwars %>%
  select(name, mass, species) %>%
  group_by(species) %>%
  mutate(mass_norm = mass / mean(mass, na.rm = TRUE))

# 60. Add a column showing the mass of the character in the next row.
#     Arrange by mass name.

starwars %>%
  select(name, mass) %>%         
  arrange(name) %>%              
  mutate(next_mass = lead(mass)) 

# 61. Add a column showing the mass of the character in the preceding row

starwars %>%
  select(name, mass) %>%         
  arrange(mass) %>%              
  mutate(previous_mass = lag(mass))  

  
# 62. Add a column ranking all characters by birth year as age_rank with no
#     skipped or repeating ranks.

starwars %>%
  select(name, birth_year) %>%   
  arrange(desc(birth_year)) %>%  
  mutate(age_rank = row_number()) 

# 63. Add a column ranking all characters by birth year as age_rank with ties and
#     skipped ranks.

starwars %>%
  select(name, birth_year) %>%   
  arrange(desc(birth_year)) %>%  
  mutate(age_rank = rank(-birth_year, ties.method = "min")) 

# 64. Add a column ranking all characters by birth year as age_rank with ties
#     and no skipped ranks.

starwars %>%
  select(name, birth_year) %>%   
  arrange(desc(birth_year)) %>%  
  mutate(age_rank = dense_rank(desc(birth_year)))


# 65. Rank all characters by mass grouped by homeworld with ties and skips.

starwars %>%
  select(name, mass, homeworld) %>%   # Select relevant columns
  arrange(homeworld, desc(mass)) %>%  # Arrange by homeworld and mass in descending order
  group_by(homeworld) %>%             # Group data by homeworld
  mutate(mass_rank = rank(-mass, ties.method = "min")) 


# 66. Add a new column 'height_quartile' with quartile categorization.
#     Group by homeworld. Include name, height and homeworld.

starwars %>%
  select(name, height, homeworld) %>%   
  group_by(homeworld) %>% 
  mutate(height_quartile = ntile(height, 4)) %>%  
  arrange(homeworld, height_quartile)

#  67.  Add a new column age_percent rank showing percent rank by age partitioned
#       by species.

starwars %>%
  select(name, birth_year, species) %>% 
  filter(!is.na(birth_year)) %>%  # Filter out rows where birth_year is NA
  group_by(species) %>% 
  mutate(age_perc_rank = percent_rank(birth_year)) %>%  # Calculate percentile rank
  arrange(species, age_perc_rank) %>% 
  View()

# 68. Calculate the running total of the mass column in a new
#     dataset called empirestrikesback. Then display empirestrikesback.

empirestrikesback <- starwars %>%
  select(name, mass) %>%         # Select relevant columns
  arrange(mass) %>%              # Arrange data by 'mass'
  mutate(running_total_mass = cumsum(mass))  # Calculate running total of 'mass'

empirestrikesback

# 69. Show the distinct values in the eye color column.
starwars %>% 
  distinct(eye_color)


# 70. Replace unknown values in the eye color column with the next preceding
#     non unknown color.

starwars %>%
  select(name, eye_color) %>% 
  mutate(eye_color = na_if(eye_color, "unknown")) %>% 
  fill(eye_color, .direction = "down")#

    
# 71. Select name height film where species is human and film is "The Force
#     Awakens".  Add a column that replaces the na heights with average height.
starwars %>%
  select(name, species, height, films) %>%
  filter(species == "Human", map_lgl(
              films, ~ "The Force Awakens" %in% .)) %>%
  arrange(desc(height)) %>%
  mutate(filled_height = 
           ifelse(is.na(height), 
           mean(height, na.rm = TRUE), height))



# 72. Create a dataset with a column for the character name and separate columns
#     for each film. Call it returnofthejedi

returnofthejedi <- starwars %>%
           select(name, films) %>%
           # Unnest the films list into separate rows
           mutate(films_list = map(films, ~ unlist(.x))) %>%
           unnest(films_list) %>%
           distinct() %>%
           # Pivot wider to create a separate column for each film
           pivot_wider(
             names_from = films_list, 
             values_from = films_list, 
             values_fill = list(films_list = NA)  # Use NA for missing values
           )

# Display the result
  returnofthejedi
 
# 73.`Create a new dataset called aphantommenace and change the datatype
#     of species from character to  factor.  Glimpse aphantommenaace to
#     show your change.
    
aphantommenace <- starwars %>%
    mutate(species = as_factor(species))

glimpse(aphantommenace)

# 74. Display the values in the species factor.

levels(aphantommenace$species)

# 75. Create a bar plot showing count of characters by species.

starwars %>% 
  ggplot(aes(species)) +
  geom_bar()

# 76. Reorder the species factors so the bar plot shows them in 
#     in frequency order highest to lowest.

starwars %>%
  filter(!is.na(species)) %>% 
  ggplot(aes(fct_infreq(species))) +
  geom_bar()

# 77. Group all species factors except Human, Droid and Gungan into 
#     a factor named Other and display the count of characters by species. 

starwars %>% 
  filter(!is.na(species)) %>% 
  mutate(species = fct_lump(species, n = 3)) %>% 
  count(species)


# 78. Create a new dataset called  attackoftheclones. Calculate year of birth 
#     if the character were alive today. Show character name and year of birth.


current_year <- as.numeric(format(Sys.Date(), "%Y"))

attackoftheclones <- starwars %>%
  select(name, birth_year) %>%
  filter(!is.na(birth_year)) %>%
  mutate(
    birth_year = as.numeric(birth_year),
    year_of_birth = current_year - birth_year
  ) %>%
  select(name, year_of_birth)

# Display the result
attackoftheclones



# 79. Add a column to attackoftheclones called birthday.
#     Make all birthdays May the 4th in the year they were born.

attackoftheclones <- 
  attackoftheclones %>%
  select(name, year_of_birth) %>%
  mutate(
    year_of_birth = as.numeric(year_of_birth),
    birthday =  make_date(year = year_of_birth, month = 5, day = 4)
  )
# Display the result
attackoftheclones

# 80. Add a random number of days between 1 and 100 to birthday to et a 
#     column of different birthdays.

attackoftheclones <- 
  attackoftheclones %>%
  select(name, birthday) %>%
  mutate(new_birthday = birthday + days(sample(1:100, n(), replace = TRUE)))
  
attackoftheclones
          
# 81. Add a month name column

attackoftheclones <- 
  attackoftheclones %>%
  mutate(month_name = month(new_birthday, label = TRUE, abbr = FALSE))

attackoftheclones

# 82, Add weekday name

attackoftheclones <- 
  attackoftheclones %>%
  mutate(weekday_name = wday(new_birthday, label = TRUE, abbr = FALSE))

attackoftheclones

# 83. Add a column showing difference in days between one name and the next in days
  # order by year_of_birth 

attackoftheclones <- 
  attackoftheclones %>%
  mutate(new_birthday = as.Date(new_birthday)) %>%
  arrange(new_birthday) %>% 
  mutate(
       diff_days = lead(new_birthday) - new_birthday
  )

attackoftheclones

# 84. Create a point plot for mass v. height with point color set to species.
#     Filter out Jabba. Use the minimal theme.


starwars %>% 
  filter(!is.na(height), !is.na(mass), species != "Hutt") %>% 
  ggplot(aes(mass,height,col = species)) +
  geom_point() +
  theme_minimal()

# 85. Add a smooth layer.

starwars %>% 
  filter(!is.na(height), !is.na(mass), species != "Hutt") %>% 
  ggplot(aes(mass,height,col = species)) +
  geom_point() +
  geom_smooth() +
  theme_minimal()

# 86. Take off smooth and add a small chart for each species.

starwars %>% 
  filter(!is.na(height), !is.na(mass), species != "Hutt") %>% 
  ggplot(aes(mass,height,col = species)) +
  geom_point() +
  facet_wrap(~species) +
  theme_minimal()

# 87. Using birth_year as age create a histogram with a for all
#     characters less than 200 years old.

starwars %>% 
  filter(!is.na(birth_year), birth_year < 200) %>% 
  ggplot(aes(birth_year)) +
  geom_histogram(binwidth = 5, fill = "limegreen", color = "black", alpha = 0.7) +  
  theme_classic() +
  labs(title = "Histogram of Birth Years", x = "Birth Year", y = "Count")

# 88. Plot the height distribution of characters and add a density curve.

starwars %>% 
  filter(!is.na(height)) %>%  
  ggplot(aes(x = height)) +
  geom_histogram(aes(y = ..density..),
                 binwidth = 5, fill = "yellow",
                 color = "black", alpha = 0.7) +  
  geom_density(color = "purple", size = 1) +  
  theme_classic() +
  labs(title = "Distribution of Heights in Star Wars", 
       x = "Height (cm)", 
       y = "Density")

# 89. Change species to 3 factors and other and create a 
#     box plot of height distribution by species.

starwars %>%
  filter(!is.na(height), !is.na(species)) %>% 
  mutate(species = fct_lump_n(species, n = 3, other_level = "Others")) %>% 
  ggplot(aes(x = species, y = height, fill = species)) +
  geom_boxplot() +  
  theme_classic() +
  labs(title = "Boxplot of Heights by Species in Star Wars", 
       x = "Species", 
       y = "Height (cm)") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) 

# 90. Add jittered points to your plot.

starwars %>%
  filter(!is.na(height), !is.na(species)) %>% 
  mutate(species = fct_lump_n(species, n = 3, other_level = "Others")) %>% 
  ggplot(aes(x = species, y = height, fill = species)) +
  geom_boxplot() +  
  geom_jitter(width = 0.2, size = 2, color = "black", alpha = 0.5) +
  theme_classic() +
  labs(title = "Boxplot of Heights by Species in Star Wars", 
       x = "Species", 
       y = "Height (cm)") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) 

# 91. Add a violin plot

starwars %>%
  filter(!is.na(height), !is.na(species)) %>% 
  mutate(species = fct_lump_n(species, n = 3, other_level = "Others")) %>% 
  ggplot(aes(x = species, y = height, fill = species)) +
  geom_violin(alpha = 0.5) +
  geom_boxplot() +  
  theme_classic() +
  labs(title = "Boxplot of Heights by Species in Star Wars", 
       x = "Species", 
       y = "Height (cm)") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) 


# 92. Add a dot plot.

starwars %>%
  filter(!is.na(height), !is.na(species)) %>% 
  mutate(species = fct_lump_n(species, n = 3, other_level = "Others")) %>% 
  ggplot(aes(x = species, y = height, fill = species)) +
  geom_boxplot() +  
  geom_dotplot(binaxis = 'y', stackdir = 'center', dotsize = 0.5, alpha = 0.5) + 
  theme_classic() +
  labs(title = "Boxplot of Heights by Species in Star Wars", 
       x = "Species", 
       y = "Height (cm)") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) 


# 93. Create a line plot with markers for average height by age.

starwars %>%
  filter(!is.na(height), !is.na(birth_year)) %>%
  group_by(birth_year) %>%
  summarize(
    avg_height = mean(height, na.rm = TRUE),
    .groups = 'drop'
  ) %>% 
  ggplot(aes(x = birth_year, y = avg_height)) +
  geom_line(color = "darkblue", size = 1.2) +  # Line with a bold color
  geom_point(color = "orange", size = 4, shape = 21, fill = "red") +  # Bright markers
  labs(title = "Average Height of Characters by Age",
       x = "Age",
       y = "Average Height") +
  theme_minimal()  

# 94. Create a stacked bar plot showing count of characters by
#     gender within species.

starwars %>%
  filter(!is.na(gender), !is.na(species)) %>%  # Filter out missing values
  ggplot(aes(x = species, fill = gender)) +
  geom_bar(position = "stack") +
  labs(title = "Stacked Bar Plot of Characters by Gender and Species",
       x = "Species",
       y = "Count",
       fill = "Gender") +
  theme_classic()



# 95. Create an area plot of the average mass of species over time
#     using birth_year as age.

starwars %>%
  filter(!is.na(mass), !is.na(species), !is.na(birth_year)) %>%
  group_by(birth_year, species) %>%
  summarize(avg_mass = mean(mass, na.rm = TRUE)) %>%
  ggplot(aes(x = birth_year, y = avg_mass, fill = species)) +
  geom_area(alpha = 0.5, position = "stack") +
  labs(title = "Average Mass of Characters by Species Over Time",
       x = "Birth Year",
       y = "Average Mass",
       fill = "Species") +
  theme_classic()


# 96. Create a dot plot showing character height distribution by gender.

starwars %>%
  filter(!is.na(height)) %>%  
  ggplot(aes(x = height, fill = gender)) +
  geom_dotplot(binwidth = 10, dotsize = 1.2, stackdir = "up") +  # Dot plot with custom color and stacking direction
  labs(title = "Distribution of Character Heights by Gender",
       x = "Height",
       y = "Count") +
  theme_dark() +
  scale_fill_brewer(palette = "YlOrBr")

# 97. Calculate the Z-score (standard score) of character 
#     heights within each species. This tells you how many standard deviations a character's
#     height is from the mean height of their species.

starwars_zscores <- starwars %>%
  filter(!is.na(height)) %>% 
  group_by(species) %>%
  mutate(
    height_zscore = (height - mean(height, na.rm = TRUE)) / sd(height, na.rm = TRUE)
  ) %>%
  ungroup()

starwars_zscores %>%
  select(name, species, height, height_zscore) %>%
  arrange(desc(height_zscore))

# 98. Perform a linear regression analysis to predict
#     a character's height based on their mass. This can give
#     insights into the relationship between these two variables.

lm_results <- starwars %>%
  filter(!is.na(height), !is.na(mass)) %>%
  summarize(
    lm_model = list(lm(height ~ mass, data = .)),
    r_squared = summary(lm(height ~ mass, data = .))$r.squared
  )

lm_results$lm_model[[1]]  # View the linear model summary

  
# 99. Plot the linear regression.

# Filter out NA values
starwars_filtered <- starwars %>%
  filter(!is.na(height), !is.na(mass))

# Plotting the linear regression
ggplot(starwars_filtered, aes(x = height, y = mass)) +
  geom_point(color = "blue", size = 3) +  # Plot the points
  geom_smooth(method = "lm", color = "red", se = FALSE) +  # Add linear regression line
  labs(title = "Linear Regression of Mass on Height",
       x = "Height (cm)",
       y = "Mass (kg)") +
  theme_minimal()



#   100.  Create a while loop to print "This is the way"
#         10 times and then print congratulations.

count <- 1

while (count <= 10) {
  print("This is the way")
  count <- count + 1
}

"Congratulations"



#               ***  THIS IS THE WAY   ***



