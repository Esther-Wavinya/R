# Variable assignment
A basic concept in (statistical) programming is called `a variable`.

A variable allows you to store `a value (e.g. 4)` or `an object` (e.g. a function description) in R.

You can then later use this variable's name to easily access the value or the object that is stored within this variable.

You can assign `a value 4` to a `variable my_var` with the command

```
my_var <- 4
```

# Instructions
Over to you: complete the code such that it assigns the `value 42` to the `variable x`. Submit the answer. Notice that when you ask `R` to `print x`, the value `42` appears.

```
# Assign the value 42 to x
x <- 42

# Print out the value of the variable x
x
```

## Answer
```
> X <- 42
> X
[1] 42
```


Suppose you have a fruit basket with `five` apples. As a data analyst, you want to store the number of apples in a variable with the name `my_apples`.

# Instructions
Type the following code in an editor: `my_apples <- 5`. This will assign the value `5 to my_apples`.

Type: `my_apples` below the second comment. This will print out the `value of my_apples`.

Submit your answer, and look at the output: you see that the number 5 is printed. So `R` now links the `variable my_apples` to the `value 5`.

```
# Assign the value 5 to the variable my_apples
my_apples <- 5

# Print out the value of the variable my_apples
my_apples
```

Every tasty fruit basket needs oranges, so you decide to add `six oranges`. As a data analyst, your reflex is to immediately create the variable `my_oranges` and assign the `value 6` to it. 

Next, you want to calculate how many pieces of fruit you have in total. Since you have given meaningful names to these values, you can now code this in a clear way:

`my_apples + my_oranges`

# Instructions
Assign to `my_oranges` the `value 6`.

`Add` the variables `my_apples and my_oranges` and have R simply print the result.

`Assign` the result of adding my_apples and my_oranges to a new variable `my_fruit`.

```
# Assign a value to the variables my_apples and my_oranges
my_apples <- 5
my_oranges <- 6

# Add these two variables together
my_apples + my_oranges

# Create the variable my_fruit
my_fruit <- my_apples +  my_oranges
```

## Answer
```
> my_apples <- 5
> my_oranges <- 6
> my_apples + my_oranges
[1] 11
> my_fruit = my_apples + my_oranges
> my_fruit
[1] 11
```


# Apples and oranges
Common knowledge tells you not to add apples and oranges. But hey, that is what you just did, no :-)? The `my_apples` and `my_oranges` variables both contained `a number` in the previous exercise. The `+` operator works with `numeric variables in R`. 

If you really tried to add `"apples"` and `"oranges"`, and assigned `a text value` to the `variable my_oranges`, you would be trying to assign the `addition` of a `numeric` and `a character variable` to the `variable my_fruit`. 

`This is not possible`.

# Instructions
Submit the answer and read the `error message`. Make sure to understand why this did not work.

Adjust the code so that R knows you have 6 oranges and thus a fruit basket with 11 pieces of fruit.

```
# Assign a value to the variable my_apples
my_apples <- 5 

# Fix the assignment of my_oranges
my_oranges <- "six" 

# Create the variable my_fruit and print it out
my_fruit <- my_apples + my_oranges 
my_fruit
`Error: non-numeric argument to binary operator`
```

## Answer
```
> my_apples <- 5
> my_oranges <- "six"
> my_apples + my_oranges
Error in my_apples + my_oranges : non-numeric argument to binary operator
> my_fruit = my_apples + my_oranges
Error in my_apples + my_oranges : non-numeric argument to binary operator
> my_fruit
[1] 11
```


After Variables, We are going to learn about [Vectors](https://github.com/Esther-Wavinya/R/blob/master/vector.md)