##############################
### Part 1: Basic R Review ###
##############################
# R is a high-level, interpreted programming language and environment for
# (primarily) statistical analysis. Read more about it here:
# https://www.r-project.org/about.html




######################################
# Getting today's workshop materials #
######################################

# 1) Download the materials from here:
#    https://github.com/kaars/R_Refresher_July_2018.git
#
# 2) Instructions on how to do this:
#   https://sites.northwestern.edu/summerworkshops/resources/downloading-from-github/

# Where am I?
getwd()

# Change my working directory to the location of the workshop materials
setwd(".")

# List the contents of the directory
dir()


###################
# R Basics Review #
###################


### Arithmetic Operations

# Addition
5 + 6

# Subtraction
100 - 1

# Multiplication
4 * 4

# Division
(6 - 5) / 4

# Exponentiation
2 ^ 100
# To change the number of significant figures...
signif(2 ^ 100, digits = 3)

# Modulo (returns the remainder)
21 %% 5


### Assigning variables

# The '<-' operator assigns a value to a variable
x <- 5 + 6
x

# '=' also works. However, the preference in the R community is to use the '<-'
# operator. More discussion about the difference can be found here:
# https://stackoverflow.com/questions/1741820/what-are-the-differences-between-and-in-r

y = 100 - 1
paste("y equals", y)  # paste converts arguments to character strings and concatenates them

z <- x + y
paste("z equals x + y, or", z)  # use print() with paste if called from inside a function


### Basic Data Types

## 1) Logical (Boolean values, TRUE and FALSE)
## 2) Integer (1, 2, 3)
## 3) Numeric (real numbers like 5.3)
## 4) Complex (z = 1 + 2i)
## 5) Character (text)

# Logical
logical_value <- TRUE
paste("logical_value", logical_value, "is of type", typeof(logical_value))

# Integer ('L' forces integer type)
integer_value <- 234L
paste("integer_value", integer_value, "is of type", typeof(integer_value))

# Numeric (double or real number)
numeric_value <- 234.77

# The function typeof() returns the data type for the R object
paste("numeric_value", numeric_value, "is of type", typeof(numeric_value))

# Complex
complex_value = 1 + 2i
paste("complex_value", complex_value, "is of type", typeof(complex_value))

# Character
# By putting quotes around the value, we are telling R that this is text.
character_value <- "234"
paste("character_value", character_value, "is of type", typeof(character_value))


### Data Structures in R

## From 'Advanced R' by Hadley Wickham
##
##      Homogeneous	    Heterogeneous
##  1d	Atomic vector	  List
##  2d	Matrix	        Data frame
##  nd	Array

## Atomic Vectors ##

# In R, a vector is a one-dimensional array.
# An atomic vector is a sequence of elements of the same data type (homogenous).
# Elements of a vector are called components.
# You assign elements to a vector using the combine function, c().

# Atomic vectors and lists (see below) are both a type of vector. They share the
# following properties:

# What type is it?
# typeof()

# How many elements are in it?
# length()

# Additional metadata (e.g., names)
# attributes()

# Vector Types #

# Logical
logical_vector <- c(TRUE, TRUE, FALSE)
logical_vector
typeof(logical_vector)

# Integer
# Add 'L' after the number to force integer type
integer_vector <- c(12L, 76L, 245L)
integer_vector
typeof(integer_vector)

# Double
double_vector <- c(12, 76.0, 245.34)
double_vector
typeof(double_vector)

# Character
character_vector <- c("twelve", "seventy six", "two hundred forty five")
character_vector

# What happens if you try to put different types of data in the same vector?
# R will force it the elements to the lowest type (see "Basic Data Types" above)
v <- c("R", "U", 4, "sure", "it's", TRUE, "?")
v
typeof(v)

# Accessing values of vectors #

12 %in% integer_vector                                     # TRUE
match(c("one", "twelve", "seventy six"), character_vector) # NA 1 2
which(logical_vector == TRUE)                              # 1 2
length(double_vector)                                      # 3

# Indexing Vectors #

# In R, indices start a 1, not 0 as in many other languages

# Vectors elements can be selected by position:
double_vector
double_vector[3]

integer_vector
integer_vector[2:3]

character_vector
character_vector[c(1,2,3)]

integer_vector
integer_vector[-2]

double_vector
double_vector[double_vector < 77]

#######################
# Complete Exercise 1 #
#######################

# Naming Vectors #

# Vectors can also be selected by name if the vector has name attributes. Examples of this
# are shown below.

# Before names are added...
num_guitars <- c(1, 4, 2, 15)
num_guitars

# After...
names(num_guitars) <- c("Bob", "Sue", "Max", "Emilia")
num_guitars

# You could also assign the names like so...
# guitar_names <- c("Bob", "Sue", "Max", "Emilia")
# names(num_guitars) <- guitar_names

# Notice that attributes() will now return the names
attributes(num_guitars)

# How many guitars does Emilia have? We can now access vector elements by name or
# position number.
num_guitars["Emilia"]
num_guitars[4]

# Adding Vectors #

# num_guitars is a vector describing the number of guitars owned by four people
num_guitars <- c(1, 4, 2, 15)
names(num_guitars) <- c("Bob", "Sue", "Max", "Emilia")

# How many guitars do they own collectively?
total_guitars <- sum(num_guitars)
paste("Total number of guitars:", total_guitars)

# Bob, Sue, Max, and Emilia went to a guitar auction. Some bought and some sold guitars.
bought_and_sold <- c(-1,-2, 8, 0)

# How many does each person own now?
new_num_guitars <- num_guitars + bought_and_sold
new_num_guitars

# Notice that both vectors don't have to be named; R will perform the operation
# element-wise and transfer the names to the new vector, 'new_num_guitars'. But
# what if both vectors have names and they aren't the same?"

# Add different names to the second vector
names(bought_and_sold) <- c("Joe", "Frank", "Lisa", "John")

# Which set of names get transferred to the new vector?
new_num_guitars <- num_guitars + bought_and_sold
new_num_guitars

# How about if we switch the order on the right side?
new_num_guitars <- bought_and_sold + num_guitars
new_num_guitars

# The set of names associated with the left-most vector in the addition operation
# is the one chosen. Be aware of this if you are performing operations on named R
# objects!


## Lists ##

# Like atomic vectors, lists, which are also a type of vector, are 1-dimensional.
# However, they let you store many types of R objects in one structure. These
# objects don't have to be related at all, but often are.

my_list <- list(0:4, "x", c(5.6, 9.8), c(TRUE, FALSE, TRUE))
my_list

# A common use for lists is to provide a single container for different data types
# returned by a single R function.

# 1) Vector of 5 numbers
v <- 1:5

# 2) A 3 x 2 matrix of numbers from 1 to 6
m <- matrix(1:6, ncol = 2)

# 3) First 5 rows of the built-in data set 'iris'
iris_head <- iris[1:5,]

# Create a list of these three data structures and give the components names
some_list <- list(vec = v,
                  mat = m,
                  df  = iris_head)
some_list

# Print the vector component of some_list
# All three of these do the same thing
some_list$vec      # by name
some_list[["vec"]] # using a text value for the name
some_list[[1]]     # by index

# Print the second element of 'vec'
some_list[["vec"]][2]

# Add an element to a list
some_list$another_component <- c("a", "b", "c")
some_list

## Matrices

# A matrix is a 2-dimensional vector (i.e., it has rows and columns) that contains
# elements of the same type. These can be numeric, character, or logical values.

# A matrix with 4 rows with the number 1 - 12 by row
matrix(1:12, byrow=TRUE, nrow=4)

# You can also create a matrix like this:
a <- c(1, 2, 3)
b <- c(4, 5, 6)
c <- c(7, 8, 9)
d <- c(10, 11, 12)

shapes <- matrix(c(a, b, c, d), nrow = 4)
shapes

# Create vectors that contains names for matrix rows and columns
color <- c("red", "green", "blue")
shape <- c("circle", "square", "rectangle", "triangle")

# These functions add names to rows and columns of a matrix
colnames(shapes) <- color
rownames(shapes) <- shape

# 'shapes' matrix with row and column names
shapes

# Find the total numbers of each shape in the matrix
total <- rowSums(shapes)  # use function colSums() to find column totals
total

# To add a new column, bind the new vector as a column to mat
tot_shapes <- cbind(shapes, total)

# Same matrix but with an added column of row totals
tot_shapes

# To add a row, use rbind
hexagon <- c(13, 14, 15, 42)
tot_shapes <- rbind(tot_shapes, hexagon)

# Now with an added row
tot_shapes


# Accessing matrices #

# Let's go back to the original 'shapes' matrix. Select just the circle row:
circles <- shapes[1,]
circles

# How many green squares and rectangles are there?
green_sq_rec <- shapes[2:3,2]
green_sq_rec

# Average number of shapes
mean(shapes)

# Subtract 2 from all elements
shapes - 2

#######################
# Complete Exercise 2 #
#######################

## Data Frames

# Like a matrix, a data frame has rows and columns. However, unlike a matrix, a
# data frame can contain multiple data types. Columns contain variables and rows
# contain observations. The structure of a data frame is similar to that of an
# Excel spreadsheet.

# Create vectors containing data about four people's guitar collections
owner <- c("Bob", "Sue", "Max", "Emilia")
count <- c(0, 2, 10, 15)
value <- c(0, 605.50, 5140.10, 9243.44)
professional <- c(FALSE, FALSE, TRUE, TRUE)

# Create a data frame from the vectors
guitars_df <- data.frame(owner, count, value, professional)
guitars_df

# Returns only the 'professional' variable
guitars_df$professional

# Returns the entire row for every professional player
# Use ! to return all non-professiona players
guitars_df[professional,]


## Factors

# A factor is a vector that can contain only predefined, categorical data.
#
# Factors have two attributes:
# 1) the class "factor", which makes their behavior different than that of integer vectors
# 2) "levels", which defines the allowed set of values
#
# Factors can be composed of either unordered categories or ordered levels (ordinal).

# light_switch, a non-ordered categorical variable of type 'character'
light_switch <- c("on", "off", "on", "off", "on", "off")
light_switch
table(light_switch) # Build a table of counts of factor levels

# Change 'light_switch' to a factor. Notice that the "Levels" are printed after the contents.
factor_ls <- factor(light_switch)
factor_ls

# 'size', an ordinal variable. The factor levels have an order in this case.
size <- c("Small", "Large", "Medium", "Medium", "Large", "Large", "Small")
factor_size <- factor(size, ordered = TRUE, levels = c("Small", "Medium", "Large"))
factor_size

# Give a summary of the counts of each category
summary(factor_size)

# Choose a size to compare (the first component of the vector)
first_size <- factor_size[1]
first_size

# Choose another size (the fourth component of the vector)
second_size <- factor_size[4]
second_size

# Is the first size larger than the second size?
paste("Is the first size larger than the second size?", first_size > second_size)

## Dates

# Print today's date
Sys.Date()

# Default format is YYYY-MM-DD
more_dates <- as.Date(c("2016-03-19", "2017-12-13", "2018-07-04"))
more_dates

# Convert strings in 'MM/dd/yyyy' format to date objects
char_dates <- c("01/05/1965", "08/16/1975")
dates <- as.Date(char_dates, "%m/%d/%Y")
dates

# I would recommend the 'lubridate' package for working with dates in R (a cheat sheet can be
# found here: https://www.rstudio.com/resources/cheatsheets/.


### Special Values in R ###

## Missing Data (NA)

  # In R, missing data in represented as NA
  v <- c(1, 2, 3, NA, 5, 6, NA, NA)

  # The is.na() function will return TRUE or FALSE for each element
  is.na(v)

  # Which elements are NA?
  which(is.na(v))

  # How many NA's are there?
  sum(is.na(v))

## Inf

  # If a function computes a number that is too large, R will return 'Inf' or '-Inf'
  3 ^ 1000
  -2 ^ 5000

  # It's the same if you divide by 0
  1 / 0

## NaN

  # If R cannot make sense out of the result of a computation, it will return 'NaN'
  # (not a number)
  0 / 0

## NULL
  # Null is used to represent an undefined value
  # It is NOT the same as NA, Inf, -Inf, or NaN
  
#######################
# Complete Exercise 3 #
#######################
