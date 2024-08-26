 #  *** 100 StarWars tidyverse Puzzles  ***

#   *** MAY THE FORCE BE WITH YOU  ***

# Requires the following:

install.packages("tidyverse")
library(tidyverse)

# Optional tables package

install.packages(("gtExtras"))
require(gtExtras)

# for cool tables install gtExtras and pipe this into your code:
gt() %>% 
gt_theme_guardian() # or other themes


# 1.  Display the entire starwars dataset.



# 2.  View the starwars dataset in the viewer.



# 3.  Display the first few rows of the dataset.



# 4.  Display the last 5 rows of the dataset.



# 5.  Get a snapshot of the dataset column names,  
#     data types and first few rows.



# 6.  Select rows 6 through 10 of the dataset.



# 7.  Select a random sample of 10 rows.



# 8. Select the rows with the 5 tallest characters.




# 9.  Show all the column names in the dataset.



# 10. Extract the eye_color column.



# 11. Rename the mass column weight.



# 12. Switch the order of the hair and skin color columns.



# 13. Get a list of unique skin colors.




# 14. Select the name and species columns from the dataset.


# 15.  Select the name through species columns.



# 16. Select the name through mass columns and the homeworld
#     column.


# 17. Select all columns except vehicles and starships.



# 18. Select Species first and then include all the other columns.


# 19. Select all columns that start with the word "birth":
  


# 20. Select all columns that end with the letter "r":



# 21. Select all columns whose header includes the word color.



# 22. Select column names that begin with hair or skin.




# 23. Select name, species and homeworld and sort by species.


# 24. Select name, species and homeworld and sort by species then homeworld.



# 25. Select name, species and mass and sort by mass descending.


# 26. Select name, homeworld and mass and sort by homeworld ascending and mass
# descending. 



# 27. Select name, homeworld and species where the species is 
#     Gungan



# 28. Select name, homeworld species where the homeworld is Naboo
#     and the species is Human.



# 29. Select name, homeworld species where the homeworld is Endor
#     or the species is Droid.



# 30. Select name, skin color, species where the skin colOr is 
#     grey, pale or tan.


# 31. Select name and height of characters whose height is  > = 188 cm'


# 32. Find all characters whose mass is between 15 and 40 and sort by
#     mass from largest to smallest.



# 33. Find characters whose mass is greater than the mean mass.
#     Sort by mass descending.



# 34. Select characters who have no homeworld listed.



# 35. Find all character whose Species name includes the substring "ookie"



# 36. Create a new column that joins species and homeworld.
#     Separate them with a colon.

starwars %>% 



# 37. Combine the name and homeworld columns into a single
#     column called name_homeworld, separated by a hyphen (-):



# 38. Make a first name column. Hint:  Use a regular expression.




# 39. Make first and last name columns. If the character has more than
#     2 names  concatenate the extra names as one string. If only one name, 
#     leave last name as NA.




# 40. Take all droids and split them into 2 columns, one for unit and one for 
#     model number e.g Model R2 Unit D2




# 41. Extract the last word in the name column as last name


# 42.  Find all names that end with a vowel.




# 43. Find the homeworld(s) that start with K.





# 45. Select name, height and mass and convert the height column 
#     from centimeters to meters and save the dataset as anewhope.



# 46. Make a BMI column in anewhope. The formula for Body Mass Index
#     divide the mass in kilograms by the height in meters squared.



# 47. Count the number of characters from each homeworld and sort descending.


# 48. Count the number of characters from each species who have 
#     mass greater than 60




# 49. Create a simple histogram plot for height




# 50. Create a simple scatter plot for height and mass.  Guess
#   who the mass outlier is?




# JABBA THE HUTT
  
  

# 51. Calculate the average height for characters from each species.




# 52. Calculate the median mass for characters from each homeworld.



# 53. Find the maximum height for each eye color.



# 54. Filter out na for hair color, use birth year as age and group by age and summmarize
#     by minimum age for each hair color ignoring nulls.



# 55. Calculate the median height and mass for each species,
#     and add a column to show the difference between the median height and mass. 




# 56. Count the number of characters and the proportion of
#     each gender within each species.



# 56. Identify the top 3 most frequent species
#     and calculate the average height and mass for characters in these species.



# 57. Calculate the standard deviation of mass
#     for each species that has more than 2 characters.



# 58. Select name, mass and species and calculate the normalized mass
#     for all  species in a new column. Normalized mass = mass/mean(mass).




# 59. Select name, mass and species and calculate the normalized mass
#   for each species in a new column.



# 60. Add a column showing the mass of the character in the next row.
#     Arrange by mass name.


# 61. Add a column showing the mass of the character in the preceding row

 

  
# 62. Add a column ranking all characters by birth year as age_rank with no
#     skipped or repeating ranks.



# 63. Add a column ranking all characters by birth year as age_rank with ties and
#     skipped ranks.



# 64. Add a column ranking all characters by birth year as age_rank with ties
#     and no skipped ranks.




# 65. Rank all characters by mass grouped by homeworld with ties and skips.




# 66. Add a new column 'height_quartile' with quartile categorization.
#     Group by homeworld. Include name, height and homeworld.



#  67.  Add a new column age_percent rank showing percent rank by age partitioned
#       by species.



# 68. Calculate the running total of the mass column in a new
#     dataset called empirestrikesback. Then display empirestrikesback.





# 69. Show the distinct values in the eye color column.



# 70. Replace unknown values in the eye color column with the next preceding
#     non unknown color.



    
# 71. Select name height film where species is human and film is "The Force
#     Awakens".  Add a column that replaces the na heights with average height.




# 72. Create a dataset with a column for the character name and separate columns
#     for each film. Call it returnofthejedi


 
# 73.`Create a new dataset called aphantommenace and change the datatype
#     of species from character to  factor.  Glimpse aphantommenaace to
#     show your change.
    


# 74. Display the values in the species factor.



# 75. Create a bar plot showing count of characters by species.


# 76. Reorder the species factors so the bar plot shows them in 
#     in frequency order highest to lowest.



# 77. Group all species factors except Human, Droid and Gungan into 
#     a factor named Other and display the count of characters by species. 




# 78. Create a new dataset called  attackoftheclones. Calculate year of birth 
#     if the character were alive today. Show character name and year of birth.






# 79. Add a column to attackoftheclones called birthday.
#     Make all birthdays May the 4th in the year they were born.

# Display the result

  

# 80. Add a random number of days between 1 and 100 to birthday to et a 
#     column of different birthdays.


          
# 81. Add a month name column



# 82, Add weekday name



# 83. Add a column showing difference in days between one name and the next in days
  # order by year_of_birth 



# 84. Create a point plot for mass v. height with point color set to species.
#     Filter out Jabba. Use the minimal theme.




# 85. Add a smooth layer.



# 86. Take off smooth and add a small chart for each species.



# 87. Using birth_year as age create a histogram with a for all
#     characters less than 200 years old.



# 88. Plot the height distribution of characters and add a density curve.


# 89. Change species to 3 factors and other and create a 
#     box plot of height distribution by species.



# 90. Add jittered points to your plot.

 

# 91. Add a violin plot




# 92. Add a dot plot.



# 93. Create a line plot with markers for average height by age.



# 94. Create a stacked bar plot showing count of characters by
#     gender within species.





# 95. Create an area plot of the average mass of species over time
#     using birth_year as age.




# 96. Create a dot plot showing character height distribution by gender.



# 97. Calculate the Z-score (standard score) of character 
#     heights within each species. This tells you how many standard deviations a character's
#     height is from the mean height of their species.



# 98. Perform a linear regression analysis to predict
#     a character's height based on their mass. This can give
#     insights into the relationship between these two variables.


  
# 99. Plot the linear regression.

# Filter out NA values

# Plotting the linear regression



#   100.  Create a while loop to print "This is the way"
#         10 times and then print congratulations.



#               ***  THIS IS THE WAY   ***



