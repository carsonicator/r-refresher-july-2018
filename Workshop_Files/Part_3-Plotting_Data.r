###################################
### Part 3: Plotting Data ###
###################################
##
#

# We are going to work with one of R's built-in data sets called 'iris'.
# First, let's find out more about the data:

#######################
# Complete Exercise 4 #
#######################


# Let's analyze just the petal widths of the versicolor species in 'iris'.

# We can create a new data frame by extracting a subet of all versicolor records,...
versicolor <- iris[iris$Species == 'versicolor',]
versicolor

# ...then create a numeric vector of versicolor petal widths, or...
versicolor_pw <- versicolor$Petal.Width
versicolor_pw

# ...do the same thing all in one line
versicolor_pw <- iris[iris$Species == 'versicolor', 'Petal.Width']
versicolor_pw

# As with most programming languages, there is usually more than one way to do things in R.
# Keep this in mind as you are learning the language.

### Calculating simple statistics ###

# Before we create any plots, let's get some simple statistics on the pedal widths of versicolor:
  
mean(versicolor_pw)
median(versicolor_pw)
var(versicolor_pw)
sd(versicolor_pw)

# We can also look at the correlation between versicolor's petal width and it's petal length.
# First let's create a vector for versicolor's petal lengths.
versicolor_pl <- iris[iris$Species == 'versicolor', 'Petal.Length']
versicolor_pl

# By default, cor() uses the Pearson method. Values range from -1 to 1. Does petal width have
# a correlation with petal length?
cor(versicolor_pw,versicolor_pl)


### Plotting Data ###

## Scatterplot ##

# Let's plot the versicolor petal lengths and widths
  plot(versicolor_pw,versicolor_pl)
  
  # Add a regression line
  abline(lm(versicolor_pl~versicolor_pw))
  
  # Change the title
  title("Versicolor Petal Width vs Length")


# What happens if we plot the whole 'iris' data set?
plot(iris)

# Calling plot() on the whole data set makes a scatterplot matrix that plots every variable
# against every other variable. What if we just want to look at one of these scatterplots?
plot(iris$Petal.Length, iris$Petal.Width)

## Boxplot ##

# Boxplot of petal length by species 
boxplot(Petal.Length~Species, data = iris, main="Petal Length by Iris Species",
        ylab="Length (cm)")

## Dot Plot ##

# Take a random sample of size 40 from the iris dataset, sampling without replacement
iris_ran_subset <- iris[sample(1:nrow(iris), 40, replace=FALSE),]

# Sort the rows so that all of the same species are together
iris_ran_subset_sorted <- iris_ran_subset[order(iris_ran_subset$Species),]

# Create a new column, 'Color'
iris_ran_subset_sorted$Color="black"

# Set Color values by Species
iris_ran_subset_sorted$Color[iris_ran_subset_sorted$Species == "virginica"] = "red"
iris_ran_subset_sorted$Color[iris_ran_subset_sorted$Species == "versicolor"] = "blue"
iris_ran_subset_sorted$Color[iris_ran_subset_sorted$Species == "setosa"] = "black"

# Plot the data
dotchart(iris_ran_subset_sorted$Sepal.Width,labels=iris_ran_subset_sorted$Species,cex=.9,
         main="Comparison of Sepal Width by Iris Species", 
         xlab="Sepal Width (cm)", col=iris_ran_subset_sorted$Color)

## Histogram ##

# We can also make a histogram that describes the distribution of sepal length values:
hist(iris$Sepal.Length)

# Let's give the histogram more detail by increasing the number of bins. This is done with
# the 'breaks' argument:

hist(iris$Sepal.Length, breaks = 15)

# Hmm...the x axis is a little off. Let's adjust it with the 'xlim' argument:
  
hist(iris$Sepal.Length, breaks = 25, xlim = c(4, 8))


#######################
# Complete Exercise 5 #
#######################


# On a side note...remember when we introduced lists earlier? A common use of lists is to
# gather different types of R objects in one container. Many functions, including hist(),
# return a list of different values. Each attribute of the returned histogram correlates
# to a specific component of the list. For example, if we assign the output of
# hist(iris$Sepal.Length) to a variable, we can capture the returned list:
  
sepal_hist <- hist(iris$Sepal.Length)
sepal_hist

# There are many other built-in data sets in R. To see a list...

data()
