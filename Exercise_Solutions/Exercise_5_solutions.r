# Exercise 5

# The are many other options available for the hist() function. Using the last example we went through...

hist(iris$Sepal.Length, breaks = 25, xlim = c(4, 8))

# ..., see what other options you can find that will improve the figure. Run your code in the console.

# Answer:

# By default, hist() shows the frequency of occurrence of values, as indicated by the y-axis label. If you set 'prob=TRUE', hist() will calculate the likelihood of occurrence of the value interval on the x-axis, i.e., a probability density. The lines() function adds a density curve to the plot.

# See https://www.r-bloggers.com/how-to-make-a-histogram-with-basic-r/ for more examples
hist(iris$Sepal.Length, breaks = 15, xlim = c(4, 8), border="navy", col="maroon",
     xlab="Sepal Length", main="Histogram for Iris Sepal Length", prob = TRUE)

lines(density(iris$Sepal.Length))
