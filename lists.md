Lists, why would you need them?
Congratulations! At this point in the course you are already familiar with:

- **Vectors** (one dimensional array): can hold numeric, character or logical values. The elements in a vector all have the same data type.
- **Matrices** (two dimensional array): can hold numeric, character or logical values. The elements in a matrix all have the same data type.
- **Data frames** (two-dimensional objects): can hold numeric, character or logical values. Within a column all elements have the same data type, but different columns can be of different data type.

A **list** in R is similar to your to-do list at work or school: the different items on that list most likely differ in length, characteristic, and type of activity that has to be done.

A list in R allows you to gather a variety of objects under one name (that is, the name of the list) in an ordered way. These objects can be matrices, vectors, data frames, even other lists, etc. It is not even required that these objects are related to each other in any way.

You could say that a list is some kind super data type: you can store practically any piece of information in it!

# Creating a list
Let us create our first list! To construct a list you use the function `list()`:

```
my_list <- list(comp1, comp2 ...)
```

The arguments to the list function are the list components. Remember, these components can be matrices, vectors, other lists, …

## Instructions
Construct a list, named `my_list`, that contains the variables `my_vector`, `my_matrix` and `my_df` as list components

```
# Vector with numerics from 1 up to 10
my_vector <- 1:10 

# Matrix with numerics from 1 up to 9
my_matrix <- matrix(1:9, ncol = 3)

# First 10 elements of the built-in data frame mtcars
my_df <- mtcars[1:10,]

# Construct list with these different elements:
my_list <- list(my_vector, my_matrix, my_df)
my_list
```

Output after running code:
```
# Construct list with these different elements:
my_list <- list(my_vector, my_matrix, my_df)
my_list
[[1]]
 [1]  1  2  3  4  5  6  7  8  9 10

[[2]]
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9

[[3]]
                   mpg cyl  disp  hp drat    wt  qsec vs am gear carb
Mazda RX4         21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag     21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
Datsun 710        22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
Hornet 4 Drive    21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
Hornet Sportabout 18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
Valiant           18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
Duster 360        14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
Merc 240D         24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
Merc 230          22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
Merc 280          19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
```


# Creating a named list
Well done, you're on a roll!

Just like on your to-do list, you want to avoid not knowing or remembering what the components of your list stand for. That is why you should give names to them:

```
my_list <- list(name1 = your_comp1, 
                name2 = your_comp2)
```

This creates a list with components that are named `name1`, `name2`, and so on. If you want to name your lists after you've created them, you can use the `names()` function as you did with vectors. The following commands are fully equivalent to the assignment above:

```
my_list <- list(your_comp1, your_comp2)
names(my_list) <- c("name1", "name2")
```

## Instructions
- Change the code of the previous exercise (see editor) by adding names to the components. Use for `my_vector` the name `vec`, for `my_matrix` the name `mat` and for `my_df` the name `df`.
- Print out `my_list` so you can inspect the output.

```
# Vector with numerics from 1 up to 10
my_vector <- 1:10 

# Matrix with numerics from 1 up to 9
my_matrix <- matrix(1:9, ncol = 3)

# First 10 elements of the built-in data frame mtcars
my_df <- mtcars[1:10,]

# Adapt list() call to give the components names
my_list <- list(vec = my_vector, mat = my_matrix, df = my_df)

# Print out my_list
my_list
```

Output after running code:
```
# Vector with numerics from 1 up to 10
my_vector <- 1:10 
# Matrix with numerics from 1 up to 9
my_matrix <- matrix(1:9, ncol = 3)

# First 10 elements of the built-in data frame mtcars
my_df <- mtcars[1:10,]

# Adapt list() call to give the components names
my_list <- list(vec = my_vector, mat = my_matrix, df = my_df)

# Print out my_list
my_list

$vec
 [1]  1  2  3  4  5  6  7  8  9 10

$mat
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9

$df
                   mpg cyl  disp  hp drat    wt  qsec vs am gear carb
Mazda RX4         21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag     21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
Datsun 710        22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
Hornet 4 Drive    21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
Hornet Sportabout 18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
Valiant           18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
Duster 360        14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
Merc 240D         24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
Merc 230          22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
Merc 280          19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
```

# Creating a named list (2)
Being a huge movie fan (remember your job at LucasFilms), you decide to start storing information on good movies with the help of lists.

Start by creating a list for the movie "The Shining". We have already created the variables `mov`, `act` and `rev` in your R workspace. Feel free to check them out in the console.

## Instructions
Complete the code in the editor to create `shining_list`; it contains three elements:

- `moviename`: a character string with the movie title (stored in `mov`)
- `actors`: a vector with the main actors' names (stored in `act`)
- `reviews`: a data frame that contains some reviews (stored in `rev`)


Do not forget to name the list components accordingly (names are `moviename`, `actors` and `reviews`).

```
# The variables mov, act and rev are available

# Finish the code to build shining_list
shining_list <- list(moviename = mov, actors = act, reviews = rev)
shining_list
```

Output after running code:
```
# The variables mov, act and rev are available
# Finish the code to build shining_list
shining_list <- list(moviename = mov, actors = act, reviews = rev)
shining_list

$moviename
[1] "The Shining"

$actors
[1] "Jack Nicholson"   "Shelley Duvall"   "Danny Lloyd"      "Scatman Crothers"
[5] "Barry Nelson"    

$reviews
  scores sources                                              comments
1    4.5   IMDb1                     Best Horror Film I Have Ever Seen
2    4.0   IMDb2 A truly brilliant and scary film from Stanley Kubrick
3    5.0   IMDb3                 A masterpiece of psychological horror
```

# Selecting elements from a list
Your list will often be built out of numerous elements and components. Therefore, getting a single element, multiple elements, or a component out of it is not always straightforward.

One way to select a component is using the numbered position of that component. For example, to "grab" the first component of `shining_list` you type

```
shining_list[[1]]
```

A quick way to check this out is typing it in the console. Important to remember: to select elements from vectors, you use single square brackets: `[ ]`. Don't mix them up!

You can also refer to the names of the components, with `[[ ]]` or with the `$` sign. Both will select the data frame representing the reviews:

```
shining_list[["reviews"]]
shining_list$reviews
```

Besides selecting components, you often need to select specific elements out of these components. For example, with `shining_list[[2]][1]` you select from the second component, `actors` `(shining_list[[2]])`, the first element `([1])`. When you type this in the console, you will see the answer is Jack Nicholson.


## Instructions
- Select from `shining_list` the vector representing the actors. Simply print out this vector.
- Select from `shining_list` the second element in the vector representing the actors. Do a printout like before.

```
# shining_list is already pre-loaded in the workspace
shining_list
# Print out the vector representing the actors
shining_list$actors

# Print the second element of the vector representing the actors
shining_list[[2]][2]
```

Output after running code:
```
# shining_list is already pre-loaded in the workspace
shining_list

$moviename
[1] "The Shining"

$actors
[1] "Jack Nicholson"   "Shelley Duvall"   "Danny Lloyd"      "Scatman Crothers"
[5] "Barry Nelson"    

$reviews
  scores sources                                              comments
1    4.5   IMDb1                     Best Horror Film I Have Ever Seen
2    4.0   IMDb2 A truly brilliant and scary film from Stanley Kubrick
3    5.0   IMDb3                 A masterpiece of psychological horror

# Print out the vector representing the actors
shining_list$actors
[1] "Jack Nicholson"   "Shelley Duvall"   "Danny Lloyd"      "Scatman Crothers"
[5] "Barry Nelson"    

# Print the second element of the vector representing the actors
shining_list[[2]][2]
[1] "Shelley Duvall"
```


# Creating a new list for another movie
You found reviews of another, more recent, Jack Nicholson movie: The Departed!

| Scores	 | Comments                  |
| ---------  | ------------------------  |
| 4.6	     | I would watch it again    |
| 5	         |  Amazing!                 |
| 4.8         |  	I liked it           |
| 5	         |   One of the best movies  |
| 4.2	     |    Fascinating plot       |

It would be useful to collect together all the pieces of information about the movie, like the title, actors, and reviews into a single variable. Since these pieces of data are different shapes, it is natural to combine them in a list variable.

`movie_title`, containing the title of the movie, and `movie_actors`, containing the names of some of the actors in the movie, are available in your workspace.

## Instructions
- Create two vectors, called `scores` and `comments`, that contain the information from the reviews shown in the table.
- Find the average of the `scores` vector and save it as `avg_review`.
- Combine the `scores` and `comments` vectors into a data frame called `reviews_df`.
- Create a list, called `departed_list`, that contains the `movie_title`, `movie_actors`, reviews data frame as `reviews_df`, and the average review score as `avg_review`, and print it out.

```
# Use the table from the exercise to define the comments and scores vectors
scores <- c(4.6, 5, 4.8, 5, 4.2)
comments <- c("I would watch it again", "Amazing!", "I liked it", "One of the best movies", "Fascinating plot") 

# Save the average of the scores vector as avg_review
avg_review <- mean(scores)
avg_review

# Combine scores and comments into the reviews_df data frame
reviews_df <- data.frame(scores, comments)
reviews_df

# Create and print out a list, called departed_list
departed_list <- list(movie_title, movie_actors, reviews_df, avg_review)
departed_list
```

Output after running code:
```
# Use the table from the exercise to define the comments and scores vectors
scores <- c(4.6, 5, 4.8, 5, 4.2)
comments <- c("I would watch it again", "Amazing!", "I liked it", "One of the best movies", "Fascinating plot") 

# Save the average of the scores vector as avg_review
avg_review <- mean(scores)
avg_review
[1] 4.72

# Combine scores and comments into the reviews_df data frame
reviews_df <- data.frame(scores, comments)
reviews_df
  scores               comments
1    4.6 I would watch it again
2    5.0               Amazing!
3    4.8             I liked it
4    5.0 One of the best movies
5    4.2       Fascinating plot

# Create and print out a list, called departed_list
departed_list <- list(movie_title, movie_actors, reviews_df, avg_review)
departed_list

[[1]]
[1] "The Departed"

[[2]]
[1] "Leonardo DiCaprio" "Matt Damon"        "Jack Nicholson"   
[4] "Mark Wahlberg"     "Vera Farmiga"      "Martin Sheen"     

[[3]]
  scores               comments
1    4.6 I would watch it again
2    5.0               Amazing!
3    4.8             I liked it
4    5.0 One of the best movies
5    4.2       Fascinating plot

[[4]]
[1] 4.72
```

