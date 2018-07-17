# Exercise 2

# 1) Create the following:
#
#  a) a variable containing the word "chicken"
#  b) a numeric vector with the number 2, 4, 6, and 8
#  c) a 3 X 3 matrix of nine numbers (these can be sequential)
#
#  Now create a list that contains the three data structures

# Answer:
c <- "chicken"
v <- c(2, 4, 6, 8)
m <- matrix(1:9, ncol = 3)

my_list <- list(char = c,
                vec = v,
                mat = m)
my_list

# 2) Find the average number of green shapes in the 'shapes' matrix

# Answer:
mean(shapes[,2])
# or
color <- c("red", "green", "blue")
shape <- c("circle", "square", "rectangle", "triangle")
colnames(shapes) <- color
rownames(shapes) <- shape
mean(shapes[,"green"])
# 6.5
