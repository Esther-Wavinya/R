# File:   RStudio.R
# Course: R: An Introduction (with RStudio)

# LOAD DATA ################################################

library(datasets)  # Load built-in datasets

# SUMMARIZE DATA ###########################################

head(iris)         # Show the first six lines of iris data

#> head(iris)         # Show the first six lines of iris data
#Sepal.Length Sepal.Width Petal.Length Petal.Width Species
#1          5.1         3.5          1.4         0.2  setosa
#2          4.9         3.0          1.4         0.2  setosa
#3          4.7         3.2          1.3         0.2  setosa
#4          4.6         3.1          1.5         0.2  setosa
#5          5.0         3.6          1.4         0.2  setosa
#6          5.4         3.9          1.7         0.4  setosa

summary(iris)      # Summary statistics for iris data

#> summary(iris)      # Summary statistics for iris data
#Sepal.Length    Sepal.Width     Petal.Length    Petal.Width          Species  
#Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100   setosa    :50  
#1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300   versicolor:50  
#Median :5.800   Median :3.000   Median :4.350   Median :1.300   virginica :50  
#Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199                  
#3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800                  
#Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500 


plot(iris)         # Scatterplot matrix for iris data


# CLEAN UP #################################################

# Clear packages
detach("package:datasets", unload = TRUE)  # For base

# Clear plots
dev.off()  # But only if there IS a plot

# Clear console
cat("\014")  # ctrl+L

# Clear mind :)
