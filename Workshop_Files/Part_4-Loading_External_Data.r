##################################
### Part 4: External Data Sets ###
##################################
##
#

# So far we've been working with the 'iris' data set built into R. What if we want to load
# a .csv file from another source? To demonstrate this, we'll use the 'iris' data set again,
# but this time we'll load it from an external source using the read.csv() function.

iris_df <-read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/datasets/iris.csv",
                   header = TRUE, sep=",", strip.white=TRUE, stringsAsFactors=FALSE)

# As you can see, there are several additional arguments given:

# 'strip.white=TRUE' removes white space from the beginning and end of unquoted values in a
# character field (numeric values are always trimmed). This argument should be used in
# conjunction with the 'sep' argument.

# 'stringsAsFactors=FALSE' forces R to set the data type of strings to 'character'.
# You can check this using the str() function we introduced ealier:

str(iris_df)

iris_df$Species <- as.factor(iris_df$Species)

### Importing data from other software ###

# With R, you can import, process, and analyze data from other statistical software including SAS,
# Stata, and SPSS (with the 'haven' package). You can also import Excel files using 'readxl':

## Loading Excel Files

# Let's install and load the 'readxl' package

# Install the library if necessary
# install.packages("readxl")

# Load the library
library(readxl)

# Show the sheets in this .xlsx file
# Data file source: https://catalog.data.gov/dataset/summary-of-recall-cases-in-calendar-year
excel_sheets("Data_Files/FSIS-Recall-Summary-2014.xlsx")

# Just print out sheet 1
read_excel("Data_Files/FSIS-Recall-Summary-2014.xlsx", sheet = 1)

# Store sheet 1 from the recall file in a list
recall_list <- read_excel("Data_Files/FSIS-Recall-Summary-2014.xlsx", sheet = 1, skip = 1,
col_types = c("date", "text", "guess", "text", "text", "numeric"))

# Check out the structure of recall_list
str(recall_list)

# Change object type for "Reason for Recall" column to 'factor'
recall_list$"Reason for Recall" <- as.factor(recall_list$"Reason for Recall")

# What are the most common causes of recalls in this data set?
# Using the 'sort()' and 'table()' functions...
sort(table(recall_list$"Reason for Recall"), decreasing = TRUE)

# You could also just call 'summary'...
sort(summary(recall_list$"Reason for Recall"), decreasing = TRUE)
