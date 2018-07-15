# Exercise 6
#
# Time: 15 minutes

# In Part 3 today, we saw how to subset data from the iris dataset using base R.
# Now let's try to get the same results using the dplyr package.

# 1) Let's analyze just the petal widths of the versicolor species in 'iris'. We can
#    create a new data frame by extracting a subet of all versicolor records,...

# Base R:
versicolor <- iris[iris$Species == 'versicolor',]
versicolor

# dplyr:



# 2) ...then create a numeric vector of versicolor petal widths, or...

# Base R:
versicolor_pw <- versicolor$Petal.Width
versicolor_pw

# dplyr:



# 3) ...do the same thing all in one line

# Base R:
versicolor_pw <- iris[iris$Species == 'versicolor', 'Petal.Width']
versicolor_pw

# dplyr:



# 4) Simple statistics on versicolor_pw:

# Base R:
versicolor_pw <- iris[iris$Species == 'versicolor', 'Petal.Width']
mean(versicolor_pw)
median(versicolor_pw)
var(versicolor_pw)
sd(versicolor_pw)

# dplyr (start with the complete iris dataset):




# 5) Do all statistical summaries in question 4 for each species in one data frame (start with the complete iris dataset):
