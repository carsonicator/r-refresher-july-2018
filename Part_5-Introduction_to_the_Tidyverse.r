######################################
### Part 5: Intro to the Tidyverse ###
######################################
##
#

# What is the tidyverse?
#
# "The tidyverse is a set of packages that work in harmony because they share common data
# representations and API design. The tidyverse package is designed to make it easy to
# install and load core packages from the tidyverse in a single command." - Hadley Wickham
#
# Tidyverse for beginners cheatsheet:
# https://datacamp-community.s3.amazonaws.com/e63a8f6b-2aa3-4006-89e0-badc294b179c
#

### dplyr for Data Manipulation ###
#
# This exercise will focus mainly on the dplyr package for data manipulation
#
# Install library if necessary
#install.packages("dplyr")

# Load library
library(dplyr)


# This package use six functions called verbs:
#  * mutate()
#  * select()
#  * filter()
#  * summarize()
#  * arrange()
#  * group_by()
#
# These verbs are separated by a pipe symbol, %>% (COMMAND + Shift + M)
#
# Each verb takes input from the verb before the preceding pipe symbol
#
# In this section, we will be looking at the gapminder dataset. gapminder contains life
# expectancy, the population size, and the GDP percapita for countries around the world. This
# data has been collected in five-year increments.

# Install library if necessary
#install.packages("gapminder")

# Load library
library(gapminder)

# Let's start by looking at the whole dataset
gapminder

# Now just the data for 2002
gapminder %>%
  filter(year == 2002)

# Now just the life expectancy of every country in 2002
gapminder %>%
  filter(year == 2002) %>%
    select(lifeExp)

# Now just the life expectancy in the United States in 2002
gapminder %>%
  filter(year == 2002, country == "United States") %>%
    select(lifeExp)

# Mean life expectancy by country in 1997
gapminder %>%
  filter(year == 1997) %>%
    group_by(country) %>%
      summarize(mean_lifeExp = mean(lifeExp)) 

# Mean life expectancy by continent in 1997, ordered from highest to lowest
gapminder %>%
  filter(year == 1997) %>%
  group_by(continent) %>%
  summarize(mean_lifeExp = mean(lifeExp)) %>% 
  arrange(desc(mean_lifeExp))

# Mean life expectancy by continent and year
gapminder %>%
  group_by(year, continent) %>%
  summarize(mean_lifeExp = mean(lifeExp))

# Mean life expectancy by continent and year
gapminder %>%
  filter(year == 1997) %>%
  group_by(continent) %>%
  mutate(mean_lifeExp = mean(lifeExp)) %>% 
    arrange(desc(mean_lifeExp))


#######################
# Complete Exercise 6 #
#######################


#######################
# Complete Exercise 7 #
#######################
