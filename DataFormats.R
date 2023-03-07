# File:   DataFormats.R
# Course: R: An Introduction (with RStudio)

# DATA TYPES ###############################################

# Numeric

n1 <- 15  # Double precision by default
n1
#[1] 15
typeof(n1)
[1] "double"



n2 <- 1.5
n2
#[1] 1.5
typeof(n2)
#[1] "double"



# Character

c1 <- "c"
c1
#[1] "c"
typeof(c1)
#[1] "character"

c2 <- "a string of text"
c2
#[1] "a string of text"
typeof(c2)
#[1] "character"

# Logical

l1 <- TRUE
l1
#[1] TRUE
typeof(l1)
#[1] "logical"

l2 <- F
l2
#[1] FALSE
typeof(l2)
#[1] "logical"


# DATA STRUCTURES ##########################################

## Vector ##################################################

v1 <- c(1, 2, 3, 4, 5)
v1
#[1] 1 2 3 4 5
is.vector(v1)
#[1] TRUE

v2 <- c("a", "b", "c")
v2
#[1] "a" "b" "c"
is.vector(v2)
#[1] TRUE

v3 <- c(TRUE, TRUE, FALSE, FALSE, TRUE)
v3
#[1]  TRUE  TRUE FALSE FALSE  TRUE
is.vector(v3)
#[1] TRUE

## Matrix ##################################################

m1 <- matrix(c(T, T, F, F, T, F), nrow = 2)
m1
#     [,1]  [,2]  [,3]
#[1,] TRUE FALSE  TRUE
#[2,] TRUE FALSE FALSE

m2 <- matrix(c("a", "b", 
               "c", "d"), 
               nrow = 2,
               byrow = T)
m2
#     [,1] [,2]
#[1,] "a"  "b" 
#[2,] "c"  "d" 

## Array ###################################################

# Give data, then dimemensions (rows, columns, tables)
a1 <- array(c( 1:24), c(4, 3, 2))
a1
#, , 1

#     [,1] [,2] [,3]
#[1,]    1    5    9
#[2,]    2    6   10
#[3,]    3    7   11
#[4,]    4    8   12

#, , 2

#     [,1] [,2] [,3]
#[1,]   13   17   21
#[2,]   14   18   22
#[3,]   15   19   23
#[4,]   16   20   24

## Data frame ##############################################

# Can combine vectors of the same length

vNumeric   <- c(1, 2, 3)
vCharacter <- c("a", "b", "c")
vLogical   <- c(T, F, T)

dfa <- cbind(vNumeric, vCharacter, vLogical)
dfa  # Matrix of one data type
#     vNumeric vCharacter vLogical
#[1,] "1"      "a"        "TRUE"  
#[2,] "2"      "b"        "FALSE" 
#[3,] "3"      "c"        "TRUE"  


df <- as.data.frame(cbind(vNumeric, vCharacter, vLogical))
df  # Makes a data frame with three different data types
#  vNumeric vCharacter vLogical
#1        1          a     TRUE
#2        2          b    FALSE
#3        3          c     TRUE


## List ####################################################

o1 <- c(1, 2, 3)
o2 <- c("a", "b", "c", "d")
o3 <- c(T, F, T, T, F)

list1 <- list(o1, o2, o3)
list1
#[[1]]
#[1] 1 2 3

#[[2]]
#[1] "a" "b" "c" "d"

#[[3]]
#[1]  TRUE FALSE  TRUE  TRUE FALSE


list2 <- list(o1, o2, o3, list1)  # Lists within lists!
list2
#[[1]]
#[1] 1 2 3

#[[2]]
#[1] "a" "b" "c" "d"

#[[3]]
#[1]  TRUE FALSE  TRUE  TRUE FALSE

#[[4]]
#[[4]][[1]]
#[1] 1 2 3

#[[4]][[2]]
#[1] "a" "b" "c" "d"

#[[4]][[3]]
#[1]  TRUE FALSE  TRUE  TRUE FALSE




# COERCING TYPES ###########################################

## Automatic coercion ######################################

# Goes to "least restrictive" data type

(coerce1 <- c(1, "b", TRUE))
#[1] "1"    "b"    "TRUE"
# coerce1  # Parenthese around command above make this moot
typeof(coerce1)
#[1] "character"

## Coerce numeric to integer ###############################

(coerce2 <- 5)
#[1] 5
typeof(coerce2)
#[1] "double"

(coerce3 <- as.integer(5))
#[1] 5
typeof(coerce3)
#[1] "integer"

## Coerce character to numeric #############################

(coerce4 <- c("1", "2", "3"))
#[1] "1" "2" "3"
typeof(coerce4)
#[1] "character"

(coerce5 <- as.numeric(c("1", "2", "3")))
#[1] 1 2 3
typeof(coerce5)
#[1] "double"

## Coerce matrix to data frame #############################

(coerce6 <- matrix(1:9, nrow= 3))
#     [,1] [,2] [,3]
#[1,]    1    4    7
#[2,]    2    5    8
#[3,]    3    6    9
is.matrix(coerce6)
#[1] TRUE

(coerce7 <- as.data.frame(matrix(1:9, nrow= 3)))
#  V1 V2 V3
#1  1  4  7
#2  2  5  8
#3  3  6  9
is.data.frame(coerce7)
#[1] TRUE


# CLEAN UP #################################################

# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L

# Clear mind :)
