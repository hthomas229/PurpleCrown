#  SELECT IN R and the tidyverse  -- THE BEST --

#for further information and examples see the dplyr vignette:  https://dplyr.tidyverse.org/

library(tidyverse)


my_products <-  tibble(
  product_id = c("A100", "B100", "C100", "D100"),
  product_name  = c("Red Balloon", "Blue Balloon", "Yellow Balloon", "Black Balloon"),
  product_price = c(1.99, 1.99, 2.49, 3.99)
)

my_products

#base R

#using column name

my_products$product_name

#using column indices

my_products[,1]

#you can use these in multiple forms but they just 
#return  vectors -- use the tidyverse instead to get a form
#more versatile for analysis

#dplyr select

# select all

my_products

# check type

class(my_products)

#use the everything helper function

my_products %>% 
  select(everything())


#select a single column

my_products %>% 
  select(product_name)

# select multiple columns
my_products %>% 
 select(product_id, product_name)

# use the : operator to select a range

 my_products %>% 
   select(product_id : product_name)
 
 #select complementary columns -- keep everything but
 
 my_products %>% 
   select(!product_price)
 
 
 #use other helper functions
 
 #  last_col()
 
my_products %>%
  select(last_col())
 
 # first_col()
 
my_products %>%
  select(first_col())
 
# starts_with()

my_products %>% 
  select(starts_with('pr'))

#ends_with

my_products %>% 
  select(ends_with('ice'))

# contains

my_products %>% 
  select(contains('nam'))

# matches()  use a regular expression -- $ is a simple one for ends with

my_products %>% 
  select(matches('rice$'))


# where(is_...) select column by type
my_products %>% 
  select(where(is.numeric))  #show dropdown for other is options


#num_range

 # Create a tibble for demonstration purposes

my_nums <- tibble::tibble(
  row_names = c("a", "b", "c"),
  `var1` = c(1, 2, 3),
  `var2` = c(4, 5, 6),
  `var3` = c(7, 8, 9)
)

my_nums

my_nums %>% 
  select(num_range('var', 1:2))


 
# order does not matter - rearrange

my_products %>% 
  select(product_name, product_id)
 
 
 

# Select with Alias - rename while selecting
 
 my_products %>% 
   select(price = product_price)

# to keep all columns use rename instead
 my_products %>% 
   rename(price = product_price)

                   
 
# index                  
                   
my_products %>% 
  select(1:2)

my_products %>% 
  select(-2)
