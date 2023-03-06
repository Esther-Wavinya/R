

# COLON OPERATOR ###########################################

# Assigns number 0 through 10 to x1
x1 <- 0:10
x1
#[1]  0  1  2  3  4  5  6  7  8  9 10

# Descending order
x2 <- 10:0
x2
# [1] 10  9  8  7  6  5  4  3  2  1  0

# SEQ ######################################################

?seq  # R help on seq

# Ascending values (duplicates 1:10)
(x3 <- seq(10))
# [1]  1  2  3  4  5  6  7  8  9 10

# Specify change in values
(x4 <- seq(30, 0, by = -3))
# [1] 30 27 24 21 18 15 12  9  6  3  0

# ENTER MULTIPLE VALUES WITH C #############################

# c = concatenate (or combine or collect)
?c  # R help on c

x5 <- c(5, 4, 1, 6, 7, 2, 2, 3, 2, 8)
x5
# [1] 5 4 1 6 7 2 2 3 2 8


# SCAN #####################################################

?scan  # R help on scan

x6 <- scan()  # After running this command, go to console

# Hit return after each number
# Hit return twice to stop
x6
#numeric(0)

# REP ######################################################

?rep  # R help on rep
x7 <- rep(TRUE, 5)
x7
#[1] TRUE TRUE TRUE TRUE TRUE

# Repeats set
x8 <- rep(c(TRUE, FALSE), 5)
x8
#[1]  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE

# Repeats items in set
x9 <- rep(c(TRUE, FALSE), each = 5)
x9
#[1]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE

# CLEAN UP #################################################

# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L

# Clear mind :)
