# Equality
The most basic form of comparison is equality. Let's briefly recap its syntax. The following statements all evaluate to `TRUE` (feel free to try them out in the console).

```
3 == (2 + 1)
"intermediate" != "r"
TRUE != FALSE
"Rchitect" != "rchitect"
```

Notice from the last expression that R is case sensitive: "R" is not equal to "r". Keep this in mind when solving the exercises in this chapter!


## Instructions
- In the editor on the right, write R code to see if `TRUE` equals `FALSE`.
- Likewise, check if `-6 * 14` is not equal to `17 - 101`.
- Next up: comparison of character strings. Ask R whether the strings "useR" and "user" are equal.
- Finally, find out what happens if you compare logicals to numerics: are `TRUE` and 1 equal?

```
# Comparison of logicals
TRUE == FALSE

# Comparison of numerics
-6 * 14 != 17 - 101

# Comparison of character strings
"useR" == "user"

# Compare a logical with a numeric
TRUE == 1
```

Output after running code:
```
# Comparison of logicals
TRUE == FALSE
[1] FALSE

# Comparison of numerics
-6 * 14 != 17 - 101
[1] FALSE

# Comparison of character strings
"useR" == "user"
[1] FALSE

# Compare a logical with a numeric
TRUE == 1
[1] TRUE
```

# Greater and less than
Apart from equality operators, Filip also introduced the *less than* and *greater than* operators: `<` and `>`. You can also add an equal sign to express less than or equal to or greater than or equal to, respectively. Have a look at the following R expressions, that all evaluate to `FALSE`:

```
(1 + 2) > 4
"dog" < "Cats"
TRUE <= FALSE
```

Remember that for string comparison, R determines the **greater than** relationship based on alphabetical order. Also, keep in mind that `TRUE` is treated as `1` for arithmetic, and `FALSE` is treated as `0`. Therefore, `FALSE < TRUE` is `TRUE`.


## Instructions
Write R expressions to check whether:

- `-6 * 5 + 2` is greater than or equal to `-10 + 1`.
- `"raining"` is less than or equal to `"raining dogs"`.
- `TRUE` is greater than `FALSE`.

```
# Comparison of numerics
-6 * 5 + 2 >= -10 + 1

# Comparison of character strings
"raining" <= "raining dogs"

# Comparison of logicals
TRUE > FALSE
```

Output after running code:
```
# Comparison of numerics
-6 * 5 + 2 >= -10 + 1
[1] FALSE

# Comparison of character strings
"raining" <= "raining dogs"
[1] TRUE

# Comparison of logicals
TRUE > FALSE
[1] TRUE
```

# Compare vectors
You are already aware that R is very good with vectors. Without having to change anything about the syntax, R's relational operators also work on vectors.

Let's go back to the example that was started in the video. You want to figure out whether your activity on social media platforms have paid off and decide to look at your results for LinkedIn and Facebook. The sample code in the editor initializes the vectors `linkedin` and `facebook`. Each of the vectors contains the number of profile views your LinkedIn and Facebook profiles had over the last seven days.


## Instructions
Using relational operators, find a logical answer, i.e. `TRUE` or `FALSE`, for the following questions:

- On which days did the number of LinkedIn profile views exceed 15?
- When was your LinkedIn profile viewed only 5 times or fewer?
- When was your LinkedIn profile visited more often than your Facebook profile?

```
# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Popular days
linkedin > 15

# Quiet days
linkedin <= 5

# LinkedIn more popular than Facebook
linkedin > facebook
```

Output after running code:
```
# Popular days
linkedin > 15
[1]  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE

# Quiet days
linkedin <= 5
[1] FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE

# LinkedIn more popular than Facebook
linkedin > facebook
[1] FALSE  TRUE  TRUE FALSE FALSE  TRUE FALSE
```

# Compare matrices
R's ability to deal with different data structures for comparisons does not stop at vectors. Matrices and relational operators also work together seamlessly!

Instead of in vectors (as in the previous exercise), the LinkedIn and Facebook data is now stored in a matrix called `views`. The first row contains the LinkedIn information; the second row the Facebook information. The original vectors `facebook` and `linkedin` are still available as well.


## Instructions
Using the relational operators you've learned so far, try to discover the following:

- When were the views exactly equal to 13? Use the `views` matrix to return a logical matrix.
- For which days were the number of views less than or equal to 14? Again, have R return a logical matrix.

```
# The social data has been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)
views <- matrix(c(linkedin, facebook), nrow = 2, byrow = TRUE)

# When does views equal 13?
views == 13

# When is views less than or equal to 14?
views <= 14
```

Output after running code:
```
# When does views equal 13?
views == 13
      [,1]  [,2]  [,3]  [,4]  [,5]  [,6]  [,7]
[1,] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
[2,] FALSE FALSE FALSE FALSE FALSE  TRUE FALSE
# When is views less than or equal to 14?
views <= 14
      [,1] [,2] [,3]  [,4] [,5]  [,6] [,7]
[1,] FALSE TRUE TRUE  TRUE TRUE FALSE TRUE
[2,] FALSE TRUE TRUE FALSE TRUE  TRUE TRUE
```

# & and |
Before you work your way through the next exercises, have a look at the following R expressions. All of them will evaluate to `TRUE`:

```
TRUE & TRUE
FALSE | TRUE
5 <= 5 & 2 < 3
3 < 4 | 7 < 6
```

Watch out: `3 < x < 7` to check if `x` is between 3 and 7 will not work; you'll need `3 < x & x < 7` for that.

In this exercise, you'll be working with the `last` variable. This variable equals the last value of the `linkedin` vector that you've worked with previously. The `linkedin` vector represents the number of LinkedIn views your profile had in the last seven days, remember? Both the variables `linkedin` and `last` have been pre-defined for you.


## Instructions
Write R expressions to solve the following questions concerning the variable `last`:

- Is `last` under 5 or above 10?
- Is `last` between 15 and 20, excluding 15 but including 20?

```
# The linkedin and last variable are already defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
last <- tail(linkedin, 1)

# Is last under 5 or above 10?
last 
5 > last  | last > 10

# Is last between 15 (exclusive) and 20 (inclusive)?
15 < last & last < 20
```

Output after running code:
```
# Is last under 5 or above 10?
last 
[1] 14

5 > last  | last > 10
[1] TRUE

# Is last between 15 (exclusive) and 20 (inclusive)?
15 < last & last < 20
[1] FALSE
```

# & and | (2)
Like relational operators, logical operators work perfectly fine with vectors and matrices.

Both the vectors `linkedin` and `facebook` are available again. Also a matrix - `views` - has been defined; its first and second row correspond to the `linkedin` and `facebook` vectors, respectively. Ready for some advanced queries to gain more insights into your social outreach?


## Instructions
- When did LinkedIn views exceed 10 and did Facebook views fail to reach 10 for a particular day? Use the `linkedin` and `facebook` vectors.
- When were one or both of your LinkedIn and Facebook profiles visited at least 12 times?
- When is the `views` matrix equal to a number between 11 and 14, excluding 11 and including 14?

```
# The social data (linkedin, facebook, views) has been created for you
linkedin
facebook
views
# linkedin exceeds 10 but facebook below 10
linkedin > 10 & facebook < 10

# When were one or both visited at least 12 times?
linkedin >= 12 | facebook >= 12

# When is views between 11 (exclusive) and 14 (inclusive)?
11 < views & views <= 14
```

Output after running code:
```
# The social data (linkedin, facebook, views) has been created for you
linkedin
[1] 16  9 13  5  2 17 14

facebook
[1] 17  7  5 16  8 13 14

views
     [,1] [,2] [,3] [,4] [,5] [,6] [,7]
[1,]   16    9   13    5    2   17   14
[2,]   17    7    5   16    8   13   14

# linkedin exceeds 10 but facebook below 10
linkedin > 10 & facebook < 10
[1] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE

# When were one or both visited at least 12 times?
linkedin >= 12 | facebook >= 12
[1]  TRUE FALSE  TRUE  TRUE FALSE  TRUE  TRUE

# When is views between 11 (exclusive) and 14 (inclusive)?
11 < views & views <= 14
      [,1]  [,2]  [,3]  [,4]  [,5]  [,6] [,7]
[1,] FALSE FALSE  TRUE FALSE FALSE FALSE TRUE
[2,] FALSE FALSE FALSE FALSE FALSE  TRUE TRUE
```

# Reverse the result: !
On top of the `&` and `|` operators, you also learned about the `!` operator, which negates a logical value. To refresh your memory, here are some R expressions that use `!`. They all evaluate to `FALSE`:

```
!TRUE
!(5 > 3)
!!FALSE
```

What would the following set of R expressions return?

```
x <- 5
y <- 7
!(!(x < 4) & !!!(y > 12))
```

Output is `FALSE`

# Blend it all together
With the things you've learned by now, you're able to solve pretty cool problems.

Instead of recording the number of views for your own LinkedIn profile, suppose you conducted a survey inside the company you're working for. You've asked every employee with a LinkedIn profile how many visits their profile has had over the past seven days. You stored the results in a data frame called `li_df`. This data frame is available in the workspace; type `li_df` in the console to check it out.


## Instructions
- Select the entire second column, named `day2`, from the `li_df` data frame as a vector and assign it to `second`.
- Use `second` to create a logical vector, that contains `TRUE` if the corresponding number of views is strictly greater than 25 or strictly lower than 5 and `FALSE` otherwise. Store this logical vector as `extremes`.
- Use `sum()` on the `extremes` vector to calculate the number of `TRUEs` in `extremes` (i.e. to calculate the number of employees that are either very popular or very low-profile). Simply print this number to the console.

```
# li_df is pre-loaded in your workspace
li_df
# Select the second column, named day2, from li_df: second
second <- li_df$day2
second

# Build a logical vector, TRUE if value in second is extreme: extremes
extremes <- (second > 25 | 5 > second) == TRUE
extremes

# Count the number of TRUEs in extremes
sum(extremes)
```

Output after running code:
```
# li_df is pre-loaded in your workspace
li_df

            day1 day2 day3 day4 day5 day6 day7
employee_1     2    3    3    6    4    2    0
employee_2    19   23   18   22   23   29   25
employee_3    24   18   15   19   18   22   17
employee_4    22   18   27   26   19   21   25
employee_5    25   25   26   31   24   36   37
employee_6    22   20   29   26   23   22   29
employee_7     0    4    2    2    3    4    2
employee_8    12    3   15    7    1   15   11
employee_9    19   22   22   19   25   24   23
employee_10   23   12   19   25   18   22   22
employee_11   29   27   23   25   29   30   17
employee_12   13   13   20   17   12   22   20
employee_13    7   17    9    5   11    9    9
employee_14   26   27   28   36   29   31   30
employee_15    7    6    4   11    5    5   15
employee_16   32   35   31   35   24   25   36
employee_17    7   17    9   12   13    6   12
employee_18    9    6    3   12    3    8    6
employee_19    0    1   11    6    0    4   11
employee_20    9   12    6   13   12   13   11
employee_21    6   15   15   10    9    7   18
employee_22   17   17   12    4   14   17    7
employee_23    1   12    8    2    4    4   11
employee_24    5    8    0    1    6    3    1
employee_25    2    7    5    3    1    5    5
employee_26   29   25   32   28   28   27   27
employee_27   17   15   17   23   23   17   22
employee_28   26   32   33   30   33   28   26
employee_29   27   29   24   29   26   31   28
employee_30    4    1    1    2    1    7    4
employee_31   22   22   17   20   14   19   13
employee_32    9   11    7   10    8   15    5
employee_33    6    5   12    5   17   17    4
employee_34   18   17   12   22   22   13   12
employee_35    2   12   13    7   10    6    2
employee_36   32   26   20   23   24   25   21
employee_37    5   13   12   11    6    5   10
employee_38    6   10   11    6    6    2    5
employee_39   30   37   32   35   37   41   42
employee_40   34   33   32   35   33   27   35
employee_41   15   19   21   18   22   26   22
employee_42   28   29   30   19   21   19   26
employee_43    6    8    6    7   17   11   14
employee_44   17   22   27   24   18   28   24
employee_45    6   10   17   18   13   10    7
employee_46   18   19   22   17   21   15   23
employee_47   21   27   28   28   26   17   25
employee_48   10   18   20   18   12   19   17
employee_49    6   15   15   15   10   14    2
employee_50   30   28   29   31   24   20   25


# Select the second column, named day2, from li_df: second
second <- li_df$day2
second
 [1]  3 23 18 18 25 20  4  3 22 12 27 13 17 27  6 35 17  6  1 12 15 17 12  8  7
[26] 25 15 32 29  1 22 11  5 17 12 26 13 10 37 33 19 29  8 22 10 19 27 18 15 28

# Build a logical vector, TRUE if value in second is extreme: extremes
extremes <- (second > 25 | 5 > second) == TRUE
extremes
 [1]  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE  TRUE FALSE
[13] FALSE  TRUE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE
[25] FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE
[37] FALSE FALSE  TRUE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE
[49] FALSE  TRUE

# Count the number of TRUEs in extremes
sum(extremes)
[1] 16
```


# The if statement
Before diving into some exercises on the if statement, have another look at its syntax:

```
if (condition) {
  expr
}
```

Remember your vectors with social profile views? Let's look at it from another angle. The `medium` variable gives information about the social website; the `num_views` variable denotes the actual number of views that particular `medium` had on the last day of your recordings. Both variables have been pre-defined for you.

## Instructions
- Examine the `if` statement that prints out `"Showing LinkedIn information"` if the `medium` variable equals `"LinkedIn"`.
- Code an `if` statement that prints `"You are popular!"` to the console if the `num_views` variable exceeds `15`.

```
# Variables related to your last day of recordings
medium <- "LinkedIn"
num_views <- 14

# Examine the if statement for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
}

# Write the if statement for num_views
if (num_views > 15) {
  print("You are popular!")
}
```
Output after running code:
```
# Examine the if statement for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
}
[1] "Showing LinkedIn information"
# Write the if statement for num_views
if (num_views > 15) {
  print("You are popular!")
}
```

# Add an else
You can only use an `else` statement in combination with an `if` statement. The `else` statement does not require a condition; its corresponding code is simply run if all of the preceding conditions in the control structure are `FALSE`. Here's a recipe for its usage:

```
if (condition) {
  expr1
} else {
  expr2
}
```

It's important that the `else` keyword comes on the same line as the closing bracket of the `if` part!

Both `if` statements that you coded in the previous exercises are already available to use. It's now up to you to extend them with the appropriate `else` statements!


## Instructions
Add an `else` statement to both control structures, such that

- "Unknown medium" gets printed out to the console when the if-condition on `medium` does not hold.
- R prints out "Try to be more visible!" when the if-condition on `num_views` is not met.

```
# Variables related to your last day of recordings
medium <- "LinkedIn"
num_views <- 14

# Control structure for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
} else {
  print("Unknown medium")
}



# Control structure for num_views
if (num_views > 15) {
  print("You're popular!")
} else {
  print("Try to be more visible!")
}
```

Output after running code:
```
# Control structure for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
} else {
  print("Unknown medium")
}
[1] "Showing LinkedIn information"

# Control structure for num_views
if (num_views > 15) {
  print("You're popular!")
} else {
  print("Try to be more visible!")
}
[1] "Try to be more visible!"
```


# Customize further: else if
The `else if` statement allows you to further customize your control structure. You can add as many `else if` statements as you like. Keep in mind that R ignores the remainder of the control structure once a condition has been found that is `TRUE` and the corresponding expressions have been executed. Here's an overview of the syntax to freshen your memory:

```
if (condition1) {
  expr1
} else if (condition2) {
  expr2
} else if (condition3) {
  expr3
} else {
  expr4
}
```

Again, It's important that the `else if` keywords comes on the same line as the closing bracket of the previous part of the control construct!

## Instructions
Add code to both control structures such that:

- R prints out "Showing Facebook information" if `medium` is equal to "Facebook". Remember that R is case sensitive!
- "Your number of views is average" is printed if `num_views` is between 15 (inclusive) and 10 (exclusive). Feel free to change the variables `medium` and `num_views` to see how the control structure respond. In both cases, the existing code should be extended in the `else if` statement. No existing code should be modified.

```
# Variables related to your last day of recordings
medium <- "Facebook"
num_views <- 15

# Control structure for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
} else if (medium == "Facebook") {
  # Add code to print correct string when condition is TRUE
  print("Showing Facebook information")
} else {
  print("Unknown medium")
}

# Control structure for num_views
if (num_views > 15) {
  print("You're popular!")
} else if (num_views <= 15 & num_views > 10) {
  # Add code to print correct string when condition is TRUE
  print("Your number of views is average")
} else {
  print("Try to be more visible!")
}
```

Output after running code:
```
# Variables related to your last day of recordings
medium <- "Facebook"
num_views <- 15
# Control structure for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
} else if (medium == "Facebook") {
  # Add code to print correct string when condition is TRUE
  print("Showing Facebook information")
} else {
  print("Unknown medium")
}
[1] "Showing Facebook information"
# Control structure for num_views
if (num_views > 15) {
  print("You're popular!")
} else if (num_views <= 15 & num_views > 10) {
  # Add code to print correct string when condition is TRUE
  print("Your number of views is average")
} else {
  print("Try to be more visible!")
}
[1] "Your number of views is average"

# Variables related to your last day of recordings
medium <- "Facebook"
num_views <- 15
# Control structure for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
} else if (medium == "Facebook") {
  # Add code to print correct string when condition is TRUE
  print("Showing Facebook information")
} else {
  print("Unknown medium")
}
[1] "Showing Facebook information"

# Control structure for num_views
if (num_views > 15) {
  print("You're popular!")
} else if (num_views <= 15 & num_views > 10) {
  # Add code to print correct string when condition is TRUE
  print("Your number of views is average")
} else {
  print("Try to be more visible!")
}
[1] "Your number of views is average"
```

# Else if 2.0
You can do anything you want inside if-else constructs. You can even put in another set of conditional statements. Examine the following code chunk:

```
if (number < 10) {
  if (number < 5) {
    result <- "extra small"
  } else {
    result <- "small"
  }
} else if (number < 100) {
  result <- "medium"
} else {
  result <- "large"
}
print(result)
```

Have a look at the following statements:

1. If `number` is set to 6, "small" gets printed to the console.
2. If `number` is set to 100, R prints out "medium".
3. If `number` is set to 4, "extra small" gets printed out to the console.
4. If `number` is set to 2500, R will generate an error, as `result` will not be defined.

Select the option that lists all the true statements.
Answer: Option `1 and 3` are true statements.


# Take control!
In this exercise, you will combine everything that you've learned so far: relational operators, logical operators and control constructs. You'll need it all!

We've pre-defined two values for you: `li` and `fb`, denoting the number of profile views your LinkedIn and Facebook profile had on the last day of recordings. Go through the instructions to create R code that generates a 'social media score', `sms`, based on the values of `li` and `fb`.


## Instructions
Finish the control-flow construct with the following behavior:

- If both `li` and `fb` are 15 or higher, set `sms` equal to double the sum of `li` and `fb`.
- If both `li` and `fb` are strictly below 10, set `sms` equal to half the sum of `li` and `fb`.
- In all other cases, set `sms` equal to `li` + `fb`.
- Finally, print the resulting `sms` variable.

```
# Variables related to your last day of recordings
li <- 15
fb <- 9

# Code the control-flow construct
if (li >= 15 & fb >= 15) {
  sms <- 2 * (li + fb)
} else if (li < 10 & fb < 10) {
  sms <- 0.5 * (li + fb)
} else {
  sms <- li + fb
}

# Print the resulting sms to the console
sms
```

Output after running code:
```
# Print the resulting sms to the console
sms
[1] 24
```








