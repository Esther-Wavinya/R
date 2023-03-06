

# LOAD DATASETS PACKAGES ###################################

library(datasets)  # Load/unload base packages manually

# LOAD DATA ################################################

?mtcars
head(mtcars)
#> head(mtcars)
#mpg cyl disp  hp drat    wt  qsec vs am gear carb
#Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
#Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
#Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
#Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
#Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
#Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1


# PLOTS ####################################################

# Good to first check univariate distributions
hist(mtcars$wt)
hist(mtcars$mpg)

# Basic X-Y plot for two quantitative variables
plot(mtcars$wt, mtcars$mpg)

# Add some options
plot(mtcars$wt, mtcars$mpg,
  pch = 19,         # Solid circle
  cex = 1.5,        # Make 150% size
  col = "#cc0000",  # Red
  main = "MPG as a Function of Weight of Cars",
  xlab = "Weight (in 1000 pounds)",
  ylab = "MPG")

# CLEAN UP #################################################

# Clear packages
detach("package:datasets", unload = TRUE)  # For base

# Clear plots
dev.off()  # But only if there IS a plot

# Clear console
cat("\014")  # ctrl+L

# Clear mind :)
