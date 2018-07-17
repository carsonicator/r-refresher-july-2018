#########################################
### Part 2: Getting to Know Your Data ###
#########################################
##
#

## Getting Help ##

# You can access R's help documents for a function or dataset by typing '?' before the name,
# or by typing 'help (name)'.

?data.frame

# All of these do the same thing; quotes are optional
help(data.frame)
help("data.frame")
?"data.frame"

# Shows the example section of the documentation for a function or data set
example(data.frame)

# More information about getting help in R (including vingnettes, codes demonstrations,
# and searching) can be found here: https://www.r-project.org/help.html.
#
# Remember, you can also search for terms using the 'Help' tab in the 'Files' pane.
# See the 'References_and_Tutorials.md' file in the workshop repository for more resources


## Getting To Know the Data ##

# Going back to our previous example,
#
# Create vectors containing data about the guitar collections belonging to four people
owner <- c("Bob", "Sue", "Max", "Emilia")
count <- c(0, 2, 10, 15)
value <- c(0, 605.50, 5140.10, 9243.44)
professional <- c(FALSE, FALSE, TRUE, TRUE)

# Create a data frame from the vectors
guitars_df <- data.frame(owner, count, value, professional)

# What does 'guitars_df' look like? You can use the View() function to get a
# spreadsheet-like view of your data:

View(guitars_df)

# You can also do this by clicking on the object name in the 'Environment' pane.
# You can sort each column by clicking on the column name.

# When working with a new data set, it's a good idea to take a few minutes to examine
# and summarize it. Let's take a look at guitars_df. The class function tells us the type
# of R object we are dealing with.

# Slowly type 'class(guitars)' below
class(guitars_df)

# As you typed the 'class' command, you should have seen a pop-up menu of available
# functions and their descriptions. As you continue to type 'guitars_df', you will see a
# description of available objects and their descriptions that match the name 'guitars_df'.

# You can check the structure of 'guitars_df' to see if the variable types seem correct.
# This is done using the str() function.

# str() returns the structure of the object
str(guitars_df)

# You can check the column (variable) names for your data set with names():
names(guitars_df)

# What if we want basic counts and distribution characterisitics for all variables?
# We can use summary() for this:
summary(guitars_df)

# summary() returns the appropriate statistics for each variable type. For numeric values,
# it returns a 5-number summary along with the mean. For catergorical variables (factors),
# it returns a count for each category.

# Suppose I only want to get a summary of the values of all the guitars in the dataset.
# How would I do that?
summary(guitars_df$value)

# Another handy set of functions is head() and tail(). They return the first and last 'n'
# rows of a data frame, respectively:

# The first n rows...
head(guitars_df, n = 2)

# The last n rows...
tail(guitars_df, n = 2)
