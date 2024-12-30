library(tidyverse)
library(zoo)
library(slider)
library(gtExtras)


View(lakers) #dataset comes with lubridate package which is included in tidyverse



#subset the data for Kobe Bryant -- game date and total points only

kobe <- 
  lakers %>% 
  select(date, player, points) %>% 
  filter(player == "Kobe Bryant") %>% 
  group_by(date) %>% 
  summarise(total_points = sum(points))

#display the first 6 rows
head(kobe)                 

#change the date format to year-month-day for readability using lubridate ymd
kobe <- kobe %>% 
  mutate(date = ymd(date))

#display the first 6 rows
head(kobe)     

#tidyverse cumsum
#zoo rollapply etc  k = Inf for cumulative
#slider slide_dbl(.before = inf, .after = inf)

#RUNNING TOTALS

kobe %>% 
  mutate(
    points_to_date = cumsum(total_points),
    avg_ptd = cummean(total_points),
    max_ptd =cummax(total_points),
    min_ptd = cummin(total_points),
    prod_ptd = cumprod(total_points)
    ) %>% 
  gt() %>% 
  gt_theme_dark()




#ROLLING TOTALS -- MOVING AVERAGES

# zoo rollapply etc.

#3 game rolling total previous 2 plus current
kobe %>% 
  mutate(points_to_date = rollapply(
                                    total_points,
                                    width = 3, #window size
                                    FUN = sum, #function to apply
                                    fill = NA, #fill empty values left/right/within 
                                    align = "right") #window direction **
                                            ) %>% 
  gt() %>% 
  gt_theme_dark()
#** with width 3:
# right will give you 2 preceding and current -- 2 NAs at top
# left will give you current and 2 following -- 2 NAs at bottom
#center will give current plus one preceding and one following -- 1 NA at top 1 at bottom

# or
kobe %>% 
  mutate(points_to_date = rollsum(  
    total_points,
    k = 3,  #window size
    fill = NA,
    align = "right") #switch left right center
  ) %>% 
  gt() %>% 
  gt_theme_dark()

#other rolls: max, mean, median  can all be used with rollapply
# no rollmin

kobe %>% 
  mutate(ptd = rollmax(
    total_points,
    k = 3,  #window size
    fill = NA,
    align = "center") #switch left right center
  ) %>% 
  gt() %>% 
  gt_theme_dark()


#slider slide

kobe %>% 
  mutate(ptd = slide_dbl(
    total_points,
    ~ sum(.x),
    .before = 2,
    .complete = TRUE)  #NAs or FALSE complete without NAs
  ) %>% 
  gt() %>% 
  gt_theme_dark()


#switch mean median max after etc.


#Use slider when you need:
  
#  1. Tidyverse-style syntax.
#  2. Flexible, asymmetric, or centered rolling windows.
#  3. Better control over incomplete windows.

#  Use rollapply when you need:
  
#  1. High performance for large datasets.
# 2.  Simplicity in rolling calculations.
#3.   Support for irregularly spaced data.
