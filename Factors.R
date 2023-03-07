

# CREATE DATA ##############################################

(x1 <- 1:3)
#[1] 1 2 3

(y  <- 1:9)
#[1] 1 2 3 4 5 6 7 8 9


# Combine variables
(df1 <- cbind.data.frame(x1, y))
#  x1 y
#1  1 1
#2  2 2
#3  3 3
#4  1 4
#5  2 5
#6  3 6
#7  1 7
#8  2 8
#9  3 9



typeof(df1$x1)
#[1] "integer"


str(df1)
#'data.frame':	9 obs. of  2 variables:
#$ x1: int  1 2 3 1 2 3 1 2 3
#$ y : int  1 2 3 4 5 6 7 8 9


# AS.FACTOR ################################################

(x2  <- as.factor(c(1:3)))
#[1] 1 2 3
#Levels: 1 2 3


(df2 <- cbind.data.frame(x2, y))
# x2 y
#1  1 1
#2  2 2
#3  3 3
#4  1 4
#5  2 5
#6  3 6
#7  1 7
#8  2 8
#9  3 9


typeof(df2$x2)
#[1] "integer"


str(df2)
#'data.frame':	9 obs. of  2 variables:
#$ x2: Factor w/ 3 levels "1","2","3": 1 2 3 1 2 3 1 2 3
#$ y : int  1 2 3 4 5 6 7 8 9



# DEFINE EXISTING VARIABLE AS FACTOR #######################

x3  <- c(1:3)
df3 <- cbind.data.frame(x3, y)
(df3$x3 <- factor(df3$x3,
  levels = c(1, 2, 3)))
typeof(df3$x3)
str(df3)
#[1] 1 2 3 1 2 3 1 2 3
#Levels: 1 2 3

# LABELS FOR FACTOR ########################################

x4  <- c(1:3)
df4 <- cbind.data.frame(x4, y)
df4$x4 <- factor(df4$x4,
  levels = c(1, 2, 3),
  labels = c("macOS", "Windows", "Linux"))
df4
#       x4 y
#1   macOS 1
#2 Windows 2
#3   Linux 3
#4   macOS 4
#5 Windows 5
#6   Linux 6
#7   macOS 7
#8 Windows 8
#9   Linux 9


typeof(df4$x4)
#[1] "integer"


str(df4)
#'data.frame':	9 obs. of  2 variables:
#  $ x4: Factor w/ 3 levels "macOS","Windows",..: 1 2 3 1 2 3 1 2 3
#  $ y : int  1 2 3 4 5 6 7 8 9

# ORDERED FACTORS AND LABELS ###############################

x5  <- c(1:3)
df5 <- cbind.data.frame(x5, y)
(df5$x5 <- ordered(df5$x5,
  levels = c(3, 1, 2),
  labels = c("No", "Maybe", "Yes")))
# [1] Maybe Yes   No    Maybe Yes   No    Maybe Yes   No   
# Levels: No < Maybe < Yes
df5
#    x5 y
#1 Maybe 1
#2   Yes 2
#3    No 3
#4 Maybe 4
#5   Yes 5
#6    No 6
#7 Maybe 7
#8   Yes 8
#9    No 9
typeof(df5$x5)
#[1] "integer"
str(df5)
#'data.frame':	9 obs. of  2 variables:
# $ x5: Ord.factor w/ 3 levels "No"<"Maybe"<"Yes": 2 3 1 2 3 1 2 3 1
# $ y : int  1 2 3 4 5 6 7 8 9





# CLEAN UP #################################################

# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L

# Clear mind :)
