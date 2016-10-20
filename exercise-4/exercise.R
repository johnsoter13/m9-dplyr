# Exercise 4: DPLYR and flights data

# Install the nycflights13 package and read it in.  Require the dplyr package
#install.packages("nycflights13")
#library(nycflights13)
#library(dplyr)

# The data.frame flights should now be accessible to you.  View it, 
# and get some basic information about the number of rows/columns


# Add a column that is the amount of time gained in the air (`arr_delay` - `dep_delay`)
flights <- mutate(flights, TG = arr_delay - dep_delay)

# Sort your data.frame desceding by the column you just created
flights <- arrange(flights, -TG)

# Try doing the last 2 steps in a single operation using the pipe operator
flights <- mutate(flights, TG = arr_delay - dep_delay) %>% arrange(-TG)

# Make a histogram of the amount of gain using the `hist` command
hist(flights$TG)

# On average, did flights gain or lose time?
mean(flights$TG, na.rm = TRUE)

# Create a data.frame that is of flights headed to seatac ('SEA'), 
seatac <- filter(flights, dest == 'SEA')

# On average, did flights to seatac gain or loose time?
mean(seatac$TG, na.rm = TRUE)
### Bonus ###
# Write a function that allows you to specify an origin, a destination, and a column of interest
# that returns a data.frame of flights from the origin to the destination and only the column of interest
## Hint: see slides on standard evaluation
DestInterest <- function(my_origin, my_dest, interest) {
  new <- filter(flights, origin == my_origin, dest == my_dest) %<%
         select(interest)
  return (new)
}

# Retireve the air_time column for flights from JFK to SEA
jfk.to.sea <- DestInterest('JFK', 'SEA', 'air_time')

# What was the average air time of those flights (in hours)?  
mean(jfk.to.sea, na.rm = TRUE)

# What was the min/max average air time for the JFK to SEA flights?
min(jfk.to.sea, na.rm = TRUE)
max(jfk.to.sea, na.rm = TRUE)