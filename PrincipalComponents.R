

# INSTALL AND LOAD PACKAGES ################################

# Packages I load every time; uses "pacman"
pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, 
  ggvis, httr, lubridate, plotly, rio, rmarkdown, shiny, 
  stringr, tidyr) 

library(datasets)  # Load base packages manually

# LOAD DATA ################################################

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
#                  mpg cyl disp  hp    wt  qsec am gear carb
#Mazda RX4         21.0   6  160 110 2.620 16.46  1    4    4
#Mazda RX4 Wag     21.0   6  160 110 2.875 17.02  1    4    4
#Datsun 710        22.8   4  108  93 2.320 18.61  1    4    1
#Hornet 4 Drive    21.4   6  258 110 3.215 19.44  0    3    1
#Hornet Sportabout 18.7   8  360 175 3.440 17.02  0    3    2
#Valiant           18.1   6  225 105 3.460 20.22  0    3    1

# COMPUTE PCA ##############################################

# For entire data frame ####################################
pc <- prcomp(cars,
        center = TRUE,  # Centers means to 0 (optional)
        scale = TRUE)   # Sets unit variance (helpful)

# To specify variables #####################################

pc <- prcomp(~ mpg + cyl + disp + hp + wt + qsec + am +
        gear + carb, 
        data = mtcars, 
        center = TRUE,
        scale = TRUE)

# EXAMINE RESULTS ##########################################

# Get summary stats
summary(pc)
#Importance of components:
#                         PC1    PC2     PC3     PC4     PC5
#Standard deviation     2.3391 1.5299 0.71836 0.46491 0.38903
#Proportion of Variance 0.6079 0.2601 0.05734 0.02402 0.01682
#Cumulative Proportion  0.6079 0.8680 0.92537 0.94939 0.96620
#PC6     PC7     PC8    PC9
#Standard deviation     0.35099 0.31714 0.24070 0.1499
#Proportion of Variance 0.01369 0.01118 0.00644 0.0025
#Cumulative Proportion  0.97989 0.99107 0.99750 1.0000

# Screeplot for number of components
plot(pc)

# Get standard deviations and rotation
pc
#Standard deviations (1, .., p=9):
#[1] 2.3391410 1.5299383 0.7183646 0.4649052 0.3890348 0.3509911
#[7] 0.3171373 0.2406989 0.1498962

#Rotation (n x k) = (9 x 9):
#            PC1         PC2         PC3        PC4         PC5
#mpg  -0.4023287  0.02205294 -0.17272803 -0.1366169  0.31654561
#cyl   0.4068870  0.03589482 -0.27747610  0.1410976  0.02066646
#disp  0.4046964 -0.06479590 -0.17669890 -0.5089434  0.21525777
#hp    0.3699702  0.26518848 -0.01046827 -0.1273173  0.42166543
#wt    0.3850686 -0.15955242  0.33740464 -0.4469327 -0.21141143
#qsec -0.2168575 -0.48343885  0.54815205 -0.2545226  0.05466817
#am   -0.2594512  0.46039449 -0.19492256 -0.5354196 -0.55331460
#gear -0.2195660  0.50608232  0.34579810 -0.1799814  0.50533262
#carb  0.2471604  0.44322600  0.53847588  0.3203064 -0.25696817
#              PC6        PC7        PC8         PC9
#mpg  -0.718609897  0.3633216 -0.1487806  0.13567069
#cyl  -0.214224005  0.2099893  0.7951724  0.11635839
#disp  0.010052074  0.2007152 -0.1346748 -0.66099594
#hp   -0.254229405 -0.6741641 -0.1210386  0.25474680
#wt    0.002897706  0.3392809 -0.1598333  0.57211273
#qsec -0.226660704 -0.2986852  0.4144075 -0.19671599
#am   -0.087616182 -0.2135605  0.1897463 -0.02465169
#gear  0.393990378  0.2484622  0.2614819  0.05482771
#carb -0.398353829  0.1321064 -0.1054553 -0.31083546

# See how cases load on PCs
predict(pc) %>% round(2)
#PC1   PC2   PC3   PC4   PC5   PC6   PC7   PC8
#Mazda RX4           -0.82  1.46 -0.21  0.32 -0.85 -0.01  0.25  0.07
#Mazda RX4 Wag       -0.79  1.26  0.05  0.12 -0.89 -0.08  0.25  0.16
#Datsun 710          -2.49  0.03 -0.32 -0.40 -0.37  0.54 -0.50 -0.03
#Hornet 4 Drive      -0.29 -1.93 -0.32 -0.07  0.21 -0.05 -0.01  0.01
#Hornet Sportabout    1.56 -0.81 -1.04  0.05  0.38 -0.14  0.15  0.08
#Valiant             -0.21 -2.19  0.14 -0.07 -0.08  0.27 -0.26  0.28
#Duster 360           2.73  0.29 -0.58  0.53  0.20 -0.21 -0.40 -0.36
#Merc 240D           -1.80 -1.27  1.03  0.14  0.40  0.22  0.54 -0.33
#Merc 230            -1.90 -1.93  1.96 -0.26  0.61 -0.08 -0.39  0.34
#Merc 280             0.02 -0.06  1.06  0.74  0.14  0.10  0.43  0.00
#Merc 280C            0.04 -0.23  1.29  0.68  0.08  0.19  0.25  0.17
#Merc 450SE           1.82 -0.68 -0.19  0.30 -0.14 -0.18  0.06  0.14
#Merc 450SL           1.60 -0.68 -0.27  0.40 -0.01 -0.31 -0.03  0.22
#Merc 450SLC          1.71 -0.80 -0.07  0.37 -0.12 -0.11 -0.21  0.35
#Cadillac Fleetwood   3.54 -0.79  0.62 -0.84 -0.35  0.14  0.17 -0.10
#Lincoln Continental  3.65 -0.73  0.64 -0.87 -0.36  0.12  0.14 -0.17
#Chrysler Imperial    3.39 -0.52  0.40 -0.82 -0.07 -0.39  0.26 -0.36
#Fiat 128            -3.53 -0.24 -0.33 -0.52 -0.03 -0.62  0.11  0.03
#Honda Civic         -3.44  0.33 -0.42  0.17 -0.28 -0.46  0.16 -0.09
#Toyota Corolla      -3.85 -0.29 -0.35 -0.41  0.13 -0.85  0.00  0.16
#Toyota Corona       -1.64 -1.98  0.10  0.62  0.05  0.14 -0.69 -0.46
#Dodge Challenger     1.55 -0.87 -0.91  0.33 -0.03  0.35  0.19  0.20
#AMC Javelin          1.44 -0.96 -0.77  0.37 -0.04  0.33  0.05  0.33
#Camaro Z28           2.92  0.37 -0.57  0.53  0.06 -0.04 -0.31 -0.47
#Pontiac Firebird     1.81 -0.90 -0.96 -0.31  0.39 -0.19  0.38 -0.04
#Fiat X1-9           -3.22 -0.06 -0.45 -0.20 -0.25  0.06 -0.19  0.06
#Porsche 914-2       -2.66  1.53 -0.28 -0.21  0.32  0.69  0.41 -0.25
#Lotus Europa        -3.19  1.69 -0.52  0.01  0.78  0.06  0.16 -0.22
#Ford Pantera L       1.60  3.10 -0.61 -0.69  0.69  0.60 -0.18  0.42
#Ferrari Dino        -0.25  3.18  0.73  0.51 -0.24  0.06  0.22 -0.02
#Maserati Bora        2.63  4.40  0.97 -0.01  0.27 -0.57 -0.55  0.07
#Volvo 142E          -1.94  0.28  0.19 -0.46 -0.58  0.40 -0.48 -0.19
#PC9
#Mazda RX4           -0.18
#Mazda RX4 Wag       -0.09
#Datsun 710           0.11
#Hornet 4 Drive      -0.12
#Hornet Sportabout   -0.15
#Valiant              0.02
#Duster 360          -0.17
#Merc 240D            0.03
#Merc 230            -0.19
#Merc 280             0.11
#Merc 280C            0.01
#Merc 450SE           0.40
#Merc 450SL           0.20
#Merc 450SLC          0.14
#Cadillac Fleetwood  -0.26
#Lincoln Continental -0.04
#Chrysler Imperial    0.22
#Fiat 128             0.21
#Honda Civic         -0.30
#Toyota Corolla       0.02
#Toyota Corona       -0.07
#Dodge Challenger    -0.03
#AMC Javelin         -0.06
#Camaro Z28           0.07
#Pontiac Firebird    -0.12
#Fiat X1-9            0.01
#Porsche 914-2        0.09
#Lotus Europa         0.02
#Ford Pantera L       0.00
#Ferrari Dino        -0.01
#Maserati Bora       -0.04
#Volvo 142E           0.14


# Biplot of first two components
biplot(pc)

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
