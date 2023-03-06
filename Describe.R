# File:   Describe.R
# Course: R: An Introduction (with RStudio)

# INSTALL AND LOAD PACKAGES ################################

library(datasets)  # Load base packages manually

# Installs pacman ("package manager") if needed
if (!require("pacman")) install.packages("pacman")

# Use pacman to load add-on packages as desired
pacman::p_load(pacman, psych) 
#psych installed

# LOAD DATA ################################################

head(iris)
#head(iris)
#Sepal.Length Sepal.Width Petal.Length Petal.Width Species
#1          5.1         3.5          1.4         0.2  setosa
#2          4.9         3.0          1.4         0.2  setosa
#3          4.7         3.2          1.3         0.2  setosa
#4          4.6         3.1          1.5         0.2  setosa
#5          5.0         3.6          1.4         0.2  setosa
#6          5.4         3.9          1.7         0.4  setosa

# PSYCH PACKAGE ############################################

# Get info on package
p_help(psych)           # Opens package PDF in browser
p_help(psych, web = F)  # Opens help in R Viewer

# DESCRIBE() ###############################################

# For quantitative variables only.

describe(iris$Sepal.Length)  # One quantitative variable
#   vars   n mean   sd median trimmed  mad min max range skew
#X1    1 150 5.84 0.83    5.8    5.81 1.04 4.3 7.9   3.6 0.31
#   kurtosis   se
#X1    -0.61 0.07

describe(iris)               # Entire data frame
#             vars   n mean   sd median trimmed  mad min max range
#Sepal.Length    1 150 5.84 0.83   5.80    5.81 1.04 4.3 7.9   3.6
#Sepal.Width     2 150 3.06 0.44   3.00    3.04 0.44 2.0 4.4   2.4
#Petal.Length    3 150 3.76 1.77   4.35    3.76 1.85 1.0 6.9   5.9
#Petal.Width     4 150 1.20 0.76   1.30    1.18 1.04 0.1 2.5   2.4
#Species*        5 150 2.00 0.82   2.00    2.00 1.48 1.0 3.0   2.0
#              skew kurtosis   se
#Sepal.Length  0.31    -0.61 0.07
#Sepal.Width   0.31     0.14 0.04
#Petal.Length -0.27    -1.42 0.14
#Petal.Width  -0.10    -1.36 0.06
#Species*      0.00    -1.52 0.07



# CLEAN UP #################################################

# Clear environment
rm(list = ls()) 

# Clear packages
p_unload(all)  # Remove all add-ons
detach("package:datasets", unload = TRUE)   # For base

# Clear console
cat("\014")  # ctrl+L

# Clear mind :)
