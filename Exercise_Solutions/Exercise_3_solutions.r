# Exercise 3

# 1) Convert the following character vector to a factor:

colors <- c("Red", "Blue", "Green", "Yellow", "Black", "Red", "Blue", "Green", "Black", "Red", "Blue", "Green", "Yellow", "Black", "Red", "Blue", "Green", "Black", "Green", "Green")

# Answer:
factor_color <- factor(colors, ordered = FALSE, levels = c("Red", "Blue", "Green", "Yellow", "Black"))
factor_color

# Alternatively...
factor_color <- as.factor(colors)
factor_color

# 2) What command will print only the non-missing values in the following vector?

v <- c(1, 2, 3, NA, 5, 6, NA, NA)

# Answer:
v[!is.na(v)]

# 3) How would you permanently remove all NA's from 'v'?

# Answer:
# Remove all NA's
v <- v[!is.na(v)]

