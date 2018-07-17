# Exercise 1

# The following command creates a vector of 100 random numbers between 1 and 1000:

my_vector <- c(sample(1:1000, 100))

# Answer the following questions about the vector:

# 1) Extract the third through the sixth elements from the vector:

# Answer: my_vector[3:6]
# 644 431 354 221

# 2) Check to see if the numbers 99, 66, and 287 exist in this vector:

# Answer: match(c(99, 66, 287), my_vector)
# Results vary
# 85 NA 94

# 3) How many elements are greater than 500?

# Answer:
# length(my_vector[my_vector > 500])
# Results vary
# 46
