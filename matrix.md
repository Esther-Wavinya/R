# What's a matrix?
In R, a matrix is a collection of elements of the same data type (numeric, character, or logical) arranged into a fixed number of rows and columns. Since you are only working with rows and columns, a matrix is called two-dimensional.

You can construct a matrix in R with the `matrix()` function. Consider the following example:

```
matrix(1:9, byrow = TRUE, nrow = 3)
```

In the `matrix()` function:

- The first argument is the collection of elements that R will arrange into the rows and columns of the matrix. Here, we use `1:9` which is a shortcut for `c(1, 2, 3, 4, 5, 6, 7, 8, 9)`.
- The argument `byrow` indicates that the matrix is filled by the rows. If we want the matrix to be filled by the columns, we just place `byrow = FALSE`.
- The third argument `nrow` indicates that the matrix should have three rows.


## Instructions
Construct a matrix with 3 rows containing the numbers 1 up to 9, filled row-wise

```
# Construct a matrix with 3 rows that contain the numbers 1 up to 9

matrix(1:9, byrow = TRUE, nrow = 3)
```

Output after running code:
```

matrix(1:9, byrow = TRUE, nrow = 3)
     [,1] [,2] [,3]
[1,]    1    2    3
[2,]    4    5    6
[3,]    7    8    
```

# Analyze matrices, you shall
It is now time to get your hands dirty. In the following exercises you will analyze the box office numbers of the Star Wars franchise. May the force be with you!

In the editor, three vectors are defined. Each one represents the box office numbers from the first three Star Wars movies. The first element of each vector indicates the US box office revenue, the second element refers to the Non-US box office (source: Wikipedia).

In this exercise, you'll combine all these figures into a single vector. Next, you'll build a matrix from this vector.

## Instructions
- Use `c(new_hope, empire_strikes, return_jedi)` to combine the three vectors into one vector. Call this vector `box_office`.
- Construct a matrix with 3 rows, where each row represents a movie. Use the `matrix()` function to do this. The first argument is the vector `box_office`, containing all box office figures. Next, you'll have to specify `nrow = 3` and `byrow = TRUE`. Name the resulting matrix `star_wars_matrix`.

```
# Box office Star Wars (in millions!)
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)

# Create box_office
box_office <- c(new_hope, empire_strikes, return_jedi)

# Construct star_wars_matrix
star_wars_matrix <- matrix(box_office, nrow = 3, byrow = TRUE)
star_wars_matrix
```

Output after running code:
```
# Construct star_wars_matrix
star_wars_matrix <- matrix(box_office, nrow = 3, byrow = TRUE)
star_wars_matrix
        [,1]  [,2]
[1,] 460.998 314.4
[2,] 290.475 247.9
[3,] 309.306 165.8
```



# Naming a matrix
To help you remember what is stored in `star_wars_matrix`, you would like to add the names of the movies for the rows. Not only does this help you to read the data, but it is also useful to select certain elements from the matrix.

Similar to vectors, you can add names for the rows and the columns of a matrix

```
rownames(my_matrix) <- row_names_vector
colnames(my_matrix) <- col_names_vector
```

We went ahead and prepared two vectors for you: `region`, and `titles`. You will need these vectors to name the columns and rows of `star_wars_matrix`, respectively.

## Instructions
- Use `colnames()` to name the columns of `star_wars_matrix` with the `region vector`.
- Use `rownames()` to name the rows of `star_wars_matrix` with the `titles vector`.
- Print out `star_wars_matrix` to see the result of your work.


```
# Box office Star Wars (in millions!)
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)

# Construct matrix
star_wars_matrix <- matrix(c(new_hope, empire_strikes, return_jedi), nrow = 3, byrow = TRUE)

# Vectors region and titles, used for naming
region <- c("US", "non-US")
titles <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")

# Name the columns with region
colnames(star_wars_matrix) <- region

# Name the rows with titles
rownames(star_wars_matrix) <- titles

# Print out star_wars_matrix
star_wars_matrix
```

Output after running code:
```
# Print out star_wars_matrix
star_wars_matrix
                             US non-US
A New Hope              460.998  314.4
The Empire Strikes Back 290.475  247.9
Return of the Jedi      309.306  165.8
```


# Calculating the worldwide box office
The single most important thing for a movie in order to become an instant legend in Tinseltown is its worldwide box office figures.

To calculate the total box office revenue for the three Star Wars movies, you have to take the sum of the US revenue column and the non-US revenue column.

In R, the function `rowSums()` conveniently calculates the totals for each row of a matrix. This function creates a new vector:

```
rowSums(my_matrix)
```

## Instructions
Calculate the worldwide box office figures for the three movies and put these in the vector named `worldwide_vector`.

```
# Construct star_wars_matrix
box_office <- c(460.998, 314.4, 290.475, 247.900, 309.306, 165.8)
region <- c("US", "non-US")
titles <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")
               
star_wars_matrix <- matrix(box_office, nrow = 3, byrow = TRUE, dimnames = list(titles, region))

# Calculate worldwide box office figures
worldwide_vector <- rowSums(star_wars_matrix)
worldwide_vector
```

Output after running `worldwide_vector`:

```
# Calculate worldwide box office figures
worldwide_vector <- rowSums(star_wars_matrix)
worldwide_vector
             A New Hope The Empire Strikes Back      Return of the Jedi 
                775.398                 538.375                 475.106
```


# Adding a column for the Worldwide box office
In the previous exercise you calculated the vector that contained the worldwide box office receipt for each of the three Star Wars movies. However, this vector is not yet part of `star_wars_matrix`.

You can add a column or multiple columns to a matrix with the `cbind()` function, which merges matrices and/or vectors together by column. For example:

```
big_matrix <- cbind(matrix1, matrix2, vector1 ...)
```

## Instructions
Add `worldwide_vector` as a new column to the `star_wars_matrix` and assign the result to `all_wars_matrix`. Use the `cbind()` function.

```
# Construct star_wars_matrix
box_office <- c(460.998, 314.4, 290.475, 247.900, 309.306, 165.8)
region <- c("US", "non-US")
titles <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")
               
star_wars_matrix <- matrix(box_office, nrow = 3, byrow = TRUE, dimnames = list(titles, region))

# The worldwide box office figures
worldwide_vector <- rowSums(star_wars_matrix)
worldwide_vector

# Bind the new variable worldwide_vector as a column to star_wars_matrix
all_wars_matrix <- cbind(star_wars_matrix, worldwide_vector)
all_wars_matrix
```

Output after runnning code `all_wars_matrix` & `worldwide_vector`
```
# The worldwide box office figures
worldwide_vector <- rowSums(star_wars_matrix)
worldwide_vector
             A New Hope The Empire Strikes Back      Return of the Jedi 
                775.398                 538.375                 475.106 

# Bind the new variable worldwide_vector as a column to star_wars_matrix
all_wars_matrix <- cbind(star_wars_matrix, worldwide_vector)
all_wars_matrix
                             US non-US worldwide_vector
A New Hope              460.998  314.4          775.398
The Empire Strikes Back 290.475  247.9          538.375
Return of the Jedi      309.306  165.8          475.106
```

# Adding a row
Just like every action has a reaction, every `cbind()` has an `rbind()`. (We admit, we are pretty bad with metaphors.)

Your R workspace, where all variables you defined 'live' (check out what a workspace is), has already been initialized and contains two matrices:

- `star_wars_matrix` that we have used all along, with data on the original trilogy,
- `star_wars_matrix2`, with similar data for the prequels trilogy.


Explore these matrices in the console if you want to have a closer look. If you want to check out the contents of the workspace, you can type `ls()` in the console.

## Instructions
Use `rbind()` to paste together `star_wars_matrix` and `star_wars_matrix2`, in this order. Assign the resulting matrix to `all_wars_matrix`.

```
# star_wars_matrix and star_wars_matrix2 are available in your workspace
star_wars_matrix  
star_wars_matrix2 


# Combine both Star Wars trilogies in one matrix
all_wars_matrix <- rbind(star_wars_matrix, star_wars_matrix2)
all_wars_matrix
```

Output after running code:
```
# star_wars_matrix and star_wars_matrix2 are available in your workspace
star_wars_matrix  
                           US non-US
A New Hope              461.0  314.4
The Empire Strikes Back 290.5  247.9
Return of the Jedi      309.3  165.8

star_wars_matrix2 
                        US non-US
The Phantom Menace   474.5  552.5
Attack of the Clones 310.7  338.7
Revenge of the Sith  380.3  468.5

# Combine both Star Wars trilogies in one matrix
all_wars_matrix <- rbind(star_wars_matrix, star_wars_matrix2)
all_wars_matrix
                           US non-US
A New Hope              461.0  314.4
The Empire Strikes Back 290.5  247.9
Return of the Jedi      309.3  165.8
The Phantom Menace      474.5  552.5
Attack of the Clones    310.7  338.7
Revenge of the Sith     380.3  468.5
```


# The total box office revenue for the entire saga
Just like `cbind()` has `rbind()`, `colSums()` has `rowSums()`. Your R workspace already contains the `all_wars_matrix` that you constructed in the previous exercise; type `all_wars_matrix` to have another look. Let's now calculate the total box office revenue for the entire saga.

## Instructions
- Calculate the total revenue for the US and the non-US region and assign `total_revenue_vector`. You can use the `colSums()` function.
- Print out `total_revenue_vector` to have a look at the results.

```
# all_wars_matrix is available in your workspace
all_wars_matrix

# Total revenue for US and non-US
total_revenue_vector <- colSums(all_wars_matrix)
  
# Print out total_revenue_vector
total_revenue_vector
```

Output after running `total_revenue_vector`:
```
# all_wars_matrix is available in your workspace
all_wars_matrix
                           US non-US
A New Hope              461.0  314.4
The Empire Strikes Back 290.5  247.9
Return of the Jedi      309.3  165.8
The Phantom Menace      474.5  552.5
Attack of the Clones    310.7  338.7
Revenge of the Sith     380.3  468.5

# Total revenue for US and non-US
total_revenue_vector <- colSums(all_wars_matrix)
  
# Print out total_revenue_vector
total_revenue_vector
    US non-US 
2226.3 2087.8 
```

# Selection of matrix elements
Similar to vectors, you can use the square brackets `[ ]` to select one or multiple elements from a matrix. Whereas vectors have one dimension, matrices have two dimensions. You should therefore use a comma to separate the rows you want to select from the columns. For example:

- `my_matrix[1,2]` selects the element at the first row and second column.
- `my_matrix[1:3,2:4]` results in a matrix with the data on the rows 1, 2, 3 and columns 2, 3, 4.


If you want to select all elements of a row or a column, no number is needed before or after the comma, respectively:

- `my_matrix[,1]` selects all elements of the first column.
- `my_matrix[1,]` selects all elements of the first row.


Back to Star Wars with this newly acquired knowledge! As in the previous exercise, `all_wars_matrix` is already available in your workspace.

## Instructions
- Select the non-US revenue for all movies (the entire second column of `all_wars_matrix`), store the result as `non_us_all`.
- Use `mean()` on `non_us_all` to calculate the average non-US revenue for all movies. Simply print out the result.
- This time, select the non-US revenue for the first two movies in `all_wars_matrix`. Store the result as `non_us_some`.
- Use `mean()` again to print out the average of the values in `non_us_some`.

```
# all_wars_matrix is available in your workspace
all_wars_matrix

# Select the non-US revenue for all movies
non_us_all <- all_wars_matrix[,2]
non_us_all
  
# Average non-US revenue
mean(non_us_all)
  
# Select the non-US revenue for first two movies
non_us_some <- all_wars_matrix[1:2, 2]
non_us_some
  
# Average non-US revenue for first two movies
mean(non_us_some)
```
Output after running code:
```
# all_wars_matrix is available in your workspace
all_wars_matrix
                           US non-US
A New Hope              461.0  314.4
The Empire Strikes Back 290.5  247.9
Return of the Jedi      309.3  165.8
The Phantom Menace      474.5  552.5
Attack of the Clones    310.7  338.7
Revenge of the Sith     380.3  468.5

# Select the non-US revenue for all movies
non_us_all <- all_wars_matrix[,2]
non_us_all
             A New Hope The Empire Strikes Back      Return of the Jedi 
                  314.4                   247.9                   165.8 
     The Phantom Menace    Attack of the Clones     Revenge of the Sith 
                  552.5                   338.7                   468.5 
  
# Average non-US revenue
mean(non_us_all)
[1] 347.9667
  
# Select the non-US revenue for first two movies
non_us_some <- all_wars_matrix[1:2, 2]
non_us_some
             A New Hope The Empire Strikes Back 
                  314.4                   247.9 
  
# Average non-US revenue for first two movies
mean(non_us_some)
[1] 281.15
```

# A little arithmetic with matrices
Similar to what you have learned with vectors, the standard operators like `+`, `-`, `/`, `*`, etc. work in an element-wise way on matrices in R.

For example, `2 * my_matrix` multiplies each element of `my_matrix` by two.

As a newly-hired data analyst for Lucasfilm, it is your job to find out how many visitors went to each movie for each geographical area. You already have the total revenue figures in `all_wars_matrix`. Assume that the price of a ticket was 5 dollars. Simply dividing the box office numbers by this ticket price gives you the number of visitors.


## Instructions
- Divide `all_wars_matrix` by 5, giving you the number of visitors in millions. Assign the resulting matrix to `visitors`.
- Print out `visitors` so you can have a look

```
# all_wars_matrix is available in your workspace
all_wars_matrix

# Estimate the visitors
visitors <- all_wars_matrix / 5
  
# Print the estimate to the console
visitors
```

Output after running code:
```
# all_wars_matrix is available in your workspace
all_wars_matrix
                           US non-US
A New Hope              461.0  314.4
The Empire Strikes Back 290.5  247.9
Return of the Jedi      309.3  165.8
The Phantom Menace      474.5  552.5
Attack of the Clones    310.7  338.7
Revenge of the Sith     380.3  468.5


# Estimate the visitors
visitors <- all_wars_matrix / 5
  
# Print the estimate to the console
visitors
                           US non-US
A New Hope              92.20  62.88
The Empire Strikes Back 58.10  49.58
Return of the Jedi      61.86  33.16
The Phantom Menace      94.90 110.50
Attack of the Clones    62.14  67.74
Revenge of the Sith     76.06  93.70
```


# A little arithmetic with matrices (2)
Just like `2 * my_matrix` multiplied every element of `my_matrix` by two, `my_matrix1 * my_matrix2` creates a matrix where each element is the product of the corresponding elements in `my_matrix1` and `my_matrix2`.

After looking at the result of the previous exercise, big boss Lucas points out that the ticket prices went up over time. He asks to redo the analysis based on the prices you can find in `ticket_prices_matrix` (source: imagination).

Those who are familiar with matrices should note that this is not the standard matrix multiplication for which you should use `%*%` in R.

## Instructions
- Divide `all_wars_matrix` by `ticket_prices_matrix` to get the estimated number of US and non-US visitors for the six movies. Assign the result to `visitors`.
- From the `visitors` matrix, select the entire first column, representing the number of visitors in the US. Store this selection as `us_visitors`.
- Calculate the average number of US visitors; print out the result.

```
# all_wars_matrix and ticket_prices_matrix are available in your workspace
all_wars_matrix
ticket_prices_matrix

# Estimated number of visitors
visitors <- all_wars_matrix / ticket_prices_matrix

# US visitors
us_visitors <- visitors[,1]
us_visitors

# Average number of US visitors
mean(us_visitors)
```

Output after running code:
```
# all_wars_matrix and ticket_prices_matrix are available in your workspace
all_wars_matrix
                           US non-US
A New Hope              461.0  314.4
The Empire Strikes Back 290.5  247.9
Return of the Jedi      309.3  165.8
The Phantom Menace      474.5  552.5
Attack of the Clones    310.7  338.7
Revenge of the Sith     380.3  468.5

ticket_prices_matrix
                         US non-US
A New Hope              5.0    5.0
The Empire Strikes Back 6.0    6.0
Return of the Jedi      7.0    7.0
The Phantom Menace      4.0    4.0
Attack of the Clones    4.5    4.5
Revenge of the Sith     4.9    4.9

# Estimated number of visitors
visitors <- all_wars_matrix / ticket_prices_matrix

# US visitors
us_visitors <- visitors[,1]
us_visitors
             A New Hope The Empire Strikes Back      Return of the Jedi 
               92.20000                48.41667                44.18571 
     The Phantom Menace    Attack of the Clones     Revenge of the Sith 
              118.62500                69.04444                77.61224 

# Average number of US visitors
mean(us_visitors)
[1] 75.01401
```


