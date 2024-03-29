# Basic data types in R
R works with numerous data types. Some of the most basic types to get started are:

Decimal values like `4.5` are called **numerics**.
Whole numbers like `4` are called **integers**. Integers are also numerics.
Boolean values (`TRUE` or `FALSE`) are called **logical**.
Text (or string) values are called **characters**.
Note how the quotation marks in the editor indicate that`"some text"` is a string.

# Instructions
Change the value of the:

`my_numeric` variable to `42`.

`my_character` variable to `"universe"`. Note that the quotation marks indicate that `"universe"` is a character.

`my_logical` variable to `FALSE`.

Note that R is case sensitive!

```
# Change my_numeric to be 42
my_numeric <- 42

# Change my_character to be "universe"
my_character <- "universe"

# Change my_logical to be FALSE
my_logical <- FALSE
```


## What's that data type?
When you add `5 + "six"`, you get an error due to a mismatch in data types? You can avoid such embarrassing situations by checking the data type of a variable beforehand. You can do this with the `class()` function, as the code below shows.

## Instructions

Complete the code and also print out the classes of `my_character` and `my_logical`.

```
# Declare variables of different types
my_numeric <- 42
my_character <- "universe"
my_logical <- FALSE 

# Check class of my_numeric
class(my_numeric)

# Check class of my_character
class(my_character)

# Check class of my_logical
class(my_logical)
```

## Answer
```
> my_numeric <- 42
> my_character <- "universe"
> my_logical = FALSE
> class(my_numeric)
[1] "numeric"
> class(my_character)
[1] "character"
> class(my_logical)
[1] "logical"
```

After Data types, We are going to learn about [Vectors](https://github.com/Esther-Wavinya/R/blob/master/vector.md)

