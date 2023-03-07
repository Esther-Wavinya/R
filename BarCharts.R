

# LOAD DATASETS PACKAGES ###################################

library(datasets)

# LOAD DATA ################################################

?mtcars
head(mtcars)
#mpg cyl disp  hp drat    wt  qsec vs am gear
#Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4
#Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4
#Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4
#Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3
#Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3
#Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3
#                  carb
#Mazda RX4            4
#Mazda RX4 Wag        4
#Datsun 710           1
#Hornet 4 Drive       1
#Hornet Sportabout    2
#Valiant              1


# BAR CHARTS ###############################################

barplot(mtcars$cyl)             # Doesn't work

# Need a table with frequencies for each category
cylinders <- table(mtcars$cyl)  # Create table
barplot(cylinders)              # Bar chart
plot(cylinders)                 # Default X-Y plot (lines)

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
