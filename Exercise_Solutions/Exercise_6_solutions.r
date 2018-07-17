# Exercise 6

# In Part 3 today, we saw how to subset data from the iris dataset using base R.
# Now let's try to get the same results using the dplyr package.

# 1) Let's analyze just the petal widths of the versicolor species in 'iris'. We can
#    create a new data frame by extracting a subet of all versicolor records,...

# Base R:
versicolor <- iris[iris$Species == 'versicolor',]
versicolor

# dplyr:
# Answer:
versicolor <- iris %>% filter(Species == 'versicolor')
versicolor_tidy


# 2) ...then create a numeric vector of versicolor petal widths...

# Base R:
versicolor_pw <- versicolor$Petal.Width
versicolor_pw

# dplyr:
# Answer:
versicolor_pw_tidy <- iris %>%
  select(Petal.Width)
versicolor_pw_tidy


# 3) ...or, do the same thing all in one line

# Base R:
versicolor_pw <- iris[iris$Species == 'versicolor', 'Petal.Width']
versicolor_pw

# dplyr:
# Answer:
versicolor_pw_tidy <- iris %>%
  filter(Species == 'versicolor') %>%
    select(Petal.Width)
versicolor_pw_tidy


# 4) Simple statistics on versicolor_pw:

# Base R:
versicolor_pw <- iris[iris$Species == 'versicolor', 'Petal.Width']
mean(versicolor_pw)
median(versicolor_pw)
var(versicolor_pw)
sd(versicolor_pw)

# dplyr (start with the complete iris dataset):

# Answer:
iris %>%
  filter(Species == "versicolor") %>%
    summarize(mean(Petal.Width))

iris %>%
  filter(Species == "versicolor") %>%
    summarize(median(Petal.Width))

iris %>%
  filter(Species == "versicolor") %>%
    summarize(var(Petal.Width))

iris %>%
  filter(Species == "versicolor") %>%
    summarize(sd(Petal.Width))


# 5) Do all statistical summaries in question 4 for each species in one data frame (start with the complete iris dataset):

# Answer:
# All at once
iris %>% group_by(Species) %>%
  summarize(mean(Petal.Width), median(Petal.Width), var(Petal.Width), sd(Petal.Width))
