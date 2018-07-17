# Exercise 4

# Answer the following questions about the iris dataset:

# 1) Who collected this data and when was it collected?

# Answer: Anderson, Edgar (1935)

# 2) What type of data structure is iris?

# Answer:
class(iris)
# "data.frame"

# 3) Take a look at the structure of iris. How many variables are there? What type are they?

# Answer:
str(iris)

# 4) The command used to answer the previous question returns the number of observations and
# the number of variables, which effectively tells you the dimensions of the data set. There
# is another function in R that will explicitly return the dimensions of an object. See if
# you can find it and run it on iris.

# HINT: Use line completion in the console window.

# Answer:
dim(iris)
# 150 5

# The output confirms that there are 150 rows and 5 columns.

# 5) What is the mean petal length across all species of iris?

# Answer:
summary(iris$Petal.Length)
# Mean   :3.758

# 6) Create a new data frame containing only the first five rows of the iris dataset.

# Answer:
first_five_iris <- head(iris, n = 5)
