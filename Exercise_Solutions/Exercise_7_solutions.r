# Exercise 7

# 1) Create a boxplot for the distribution of GDP percapita for each country in 1967:

# Answer:
gapminder_1967 <- gapminder %>%
  filter(year == 1967)

boxplot(gapminder_1967$lifeExp, main= "Life Expectancy Across Continents in 1967", ylab = "Age")


# 2) Create a data frame that contains median life expectancy and max GDP percapita by year:

# Answer:
medianLifeExp_by_year <- gapminder %>%
  group_by (year)  %>%
    summarize (medianLifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap))


# 3) Create a data frame that contains statistics for all countries in the year 2002 and adds a column for life expectancy by month:

# Answer:
year_2002_months <- gapminder %>%
  filter(year == 2002) %>%
    mutate (lifeExpMonths = 12 * lifeExp) %>%
      arrange (desc(lifeExpMonths))


# 4) Create a data frame of median GDP percapita by continent, then create a barplot of the data:

# Answer:
medianGPD_by_continent <- gapminder %>%
                filter (year == 1952) %>%
                group_by (continent) %>%
                summarize (medianGdpPercap = median(gdpPercap))

plot(medianGPD_by_continent$continent, medianGPD_by_continent$medianGdpPercap, ylab="Median GDP Percapita")

# or better:

barplot(medianGPD_by_continent$medianGdpPercap, names.arg = medianGPD_by_continent$continent, ylab="Median GDP Percapita")

# 5) Create a data frame containing the year, continent, and median GDP percapita. Then, create a line plot for year versus median GDP percapita with lines colored by country:

# Answer:
medianGDP_by_year_continent <- gapminder %>%
             group_by (year, continent) %>%
               summarize (medianGdpPercap = median(gdpPercap))

plot(medianGDP_by_year_continent$year, medianGDP_by_year_continent$medianGdpPercap, xlab = "Year", ylab="Median GDP Percapita")
