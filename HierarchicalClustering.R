

# INSTALL AND LOAD PACKAGES ################################

library(datasets)  # Load base packages manually

# Installs pacman ("package manager") if needed
if (!require("pacman")) install.packages("pacman")

# Use pacman to load add-on packages as desired
pacman::p_load(pacman, tidyverse) 

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

cars <- mtcars[, c(1:4, 6:7, 9:11)]  # Select variables
head(cars)
#mpg cyl disp  hp    wt  qsec am gear carb
#Mazda RX4         21.0   6  160 110 2.620 16.46  1    4    4
#Mazda RX4 Wag     21.0   6  160 110 2.875 17.02  1    4    4
#Datsun 710        22.8   4  108  93 2.320 18.61  1    4    1
#Hornet 4 Drive    21.4   6  258 110 3.215 19.44  0    3    1
#Hornet Sportabout 18.7   8  360 175 3.440 17.02  0    3    2
#Valiant           18.1   6  225 105 3.460 20.22  0    3    1

# COMPUTE AND PLOT CLUSTERS ################################

# Save hierarchical clustering to "hc." This codes uses
# pipes from dplyr.
hc <- cars   %>%  # Get cars data
      dist   %>%  # Compute distance/dissimilarity matrix
      hclust      # Computer hierarchical clusters
  
plot(hc)          # Plot dendrogram

# ADD BOXES TO PLOT ########################################

rect.hclust(hc, k = 2, border = "gray")
rect.hclust(hc, k = 3, border = "blue")
rect.hclust(hc, k = 4, border = "green4")
rect.hclust(hc, k = 5, border = "darkred")

# CLEAN UP #################################################

# Clear environment
rm(list = ls()) 

# Clear packages
p_unload(all)  # Remove all add-ons
detach("package:datasets", unload = TRUE)  # For base

# Clear plots
dev.off()  # But only if there IS a plot

# Clear console
cat("\014")  # ctrl+L

# Clear mind :)
