# Arrays
Arrays are essential data storage structures defined by a fixed number of dimensions. Arrays are used for the allocation of space at contiguous memory locations. `Uni-dimensional` arrays are called `vectors` with the length being their only dimension. `Two-dimensional` arrays are called `matrices`, consisting of fixed numbers of rows and columns. `Arrays consist of all elements of the same data type`. Vectors are supplied as input to the function and then create an array based on the number of dimensions.

## Creating an Array
An array in R can be created with the use of `array()` function. List of elements is passed to the array() functions along 
with the dimensions as required.

**Syntax:**
```
array(data, dim = (nrow, ncol, nmat), dimnames=names)
```
**Where,**
```
nrow : Number of rows
ncol : Number of columns
nmat : Number of matrices of dimensions nrow * ncol
dimnames : Default value = NULL.
```

###Uni-Dimensional Array
A `vector` is a uni-dimensional array, which is specified by a single dimension, length. A Vector can be created using ‘**c()**‘ function. A list of values is passed to the c() function to create a vector.

**Example:**
```
vec1 <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)
print (vec1)
  
# cat is used to concatenate strings and print it.
cat ("Length of vector : ", length(vec1))
```

**Output**
```
[1] 1 2 3 4 5 6 7 8 9
Length of vector :  9
```

## Multi-Dimensional Array
A two-dimensional matrix is an array specified by a fixed number of rows and columns, each containing the same data type. A matrix is created by using **array()** function to which the values and the dimensions are passed.

**Example:**
```
# arranges data from 2 to 13 in two matrices of dimensions 2x3
arr = array(2:13, dim = c(2, 3, 2))
print(arr)
```

**Output:**
```
, , 1

     [,1] [,2] [,3]
[1,]    2    4    6
[2,]    3    5    7

, , 2

     [,1] [,2] [,3]
[1,]    8   10   12
[2,]    9   11   13
```

Vectors of different lengths can also be fed as input into the `array()` function. However, the total number of elements in all the vectors combined should be equal to the number of elements in the matrices. The elements are arranged in the order in which they are specified in the function.

**Example:**
```
vec1 <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)
vec2 <- c(10, 11, 12)
  
# elements are combined into a single vector, vec1 elements followed by vec2 elements.
arr = array(c(vec1, vec2), dim = c(2, 3, 2))
print (arr)
```

**Output:**
```
,, 1
     [, 1] [, 2] [, 3]
[1, ]    1    3    5
[2, ]    2    4    6
,, 2
     [, 1] [, 2] [, 3]
[1, ]    7    9   11
[2, ]    8   10   12
```

## Naming of Arrays
The row names, column names and matrices names are specified as a vector of the number of rows, number of columns and number of matrices respectively. By default, `the rows`, `columns` and `matrices` are named by their index values.

```
row_names <- c("row1", "row2")
col_names <- c("col1", "col2", "col3")
mat_names <- c("Mat1", "Mat2")
  
# the naming of the various elements is specified in a list and fed to the function
arr = array(2:14, dim = c(2, 3, 2), dimnames = list(row_names, col_names, mat_names))
print (arr)
```
**Output**
```
,, Mat1
     col1 col2 col3
row1    2    4    6
row2    3    5    7

,, Mat2
     col1 col2 col3
row1    8   10   12
row2    9   11   13
```

## Accessing arrays
The arrays can be accessed by using indices for different dimensions separated by commas. Different components can be specified by any combination of elements’ names or positions.

### Accessing Uni-Dimensional Array
The elements can be accessed by using indexes of the corresponding elements.
```
vec <- c(1:10)
  
# accessing entire vector
cat ("Vector is : ", vec)
  
# accessing elements
cat ("Third element of vector is : ", vec[3])
```

**Output**
```
Vector is :  1 2 3 4 5 6 7 8 9 10
Third element of vector is : 3
```

### Accessing entire matrices
```
vec1 <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)
vec2 <- c(10, 11, 12)
row_names <- c("row1", "row2")
col_names <- c("col1", "col2", "col3")
mat_names <- c("Mat1", "Mat2")
arr = array(c(vec1, vec2), dim = c(2, 3, 2), dimnames = list(row_names, col_names, mat_names))
  
# accessing matrix 1 by index value
print ("Matrix 1")
print (arr[,,1])
  
# accessing matrix 2 by its name
print ("Matrix 2")
print(arr[,,"Mat2"])
```

**Output**
```
[1] "Matrix 1"
     col1 col2 col3
row1    1    3    5
row2    2    4    6

[1] "Matrix 2"
     col1 col2 col3
row1    7    9   11
row2    8   10   12
```

### Accessing specific rows and columns of matrices
Rows and columns can also be accessed by both names as well as indices.
```
vec1 <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)
vec2 <- c(10, 11, 12)
row_names <- c("row1", "row2")
col_names <- c("col1", "col2", "col3")
mat_names <- c("Mat1", "Mat2")
arr = array(c(vec1, vec2), dim = c(2, 3, 2), dimnames = list(row_names, col_names, mat_names))
   
# accessing matrix 1 by index value
print ("1st column of matrix 1")
print (arr[, 1, 1])
  
# accessing matrix 2 by its name
print ("2nd row of matrix 2")
print(arr["row2",,"Mat2"])
```

**Output**
```
[1] "1st column of matrix 1"
row1 row2 
   1    2 

[1] "2nd row of matrix 2"
col1 col2 col3 
   8   10   12 
```   

### Accessing elements individually
Elements can be accessed by using both the row and column numbers or names.
```
vec1 <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)
vec2 <- c(10, 11, 12)
row_names <- c("row1", "row2")
col_names <- c("col1", "col2", "col3")
mat_names <- c("Mat1", "Mat2")
arr = array(c(vec1, vec2), dim = c(2, 3, 2), dimnames = list(row_names, col_names, mat_names))
  
# accessing matrix 1 by index value
print ("2nd row 3rd column matrix 1 element")
print (arr[2, "col3", 1])
  
# accessing matrix 2 by its name
print ("2nd row 1st column element of matrix 2")
print(arr["row2", "col1", "Mat2"])
```

**Output:**
```
[1] "2nd row 3rd column matrix 1 element"
[1] 6
[1] "2nd row 1st column element of matrix 2"
[1] 8
```

### Accessing subset of array elements
A smaller subset of the array elements can be accessed by defining a range of row or column limits.
```
row_names <- c("row1", "row2")
col_names <- c("col1", "col2", "col3", "col4")
mat_names <- c("Mat1", "Mat2")
arr = array(1:15, dim = c(2, 4, 2), dimnames = list(row_names, col_names, mat_names))
  
# print elements of both the rows and columns 2 and 3 of matrix 1
print (arr[, c(2, 3), 1])
```
**Output**
```
     col2 col3
row1    3    5
row2    4    6
```

### Adding elements to array
Elements can be appended at the different positions in the array. The sequence of elements is retained in order of their addition to the array. The time complexity required to add new elements is `O(n)` where `n` is the `length of the array`. The length of the array increases by the number of element additions. There are various in-built functions available in R:

- **c(vector, values):** c() function allows us to append values to the end of the array. Multiple values can also be added together.
- **append(vector, values):** This method allows the values to be appended at any position in the vector. By default, this function adds the element at end.
- **append(vector, values, after=length(vector))** adds new values after specified length of the array specified in the last argument of the function.

- **Using the length function of the array:**
Elements can be added at length+x indices where `x>0`.
```
# creating a uni-dimensional array
x <- c(1, 2, 3, 4, 5)
  
# addition of element using c() function
x <- c(x, 6)
print ("Array after 1st modification ")
print (x)
  
# addition of element using append function
x <- append(x, 7)
print ("Array after 2nd modification ")
print (x)
   
# adding elements after computing the length
len <- length(x) 
x[len + 1] <- 8
print ("Array after 3rd modification ")
print (x)
  
# adding on length + 3 index
x[len + 3]<-9
print ("Array after 4th modification ")
print (x)
  
# append a vector of values to the array after length + 3 of array
print ("Array after 5th modification")
x <- append(x, c(10, 11, 12), after = length(x)+3)
print (x)
  
# adds new elements after 3rd index
print ("Array after 6th modification")
x <- append(x, c(-1, -1), after = 3)
print (x)
```
**Output:**
```
[1] "Array after 1st modification "
[1] 1 2 3 4 5 6

[1] "Array after 2nd modification "
[1] 1 2 3 4 5 6 7

[1] "Array after 3rd modification "
[1] 1 2 3 4 5 6 7 8

[1] "Array after 4th modification "
[1]  1  2  3  4  5  6  7  8 NA  9

[1] "Array after 5th modification"
[1]  1  2  3  4  5  6  7  8 NA  9 10 11 12

[1] "Array after 6th modification"
[1]  1  2  3 -1 -1  4  5  6  7  8 NA  9 10 11 12
```

The `original length` of the array was `7`, and after third modification elements are present till the 8th index value. Now, at the fourth modification, when we add element 9 at the tenth index value, the R’s `inbuilt function automatically adds NA at the missing value positions`.
At 5th modification, the array of elements [10, 11, 12] are added beginning from the 11th index.
At 6th modification, `array [-1, -1] is appended after the third position in the array`.


### Removing Elements from Array
Elements can be removed from arrays in R, either one at a time or multiple together. These elements are specified as indexes to the array, wherein the array values satisfying the conditions are retained and rest removed. The comparison for removal is based on array values. Multiple conditions can also be combined together to remove a range of elements. Another way to remove elements is by using **%in%** operator wherein the set of element values belonging to the `TRUE` values of the operator are displayed as result and the rest are removed.

```
# creating an array of length 9
m <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)
print ("Original Array")
print (m)
          
# remove a single value element:3 from array
m <- m[m != 3]
print ("After 1st modification")
print (m)
  
# removing elements based on condition where either element should be greater than 2 and less than equal to 8
m <- m[m>2 & m<= 8]
print ("After 2nd modification")
print (m)
  
# remove sequence of elements using another array
remove <- c(4, 6, 8)
  
# check which element satisfies the remove property
print (m % in % remove)
print ("After 3rd modification")
print (m [! m % in % remove])
```

**Output:**

```
[1] "Original Array"
[1] 1 2 3 4 5 6 7 8 9

[1] "After 1st modification"
[1] 1 2 4 5 6 7 8 9

[1] "After 2nd modification"
[1] 4 5 6 7 8

[1]  TRUE FALSE  TRUE FALSE  TRUE
[1] "After 3rd modification"
[1] 5 7
```

### Updating Existing Elements of Array
The elements of the array can be updated with new values by assignment of the desired index of the array with the modified value. The changes are retained in the original array. If the index value to be updated is within the length of the array, then the value is changed, otherwise, the new element is added at the specified index. Multiple elements can also be updated at once, either with the same element value or multiple values in case the new values are specified as a vector.

```
# creating an array of length 9
m <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)
print ("Original Array")
print (m)
   
# updating single element
m[1] <- 0
print ("After 1st modification")
print (m)
   
# updating sequence of elements
m[7:9] <- -1
print ("After 2nd modification")
print (m)
   
# updating two indices with two different values
m[c(2, 5)] <- c(-1, -2)
print ("After 3rd modification")
print (m)
   
# this add new element to the array
m[10] <- 10
print ("After 4th modification")
print (m)
```

**Output:**
```
[1] "Original Array"
[1] 1 2 3 4 5 6 7 8 9

[1] "After 1st modification"
[1] 0 2 3 4 5 6 7 8 9

[1] "After 2nd modification"
[1]  0  2  3  4  5  6 -1 -1 -1

[1] "After 3rd modification"
[1]  0 -1  3  4 -2  6 -1 -1 -1

[1] "After 4th modification"
 [1]  0 -1  3  4 -2  6 -1 -1 -1 10
 ```

 At `2nd` modification, the elements at indexes `7 to 9` are updated with `-1 each`. At `3rd` modification, the `second` element is replaced by `-1` and `fifth` element by `-2` respectively. At `4th` modification, `a new` element is added since `10th` index is greater than the length of the array.

