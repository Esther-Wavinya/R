

# INSTALL AND LOAD PACKAGES ################################

library(datasets)  # Load base packages manually

# Installs pacman ("package manager") if needed
if (!require("pacman")) install.packages("pacman")

# Use pacman to load add-on packages as desired
pacman::p_load(pacman, caret, lars, tidyverse)

# LOAD DATA ################################################

?USJudgeRatings
head(USJudgeRatings)
#               CONT INTG DMNR DILG CFMG DECI PREP FAMI ORAL WRIT
#AARONSON,L.H.   5.7  7.9  7.7  7.3  7.1  7.4  7.1  7.1  7.1  7.0
#ALEXANDER,J.M.  6.8  8.9  8.8  8.5  7.8  8.1  8.0  8.0  7.8  7.9
#ARMENTANO,A.J.  7.2  8.1  7.8  7.8  7.5  7.6  7.5  7.5  7.3  7.4
#BERDON,R.I.     6.8  8.8  8.5  8.8  8.3  8.5  8.7  8.7  8.4  8.5
#BRACKEN,J.J.    7.3  6.4  4.3  6.5  6.0  6.2  5.7  5.7  5.1  5.3
#BURNS,E.B.      6.2  8.8  8.7  8.5  7.9  8.0  8.1  8.0  8.0  8.0
#               PHYS RTEN
#AARONSON,L.H.   8.3  7.8
#ALEXANDER,J.M.  8.5  8.7
#ARMENTANO,A.J.  7.9  7.8
#BERDON,R.I.     8.8  8.7
#BRACKEN,J.J.    5.5  4.8
#BURNS,E.B.      8.6  8.6
data <- USJudgeRatings
#BERDON,R.I.     6.8  8.8  8.5  8.8  8.3  8.5  8.7  8.7  8.4  8.5
#BRACKEN,J.J.    7.3  6.4  4.3  6.5  6.0  6.2  5.7  5.7  5.1  5.3
#BURNS,E.B.      6.2  8.8  8.7  8.5  7.9  8.0  8.1  8.0  8.0  8.0
#               PHYS RTEN
#AARONSON,L.H.   8.3  7.8
#ALEXANDER,J.M.  8.5  8.7
#ARMENTANO,A.J.  7.9  7.8
#BERDON,R.I.     8.8  8.7
#BRACKEN,J.J.    5.5  4.8
#BURNS,E.B.      8.6  8.6



# Define variable groups
x <- as.matrix(data[, -12])
y <- data[, 12]

# REGRESSION WITH SIMULTANEOUS ENTRY #######################

# Using variable groups
reg1 <- lm(y ~ x)

# Or specify variables individually
reg1 <- lm(RTEN ~ CONT + INTG + DMNR + DILG + CFMG +
           DECI + PREP + FAMI + ORAL + WRIT + PHYS,
           data = USJudgeRatings)

# Results
reg1           # Coefficients only
#Call:
#lm(formula = RTEN ~ CONT + INTG + DMNR + DILG + CFMG + DECI + 
#   PREP + FAMI + ORAL + WRIT + PHYS, data = USJudgeRatings)

#Coefficients:
#(Intercept)         CONT         INTG         DMNR         DILG  
#   -2.11943      0.01280      0.36484      0.12540      0.06669  
#       CFMG         DECI         PREP         FAMI         ORAL  
#   -0.19453      0.27829     -0.00196     -0.13579      0.54782  
#       WRIT         PHYS  
#   -0.06806      0.26881  
summary(reg1)  # Inferential tests

# MORE SUMMARIES ###########################################

anova(reg1)            # Coefficients w/inferential tests
coef(reg1)             # Coefficients (same as reg1)
confint(reg1)          # CI for coefficients
resid(reg1)            # Residuals case-by-case
hist(residuals(reg1))  # Histogram of residuals

# ADDITIONAL MODELS ########################################

# Conventional stepwise regression
stepwise <- lars(x, y, type = "stepwise")

# Stagewise: Like stepwise but with better generalizability
forward <- lars(x, y, type = "forward.stagewise")

# LAR: Least Angle Regression
lar <- lars(x, y, type = "lar")

# LASSO: Least Absolute Shrinkage and Selection Operator
lasso <- lars(x, y, type = "lasso")

# Comparison of R^2 for new models
r2comp <- c(stepwise$R2[6], forward$R2[6], 
            lar$R2[6], lasso$R2[6]) %>% 
            round(2)
names(r2comp) <- c("stepwise", "forward", "lar", "lasso") 
r2comp  # Show values of R^2

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
