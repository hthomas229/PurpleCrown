library(tidyverse)


my_products <-  tibble(
  product_id = c("A100", "B100", "C100", "D100"),
  product_name  = c("Red Balloon", "Blue Balloon", "Yellow Balloon", "Black Balloon"),
  product_price = c(1.99, 1.99, 2.49, 3.99)
)

my_products

my_orders <-  tibble(
  order_id = c(1, 2, 3, 4, 5),
  product_id = c("A100", "B100", "C100", "A100", "C100"),
  quantity = c(5, 4, 4, 3, 5)
)

my_orders

#you are tasked to find the order total for each order but price and
#quantity are on different tables

#see all entries from left that have corresponding entries in the right
result_inner <- inner_join(my_products, my_orders, by = "product_id")

result_inner

#now we can get an order total
result_inner %>% 
  mutate(order_total = product_price * quantity)

#now your task is to find all balloon types and prices even if they
#have no orders

#see all from left 
#see all products even if they have no orders (see:  anti-join)
result_left <- left_join(my_products, my_orders, by = "product_id")
result_left

#right join in this case is equivalent to inner
#in my experience it is best to use left and switch tables
#see all from right
result_right <- right_join(my_products, my_orders, by = "product_id")
result_right


## anti and semi join functions are not native functions in SQL
## and Pandas.  you can create them using subqueries and/or custom functions.

#task: get only unique products ordered and their prices

#see right only that have corresponding left
#see products that have been ordered
result_semi <- semi_join(my_products, my_orders, by = "product_id")
result_semi

#task getting name and price of products with no orders only

#see left only that have no corresponding right
#see products with no orders
result_anti <- anti_join(my_products, my_orders, by = "product_id")
result_anti 


#task: show everything from both tables

result_full <- full_join(my_products, my_orders, by = "product_id")
result_full

#crossjoin 


# DataFrame for balloon colors
balloons <- tibble(color = c("red", "blue", "green"))

# DataFrame for possible sizes
sizes <- tibble(size = c("small", "medium", "large"))

#Cross join gives you the Cartesion product between 2 dataframes. 
#A combination of every row from one table with every row from the other table.

#We can use a simplified dataframe to better illustrate this.

# Dataframe for balloon colors
balloons <- tibble(color = c("red", "blue", "green"))

balloons


# Datarrame for possible sizes
sizes <- tibble(size = c("small", "medium", "large"))

sizes

# Perform a cross join to get all color-size combinations

color_combinations <- balloons %>%
  crossing(sizes)

color_combinations
