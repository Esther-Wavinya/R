

# INSTALL AND LOAD PACKAGES ################################

library(datasets)  # Load/unload base packages manually

# LOAD DATA ################################################

head(iris)
#Sepal.Length Sepal.Width Petal.Length Petal.Width Species
#1          5.1         3.5          1.4         0.2  setosa
#2          4.9         3.0          1.4         0.2  setosa
#3          4.7         3.2          1.3         0.2  setosa
#4          4.6         3.1          1.5         0.2  setosa
#5          5.0         3.6          1.4         0.2  setosa
#6          5.4         3.9          1.7         0.4  setosa

# ALL DATA #################################################

hist(iris$Petal.Length)
summary(iris$Petal.Length)
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#1.000   1.600   4.350   3.758   5.100   6.900 

summary(iris$Species)  # Get names and n for each species
#    setosa versicolor  virginica 
#        50         50         50 

# SELECT BY CATEGORY #######################################

# Versicolor
hist(iris$Petal.Length[iris$Species == "versicolor"],
  main = "Petal Length: Versicolor")

# Virginica
hist(iris$Petal.Length[iris$Species == "virginica"],
  main = "Petal Length: Virginica")

# Setosa
hist(iris$Petal.Length[iris$Species == "setosa"],
  main = "Petal Length: Setosa")

# SELECT BY VALUE ##########################################

# Short petals only (all Setosa)
hist(iris$Petal.Length[iris$Petal.Length < 2],
  main = "Petal Length < 2")

# MULTIPLE SELECTORS #######################################

# Short Virginica petals only
hist(iris$Petal.Length[iris$Species == "virginica" & 
  iris$Petal.Length < 5.5],
  main = "Petal Length: Short Virginica")

# CREATE SUBSAMPLE #########################################

# Format: data[rows, columns]
# Leave rows or columns blank to select all
i.setosa <- iris[iris$Species == "setosa", ]

# EXPLORE SUBSAMPLE ########################################

head(i.setosa)
#Sepal.Length Sepal.Width Petal.Length Petal.Width Species
#1          5.1         3.5          1.4         0.2  setosa
#2          4.9         3.0          1.4         0.2  setosa
#3          4.7         3.2          1.3         0.2  setosa
#4          4.6         3.1          1.5         0.2  setosa
#5          5.0         3.6          1.4         0.2  setosa
#6          5.4         3.9          1.7         0.4  setosa
summary(i.setosa$Petal.Length)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#1.000   1.400   1.500   1.462   1.575   1.900 
hist(i.setosa$Petal.Length)

# CLEAN UP #################################################

# Clear environment
rm(list = ls()) 

# Clear packages
detach("package:datasets", unload = TRUE)  # For base

# Clear plots
dev.off()  # But only if there IS a plot

# Clear console
cat("\014")  # ctrl+L

# Clear mind :)
