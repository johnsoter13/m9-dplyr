# Exercise 2: Data Frame Practice with `dplyr`.
# Use a different appraoch to accomplish the same tasks as exercise-1

# Install devtools package: allows installations from GitHub
#install.packages('devtools')

# Install "fueleconomy" package from GitHub
#devtools::install_github("hadley/fueleconomy")
install.packages("dplyr")

# Require/library the fueleconomy package
library(fueleconomy)

# You should have have access to the `vehicles` data.frame


# Create a data.frame of vehicles from 1997
vehicles.1997 <- filter(vehicles, year == 1997)

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
unique(vehicles.1997$year)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
cars.with.20mpg <- filter(vehicles, drive == '2-Wheel Drive', cty > 20)

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
cars.with.worst.mpg <- filter(cars.with.20mpg, hwy == min(hwy))
car <- select(cars.with.worst.mpg, id)

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
MakeYearFilter <- function(year1, make1) {
  filtered <- filter(vehicles, make == make1, year == year1) 
  filtered <- filter(filtered, hwy == max(hwy))
  return (filtered)
}

# What was the most efficient honda model of 1995?
MakeYearFilter('Honda', 1995)

