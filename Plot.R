

# LOAD DATASETS PACKAGES ###################################

library(datasets)  # Load/unload base packages manually

# LOAD DATA ################################################

head(iris)
#> head(iris)
#Sepal.Length Sepal.Width Petal.Length Petal.Width Species
#1          5.1         3.5          1.4         0.2  setosa
#2          4.9         3.0          1.4         0.2  setosa
#3          4.7         3.2          1.3         0.2  setosa
#4          4.6         3.1          1.5         0.2  setosa
#5          5.0         3.6          1.4         0.2  setosa
#6          5.4         3.9          1.7         0.4  setosa

# PLOT DATA WITH PLOT() ####################################

?plot  # Help for plot()


plot(iris$Species)  # Categorical variable
plot(iris$Petal.Length)  # Quantitative variable
plot(iris$Species, iris$Petal.Width)  # Cat x quant
plot(iris$Petal.Length, iris$Petal.Width)  # Quant pair
plot(iris)  # Entire data frame

# Plot with options
plot(iris$Petal.Length, iris$Petal.Width,
  col = "#cc0000",  # Hex code for datalab.cc red
  pch = 19,         # Use solid circles for points
  main = "Iris: Petal Length vs. Petal Width",
  xlab = "Petal Length",
  ylab = "Petal Width")

# PLOT FORMULAS WITH PLOT() ################################

plot(cos, 0, 2*pi)
plot(exp, 1, 5)
plot(dnorm, -3, +3)

# Formula plot with options
plot(dnorm, -3, +3,
  col = "#cc0000",
  lwd = 5,
  main = "Standard Normal Distribution",
  xlab = "z-scores",
  ylab = "Density")

# CLEAN UP #################################################

# Clear packages
detach("package:datasets", unload = TRUE)

# Clear plots
dev.off()  # But only if there IS a plot

# Clear console
cat("\014")  # ctrl+L

# Clear mind :)
