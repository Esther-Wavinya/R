# R – Object Oriented Programming
In R programming, OOP provide `classes` and `objects` as its key tools to reduce and manage the complexity of the program. R is a functional language that uses concepts of OOP. 

We can think of a `class` as a sketch of a car. It contains all the details about the `model_name`, `model_no`, `engine`, etc. Based on these descriptions we select a car. Car is the `object`. `Each car object has its own characteristics and features`. 

An `object` is also called an **instance of a class** and `the process of creating this object` is called **instantiation**. 

In R S3 and S4 classes are the two most important classes for object-oriented programming. 

**Class and Object**
**Class** is the blueprint or a prototype from which objects are made by encapsulating data members and functions. 

An **object** is a data structure that contains some methods that act upon its attributes. 

![class and object!](/images/oop.jpg)


**S3 Class**
**S3 class** does not have a predefined definition and is able to dispatch. In this class, the generic function makes a call to the method. Easy implementation of S3 is possible because it differs from the traditional programming language Java, C++, and C# which implements Object Oriented message passing.

## Creating S3 Class
To create an object of this class we will create a list that will contain all the class members. Then this list is passed to the class() method as an argument.

**Syntax:**
```
variable_name <- list(attribute1, attribute2, attribute3….attributeN)
```
**Example:**
In the following code, a `Student` class is defined. An appropriate class name is given with attributes `student’s name` and `roll number`. Then the object of the student class is created and invoked. 

```
# List creation with its attributes name and roll no.
a < - list(name="Adam", Roll_No=15)
 
# Defining a class "Student"
class(a) < - "Student"
 
# Creation of object
a
```
**Output:**
```
$name
[1] "Adam"

$Roll_No
[1] 15

attr(, "class")
[1] "Student"
```

### Generic Functions
The generic functions are a good example of `polymorphism`. To understand the concept of generic functions consider the `print()` function.

The **print()** function is a collection of various print functions that are created for different data types and data structures in the R Programming Language.

It calls the appropriate function depending upon the type of object passed as an argument. We can see the various implementation of print functions using the `methods()` function.

**Example:** Seeing different types of print function
```
methods(print)
```

**Output**
![generic functions!](/images/oop.jpg)

Now let’s create a generic function of our own. We will create the print function for our class that will print all the members in our specified format. But before creating a print function let’s see what the print function does to our class.

**Example:**
```
# List creation with its attributes name and roll no.
a = list(name="Adam", Roll_No=15)
 
# Defining a class "Student"
class(a) = "Student"
 
# Creation of object
print(a)
```
**Output:**
```
$name
[1] "Adam"

$Roll_No
[1] 15

attr(,"class")
[1] "Student"
```
Now let’s print all the members in our specified format. Consider the below example –

**Example:**
```
print.Student <- function(obj){
  cat("name: " ,obj$name, "\n")
  cat("Roll No: ", obj$Roll_No, "\n")
}
 
print(a)
```
**Output:**
```
name:  Adam 
Roll No:  15 
```

### Attributes
**Attributes** of an object do not affect the value of an object, but they are a piece of extra information that is used to handle the objects. The `function attributes()` can be used to view the attributes of an object.

**Examples:** An S3 object is created and its attributes are displayed.
```
attributes(a)
```
**Output:**
```
$names
'name''Roll_No'

$class
'Student'
```

Also, you can add attributes to an object by using **attr**. 
```
attr(a, "age")<-c(18)

attributes(a)
```

**Output:**
```
$names
'name''Roll_No'

$class
'Student'

$age
18
```
## Inheritance in S3 Class
**Inheritance** is an important concept in OOP(object-oriented programming) which allows one class to derive the features and functionalities of another class. This feature facilitates `code-reusability`.

S3 class in R programming language has no formal and fixed definition. In an S3 object, a list with its class attribute is set to a class name. `S3 class objects inherit only methods from their base class`.

**Example:**
In the following code, inheritance is done using S3 class, firstly the object is created of the class student.
```
# student function with argument name(n) and roll_no(r)
student < - function(n, r) {
    value < - list(name=n, Roll=r)
    attr(value, "class") < - "student"
    value
}
```
Then, the method is defined to print the details of the student.
```
# 'print.student' method created
print.student < - function(obj) {
 
    # 'cat' function is used to concatenate strings
    cat("Name:", obj$name, "\n")
    cat("Roll", obj$roll, "\n")}
```
Now, inheritance is done while creating another class by doing **class(obj) <- c(child, parent)**.
```
s < - list(name="Kesha", Roll=21, country="India")
 
# child class 'Student' inherits parent class 'student'
class(s) < - c("Student", "student")
s
```

**Output**
```
Name: Kesha 
Roll: 21 
```
The following code overwrites the method for class student.
```
# 'Student' class object is passed in the function of class 'student'
 
print.student < - function(obj) {
    cat(obj$name, "is from", obj$country, "\n")
}
s
```
**Output:**
```
Kesha is from India
```

**S4 Class**
S4 class has a predefined definition. It contains `functions for defining methods and generics`. It makes multiple dispatches easy. This class contains auxiliary functions for defining methods and generics.

## Creating S4 class and object 
**setClass()** command is used to create `S4 class`. 

Following is the syntax for setclass command which denotes myclass with slots containing name and rollno.

**Syntax:**
```
 setClass(“myclass”, slots=list(name=”character”, Roll_No=”numeric”))  
 ```

The **new()** functionThe new() function is used to create an `object of the S4 class`. 

In this function, we will pass the class name as well as the value for the slots. 
**Example:**
```
# Function setClass() command used to create S4 class containing list of slots.
setClass("Student", slots=list(name="character", Roll_No="numeric"))
 
# 'new' keyword used to create object of class 'Student'
a <- new("Student", name="Adam", Roll_No=20)
 
# Calling object
a
```
**Output:**
```
Slot "name":
[1] "Adam"

Slot "Roll_No":
[1] 20
```

## Create S4 objects from generator function
**setClass()** returns a `generator function` which helps in creating objects and it acts as a `constructor`.
**Example:**
```
stud <- setClass("Student", slots=list(name="character", Roll_No="numeric"))
 
# Calling object
stud
```
**Output:**
```
new(“classGeneratorFunction”, .Data = function (…)

new(“Student”, …), className = structure(“Student”, package = “.GlobalEnv”), package = “.GlobalEnv”)
```
Now the above-created `stud function` will act as the `constructor for the Student class`. It will behave as the new() function.
**Example:**
```
stud(name="Adam", Roll_No=15)
```

**Output:**
```
An object of class "Student"
Slot "name":
[1] "Adam"

Slot "Roll_No":
[1] 15
```

## Inheritance in S4 class
S4 class in R programming have proper definition and derived classes will be able to `inherit both attributes and methods` from its base class. 

For this, we will first create a `base class with appropriate slots and will create a generic function for that class. 

Then we will create a `derived class that will inherit using the contains parameter`. The derived class will inherit the members as well as functions from the base class.
**Example:**
```
# Define S4 class
setClass("student",
         slots=list(name="character", age="numeric", rno="numeric")
         )
 
# Defining a function to display object details
setMethod("show", "student", function(obj){ 
              cat(obj@name, "\n")
              cat(obj@age, "\n")
              cat(obj@rno, "\n")
          })
 
# Inherit from student
setClass("InternationalStudent",  slots=list(country="character"), contains="student")
 
# Rest of the attributes will be inherited from student
s < - new("InternationalStudent", name="Adam", age=22, rno=15, country="India")
show(s)
```

**Output:**
```
Adam 
22 
15
```

**The reasons for defining both S3 and S4 class are as follows:**

- `S4 class alone will not be seen if the S3 generic function is called directly`. This will be the case, for example, if some function calls unique() from a package that does not make that function an S4 generic.


- However, `primitive functions and operators are exceptions`: The internal C code will look for S4 methods if and only if the object is an S4 object. S4 method dispatch would be used to dispatch any binary operator calls where either of the operands was an S4 object.


- `S3 class alone will not be called if there is any eligible non-default S4 method`.


So if a package defined an S3 method for unique for an S4 class but another package defined an S4 method for a superclass of that class, the superclass method would be chosen, probably not what was intended.

# Classes in R Programming
Classes and Objects are basic concepts of Object-Oriented Programming that revolve around the real-life entities. Everything in R is an object. 

An **object** is simply a data structure that has some methods and attributes. 

A **class** is just a blueprint or a sketch of these objects. It represents the set of properties or methods that are common to all objects of one type.

Unlike most other programming languages, R has a three-class system. These are `S3`, `S4`, and `Reference Classes`.

## S3 Class
S3 is the simplest yet the most popular OOP system and it lacks formal definition and structure. An object of this type can be created by just adding an attribute to it. Following is an example to make things more clear:
**Example:**
```
# create a list with required components
movieList <- list(name = "Iron man", leadActor = "Robert Downey Jr")
  
# give a name to your class
class(movieList) <- "movie"
  
movieList
```

**Output:**
```
$name
[1] "Iron man"

$leadActor
[1] "Robert Downey Jr"
```

In S3 systems, methods don’t belong to the class. They belong to generic functions. It means that we can’t create our own methods here, as we do in other programming languages like C++ or Java. But we can define what a generic method (for example print) does when applied to our objects.

```
print(movieList)
```
**Output:**
```
$name
[1] "Iron man"

$leadActor
[1] "Robert Downey Jr"
```

**Example: Creating a user-defined print function**
```
# now let us write our method
print.movie <- function(obj)
{
    cat("The name of the movie is", obj$name,".\n")
    cat(obj$leadActor, "is the lead actor.\n")
}
```
**Output**
```
The name of the movie is Iron man .
Robert Downey Jr is the lead actor.
```


## S4 Class
Programmers of other languages like C++, Java might find S3 to be very much different than their normal idea of classes as it lacks the structure that classes are supposed to provide. 

S4 is a slight improvement over S3 as its objects have a proper definition and it gives a proper structure to its objects.

**Example:**
```
library(methods)
  
# definition of S4 class
setClass("movies", slots=list(name="character", leadActor = "character"))
  
# creating an object using new() by passing class name and slot values
movieList <- new("movies", name="Iron man", leadActor = "Robert Downey Jr")
movieList
```

**Output**
```
An object of class "movies"
Slot "name":
[1] "Iron man"

Slot "leadActor":
[1] "Robert Downey Jr"
```
As shown in the above example, **setClass()** is used to define a class and **new()** is used to create the objects.

The concept of `methods in S4 is similar to S3`, i.e., they belong to generic functions. The following example shows how to create a method:

```
movieList
```

**Output:**
```
An object of class "movies"
Slot "name":
[1] "Iron man"

Slot "leadActor":
[1] "Robert Downey Jr"
```

**Example:**
```
# using setMethod to set a method
setMethod("show", "movies", function(object) {
    cat("The name of the movie is ", object@name, ".\n")
    cat(object@leadActor, "is the lead actor.\n")
 })
movieList
```
**Output:**
```
[1] "show"
The name of the movie is  Iron man .
Robert Downey Jr is the lead actor.
```

## Reference Class
Reference Class is an improvement over S4 Class. Here the `methods belong to the classes`. These are much similar to object-oriented classes of other languages.

Defining a Reference class is similar to defining S4 classes. We use **setRefClass()** instead of setClass() and **“fields”** instead of “slots”.

**Example:**
```
library(methods)
   
# setRefClass returns a generator 
movies <- setRefClass("movies", fields = list(name = "character", leadActor = "character", rating = "numeric"))
  
#now we can use the generator to create objects
movieList <- movies(name = "Iron Man", leadActor = "Robert downey Jr", rating = 7)
movieList
```
**Output**
```
Reference class object of class "movies"
Field "name":
[1] "Iron Man"

Field "leadActor":
[1] "Robert downey Jr"

Field "rating":
[1] 7
```

Now let us see how to add some methods to our class with an example.
**Example:**
```
library(methods)
  
movies <- setRefClass("movies", fields = list(name = "character", leadActor = "character", rating = "numeric"), methods = list(increment_rating = function()
                       {
                           rating <<- rating + 1
                       },
                       decrement_rating = function()
                       {
                           rating <<- rating - 1
                       }
                     ))
movieList <- movies(name = "Iron Man", leadActor = "Robert downey Jr", rating = 7


# print the value of rating
movieList$rating
  
# increment and then print the rating
movieList$increment_rating()
movieList$rating
  
# decrement and print the rating
movieList$decrement_rating()
movieList$rating
```
**Output:**
```
[1] 7
[1] 8
[1] 7
```




# R - Objects

Every programming language has its own data types to store values or any information so that the user can assign these data types to the variables and perform operations respectively. 

Operations are performed accordingly to the data types.

These data types can be character, integer, float, long, etc. Based on the data type, `memory/storage` is allocated to the variable. For example, in C language character variables are assigned with 1 byte of memory, integer variable with 2 or 4 bytes of memory and other data types have different memory allocation for them.

Unlike other programming languages, `variables are assigned to objects` rather than data types in R programming.


**Type of Objects**
There are 5 basic types of objects in the R language:


- **Vectors**
Atomic vectors are one of the basic types of objects in R programming. `Atomic vectors` can store homogeneous data types such as `character`, `doubles`, `integers`, `raw`, `logical`, and `complex`. A single element variable is also said to be vector.

**Example:**
```
# Create vectors
x <- c(1, 2, 3, 4)
y <- c("a", "b", "c", "d")
z <- 5
  
# Print vector and class of vector
print(x)
print(class(x))
  
print(y)
print(class(y))
  
print(z)
print(class(z))
```

**Output:**
```
[1] 1 2 3 4
[1] "numeric"

[1] "a" "b" "c" "d"
[1] "character"

[1] 5
[1] "numeric"
```


- **Lists**
List is another type of object in R programming. `List` can contain heterogeneous data types such as `vectors or another lists`.

**Example:**
```
# Create list
ls <- list(c(1, 2, 3, 4), list("a", "b", "c"))
  
# Print
print(ls)
print(class(ls))
```

**Output:**
```
[[1]]
[1] 1 2 3 4

[[2]]
[[2]][[1]]
[1] "a"

[[2]][[2]]
[1] "b"

[[2]][[3]]
[1] "c"

[1] "list"
```


- **Matrices**
To store values as `2-Dimensional array, matrices` are used in R. Data, number of rows and columns are defined in the matrix() function.

**Syntax:**
```
matrix(data = NA, nrow = 1, ncol = 1, byrow = FALSE, dimnames = NULL)
```

**Example:**
```
x <- c(1, 2, 3, 4, 5, 6)
  
# Create matrix
mat <- matrix(x, nrow = 2)
  
print(mat)
print(class(mat))
```

**Output:**
```
     [, 1] [, 2] [, 3]
[1, ]    1    3    5
[2, ]    2    4    6

[1] "matrix"
```


- **Factors**
Factor object encodes a vector of unique elements (levels) from the given data vector.

**Example:**

```
# Create vector
s <- c("spring", "autumn", "winter", "summer", 
"spring", "autumn")
  
print(factor(s))
print(nlevels(factor(s)))
```

**Output:**

```
[1] spring autumn winter summer spring autumn
Levels: autumn spring summer winter
[1] 4
```


- **Arrays**
**array()** function is used to create `n-dimensional array`. This function takes dim attribute as an argument and creates required length of each dimension as specified in the attribute.

**Syntax:**
```
array(data, dim = length(data), dimnames = NULL)
```

**Example:**
```
# Create 3-dimensional array and filling values by column
arr <- array(c(1, 2, 3), dim = c(3, 3, 3))
  
print(arr)
```

**Output:**
```
,, 1

     [, 1] [, 2] [, 3]
[1, ]    1    1    1
[2, ]    2    2    2
[3, ]    3    3    3,, 2

     [, 1] [, 2] [, 3]
[1, ]    1    1    1
[2, ]    2    2    2
[3, ]    3    3    3,, 3

     [, 1] [, 2] [, 3]
[1, ]    1    1    1
[2, ]    2    2    2
[3, ]    3    3    3
```



- **Data Frames**
Data frames are `2-dimensional tabular data object` in R programming. 

Data frames consists of multiple columns and each column represents a vector. `Columns in data frame can have different modes of data` unlike matrices.

**Example:**
```
# Create vectors
x <- 1:5
y <- LETTERS[1:5]
z <- c("Albert", "Bob", "Charlie", "Denver", "Elie")
  
# Create data frame of vectors
df <- data.frame(x, y, z)
  
# Print data frame
print(df)
```

**Output:**
```
  x y       z
1 1 A  Albert
2 2 B     Bob
3 3 C Charlie
4 4 D  Denver
5 5 E    Elie
```







# Encapsulation in R Programming
In R programming, OOP provides `classes and objects` as its key tools to reduce and manage the complexity of the program. R is a functional language that uses concepts of OOP. 

We can think of class like a sketch of a car. It contains all the details about the `model_name, model_no, engine`, etc. Based on these descriptions we select a car. The car is the object. Each car object has its own characteristics and features. An object is also called an instance of a class and the process of creating this object is called instantiation. OOP has the following features:

- Class
- Object
- Abstraction
- Encapsulation
- Polymorphism
- Inheritance

![oop concepts!](/images/encaps.jpg)

## Encapsulation Featurs in R
While working with classes and dealing with sensitive data, implementing global access to all the variables used within the program code is not a good choice because then the chances of getting the data tempered will increase. For this purpose, Object-Oriented Programming languages have the concept of Encapsulation. 

**Encapsulation** ensures that the outside view of the object is clearly separated from the inside view of the object by hiding the implementation of operation and state from the interface which is available to all other objects. 


**Note:** An object is a collection of operations that shares a state. The collection of operations define the behavior of an object. 

![encapsulation!](/images//object2.png)


Encapsulation is: 
- Binding the data with the code that manipulates it. 
- It keeps the data and the code safe from external interference 


A common way to think about encapsulation is like when you go to a restaurant the waiter comes and asks you about what you want to eat and then you order the waiter with what you want to eat, and the waiter then delegates the cooking of what you requested to the restaurant’s chef and brings you the ordered dish. You cannot directly go to the chef and tell what you want to eat. This will not be appropriate for the restaurant and for you.
`The same goes for the class, when you want two classes to communicate with one another it is actually the objects of those classes communicating with each other and doing the work`. 

No two classes can directly communicate with each other because then data becomes vulnerable and easy to temper. Just like this Updating, modifying, or deleting data from variables can be done through the use of methods that are defined specifically for the purpose. The benefit of using this approach to programming is `improved control over the input data and better security`. **Encapsulation** helps to create code that is loosely coupled. Because the details are hidden, it reduces the ability of other objects to directly modify an object’s state and behavior. 

**Example 1:** 
```
l <- list(name = "Geeksforgeeks", state = "UP", sector= 136)
  
# Class name declared as 'info'
class(l) <- "info" 
  
# Object creation of class 'info'
l
```

**Output:** 
```
$name 
[1] "Geeksforgeeks" 

$state 
[1] "UP" 

$sector 
[1] 136 

attr(, "class") 
[1] "info" 
```

**Example 2:** 
```
s <- list(country = "India", state = "Delhi", street_no.= 110) 
    
# Class name declared as 'address'   
class(s) <- "address"
    
# Object creation of class 'address'. 
s
```

**Output:** 
```
$country
[1] "India"

$state
[1] "Delhi"

$street_no.
[1] 110

attr(, "class")
[1] "address"
```


When a user orders something from a website, he just wants to pay and receive his product. It won’t be a good thing to let the user know the internal working of the system that how his order is placed and where it goes. 

While using any encapsulated code like above you should know the following things: 

- Everyone knows how to access it. 
- Can be easily used regardless of implementation details. 
- There shouldn’t any side effects of the code, to the rest of the application. 


Encapsulation can help to build more maintainable code by helping to block the ripple effect of code changes. It also helps with creating loosely coupled code by diminishing direct access to an object’s state and behavior.







# Polymorphism in R Programming
R language is evolving and it implements parametric polymorphism, which means that methods in R **refer to functions, not classes**.

**Parametric polymorphism** primarily lets you define a generic method or function for types of objects you haven’t yet defined and may never do. This means that one can use the same name for several functions with different sets of arguments and from various classes.

R’s method call mechanism is generics which allows registering certain names to be treated as `methods in R`, and they act as `dispatchers`. 



**Generic Functions**
`Polymorphism` in R can be obtained by the `generics. It allows certain names to be treated as methods and they act as dispatchers`. 

Let’s understand with the help of **plot()** function and **summary** function. 

In R programming the `plot()` and `summary()` functions return different results depending on the objects being passed to them and that’s why they are generic functions that implement polymorphism. 



## plot() in R
**plot()** is one of the generic functions that implement polymorphism in R. It produces a different graph if it is given a `vector`, a `factor`, a `data frame`, etc. But have you ever wondered how does the class of vectors or factors determine the method used for plotting?  Let’s see the code for the plot function. 

**Example:** Code of plot function

```
plot
```

**Output:**
```
function (x, y, ...)
UseMethod("plot")
```


We can see that the body of the plot function contains only one expression and that is `UseMethod(“plot”)`. Let’s see the definition of UseMethod with the help of `help()` function.

**Example:** Definition of the UseMethod.
```
help(UseMethod)
```

**Output:**
![usemethod meaning!](/images//usemethod.jpg)



From the above output, we can see that `UseMethod takes two parameters generic and object`. 

- The generic is the string name which is the name of the function (plot in this case). 
- This is an object whose class will determine the method that will be “dispatched,” It means the object for which the generic method will be called.


The `UseMethod` then searches for the suitable plot function that is needed to be called by creating a string of the type `plot.object`. We can also see all the available methods for the plot function.

**Example:**
```
methods(plot)
```

**Output:**
![plot function!](/images/plotfunction.png)

Let’s see how **plot()** function takes arguments and displays different outputs

- **Input is one numeric vector**
Take a single numeric vector inside **plot()** function as a parameter.
```
# R program to illustrate polymorphisim
 
# X Window System Graphics (X11)
X11(width = 15, height = 13)
 
# The runif() function generates random deviates of the uniform distribution
x <- 3 * runif(40) + (1:30)
par(mar = c(20, 20, 1, 1))
 
# type='l' is used  to connect the points of the scatter plots with lines.
plot(x, type = 'l', col = '#343deb')
 
# We can do  mouse click or enter pressed
z <- locator(1)
```

**Output:**
![plot function in r!](/images/plotinR.png)


- **Inputs are two numeric vectors**
We need to pass two vector parameters. It produces a scatter plot accordingly.
```
# R program to illustrate polymorphisim
 
# X Window System Graphics (X11)
X11(width = 5, height = 3)
 
# The runif() function generates random deviates of the uniform distribution
x <- runif(20)
y <- runif(20) * x
par(mar = c(2, 2, 0.3, 0.3))
 
# type = 'p' means as points, the output comes as scattered pch stands for plot character. pch = 16 we get . character
plot(x, y, type = 'p', pch = 16, col = '#ab1ab0')
 
#Either mouse press or enter key press wait
z <- locator(1)
```

**Output:**
![plot function in R!](/images/plotinR2.png)


- **Input is a factor**
If we pass factor as arguments, we get a bar chart pattern. 
```
# R program to illustrate polymorphisim
 
# X Window System Graphics (X11)
X11(width = 5, height = 8)
 
# here fruits names are passed and barchart is produced as output
f <- factor(c('apple', 'orange', 'apple', 'pear', 'orange',
              'apple', 'apple', 'orange'))
par(mar = c(2, 2, 0.6, 0.6))
 
# Using plot()
plot(f, col = '#8f4c91')
z <- locator(1)
```

**Output:**
![plot function in R!](/images/barchart.png)


- **Input is a data frame**
The Plot function takes the data frame as an argument and each variable of the data frame is plotted against each other.

```
# R program to illustrate polymorphisim
 
# X Window System Graphics (X11)
X11(width = 6, height = 6)
 
set.seed(280870)
x <- c(4, 3, 1, 2, 2, 4, 6, 4, 5, 5,
       4, 4, 5, 4, 4, 8, 4, 1, 2, 7)
y <- x * rnorm(20, 1, 0.3)
z <- x * y
 
# Takina a data frame
df <- data.frame(x, y, z)
par(mar = c(0.1, 0.1, 0.1, 0.1))
 
# Using plot()
plot(df, col = '#a832a6', pch = 16, cex = 1.5)
z <- locator(1)
```
**Output:**
![plot function in R!](/images/BAR.png)







## summary() in R
It is also a generic function that implements polymorphism in R. It is used to produce result summaries of the results of various model fitting functions.

**Example 1:**
```
# R program to illustrate polymorphisim
 
# Rainbow colors and let us see summary of it
colors <- c("violet", "indigo", "blue", "green", "yellow", "orange", "red")
summary(colors)
```

**Output:**
```
Length     Class      Mode 
  7      character character 
```


**Example 2:**

Let us check for summarized results for `state.region`. In R it usually displays what are the regions available under “Northeast”, “South”, “North Central”, and “West”. Using **summary()** function either one can pass state.region as 1st parameter and as a second step, (optionally) pass “maxsum” argument. `“`maxsum`” indicates `how many levels should be shown for factors in output`.

```
# R program to illustrate polymorphisim
 
state.region
 
# Provides summarised results under each region
summary(state.region)
 
# As maxsum is given as 3, totally we should have 3 regions but here we have 4 regions and hence highest count region, next highest count region is displayed and the other regions are clubbed under Other

summary(state.region, maxsum = 3)
```

**Output:**
```
> state.region
 [1] South         West          West          South         West          West         
 [7] Northeast     South         South         South         West          West         
[13] North Central North Central North Central North Central South         South        
[19] Northeast     South         Northeast     North Central North Central South        
[25] North Central West          North Central West          Northeast     Northeast    
[31] West          Northeast     South         North Central North Central South        
[37] West          Northeast     Northeast     South         North Central South        
[43] South         West          Northeast     South         West          South        
[49] North Central West         
Levels: Northeast South North Central West

> summary(state.region) 
    Northeast         South North Central          West 
            9            16            12            13 
                        
> summary(state.region, maxsum = 3) 
  South    West (Other) 
     16      13      21 
```


**Example 3:**

If the data set is very large how does the **summary()** function work?.
```
# R program to illustrate polymorphisim
 
# 10 different data sets are taken using stats::rnorm
x <- stats::rnorm(10)
x
 
# Let us cut the dataset to lie between -3 and 3 and in this case, it will be (-3,-2] (-2,-1] (-1,0] (0,1] (1,2] (2,3]
c <- cut(x, breaks = -3:3)
c
 
# Summarized the available dataset under the given levels
summary(c)
```


**Output:**
```
> x
 [1]  0.66647846 -0.29140286 -0.29596477 -0.23432541 -0.02144178  1.56640107  0.64575227
 [8] -0.23759734  0.73304657 -0.04201218
 
> c
 [1] (0,1]  (-1,0] (-1,0] (-1,0] (-1,0] (1,2]  (0,1]  (-1,0] (0,1]  (-1,0]
Levels: (-3,-2] (-2,-1] (-1,0] (0,1] (1,2] (2,3]

> summary(c)
(-3,-2] (-2,-1]  (-1,0]   (0,1]   (1,2]   (2,3] 
      0       0       6       3       1       0 

```


We have described the **plot()** and **summary()** function which are polymorphic functions. 

By means of different inputs, **plot()** function behavior is changing and producing outputs.Here we can see the polymorphism concept. 

Similarly, in **summary()**, function, by means of varying parameters, the same method is applicable to provide different statistical outputs. 




## Creating Generic Method
Let’s create a class bank and let’s try to create our own **display()** method that will use the print() method and will display the content of the class in the format specified by us.

To do this we first need to create a generic display() function that will use the **UseMethod** function.

```
display <- function(obj){
    UseMethod("print")
}
```

After creating the generic display function, create the display function for the class bank.

```
print.bank<-function(obj)
{
    cat("Name is ", obj$name, "\n")
    cat(obj$account_no, " is the Acc no of the holder\n ")
    cat(obj$saving, " is the amount of saving in the account \n ")
    cat(obj$withdrawn, " is the withdrawn amount\n")
}
```

Now, let’s see the output given by this function:

```
x <- list(name ="Arjun", account_no = 1234,
        saving = 1500, withdrawn = 234)

class(x)<-"bank"
 
display <- function(obj){
    UseMethod("print")
}
 
print.bank<-function(obj)
{
    cat("Name is ", obj$name, "\n")
    cat(obj$account_no, " is the Acc no of the holder\n ")
    cat(obj$saving, " is the amount of saving in the account \n ")
    cat(obj$withdrawn, " is the withdrawn amount\n")
}
 
display(x)
```

**Output:**
```
Name is  Arjun 
1234  is the Acc no of the holder
 1500  is the amount of saving in the account 
 234  is the withdrawn amount
```



# R Inheritance


**Inheritance** is one of the concept in object oriented programming by which new classes can be derived from existing or base classes helping in re-usability of code. Derived classes can be the same as a base class or can have extended features which creates a hierarchical structure of classes in the programming environment. In this article, we’ll discuss how inheritance is followed out with three different types of classes in R programming.



## Inheritance in S3 Class
S3 class in R programming language has no formal and fixed definition. In an S3 object, a list with its class attribute is set to a class name. S3 class objects inherit only methods from its base class.

**Example:**
```
# Create a function to create an object of class
student <- function(n, a, r){
  value <- list(name = n, age = a, rno = r)
  attr(value, "class") <- student
  value
}
  
# Method for generic function print()
print.student <- function(obj){
  cat(obj$name, "\n")
  cat(obj$age, "\n")
  cat(obj$rno, "\n")
}
  
# Create an object which inherits class student
s <- list(name = "Utkarsh", age = 21, rno = 96,
          country = "India")
  
# Derive from class student
class(s) <- c("InternationalStudent", "student")
  
cat("The method print.student() is inherited:\n")
print(s)
  
# Overwriting the print method
print.InternationalStudent <- function(obj){
cat(obj$name, "is from", obj$country, "\n")
}
  
cat("After overwriting method print.student():\n")
print(s)
  
# Check imheritance
cat("Does object 's' is inherited by class 'student' ?\n")
inherits(s, "student")
```

**Outputt**
```
The method print.student() is inherited:

Utkarsh 
21 
96 

After overwriting method print.student():

Utkarsh is from India

Check inheritance:
Does object 's' is inherited by class 'student' ?
[1] TRUE
```


## Inheritance in S4 Class
S4 class in R programming have proper definition and derived classes will be able to inherit both attributes and methods from its base class.

**Example:**

```
# Define S4 class
setClass("student",
         slots = list(name = "character", 
                      age = "numeric", rno = "numeric") 
)
   
# Defining a function to display object details
setMethod("show", "student",
          function(obj){
            cat(obj@name, "\n")
            cat(obj@age, "\n")
            cat(obj@rno, "\n")
          } 
)
   
# Inherit from student
setClass("InternationalStudent",
slots = list(country = "character"),
contains = "student"
)
   
# Rest of the attributes will be inherited from student
s <- new("InternationalStudent", name = "Utkarsh", 
         age = 21, rno = 96, country="India")
show(s)
```


**Output:**
```
Utkarsh 
21 
96 
```

## Inheritance in Reference Class
Inheritance in reference class is almost similar to the S4 class and uses `setRefClass()` function to perform inheritance.

**Example:**

```
# Define class
student <- setRefClass("student",
   fields = list(name = "character",
                 age = "numeric", rno = "numeric"),
   methods = list(
     inc_age <- function(x) {
       age <<- age + x
     },
     dec_age <- function(x) {
       age <<- age - x
     }
   )
)
  
# Inheriting from Reference class
InternStudent <- setRefClass("InternStudent", 
   fields = list(country = "character"), 
   contains = "student",
   methods = list(
   dec_age <- function(x) {
     if((age - x) < 0)  stop("Age cannot be negative")
     age <<- age - x
   }
   ) 
)
  
# Create object
s <- InternStudent(name = "Utkarsh",
                   age = 21, rno = 96, country = "India")
  
cat("Decrease age by 5\n")
s$dec_age(5)
s$age
  
cat("Decrease age by 20\n")
s$dec_age(20) 
s$age
```

**Output:**
```
[1] 16 
Error in s$dec_age(20) : Age cannot be negative
[1] 16
```



# Abstraction in R Programming
People who’ve been using the R language for any period of time have likely grown to be conversant in passing features as arguments to other functions. However, people are a whole lot much less probably to go back functions from their personal custom code. This is simply too horrific because doing so can open up a whole new international of abstraction that may greatly lower the quantity and complexity of the code vital to finish sure styles of duties. Here we offer a few short examples of ways R programmers can make use of lexical closures to encapsulate both records and strategies.

![abstraction in R!](/images/abstraction.png)

## Implementation in R
To begin with, an easy instance, assume you want a function that provides **add_2()** to its argument. You could probably write something like this:

```
add_2 <- function(y) { 2 + y }
```

Which does precisely what you’ll anticipate:

```
> add_2(1:10)
[1] 3 4 5 6 7 8 9 10 11 12
```

Now suppose you need every other feature that rather provides 7 to its argument. What to do could be to write down any other characteristic, much like **add_2**, where the **2** is replaced with a **7**. But this would be grossly inefficient: if within the future you discover that you made a mistake and also you in truth want to multiply the values instead of adding them, you will be pressured to trade the code in places. In this trivial instance, that won’t be plenty of hassle, but for greater complicated projects, duplicating code is a recipe for catastrophe. A higher concept could be to put in writing a characteristic that takes one argument, `x`, that returns every other function which provides its argument, `y`, to `x`. In different words, something like this:
```
add_x <- function(x) {
   function(y) { x + y }
}
```

Now, while you name **add_x** with an argument, you may get back a feature that does precisely what you need:
```
add_2 <- add_x(2)
add_7 <- add_x(7)
```

```
> add_2(1:10)
[1] 3 4 5 6 7 8 9 10 11 12
> add_7(1:10)
[1] 8 9 10 11 12 13 14 15 16 17
```

So this doesn’t seem too earth-shattering. But if you look closely at the definition of **add_x**, you may notice something odd: how does the return characteristic realize in which to discover `x` when it’s referred to as at a later point?

It turns out that R is lexically scoped, which means that features deliver with them a connection with the environment within which they were described. In this case, when you call **add_x**, the x argument you offer receives attached to the environment for the return characteristic. In different phrases, on this simple instance, you may think about R as simply changing all instances of the x variable within the feature to be lower back with the value you specify whilst you known as **add_x**. Ok, so this may be a neat trick, however, how this can be used extra productively? For a slightly extra complicated instance, think you’re doing some complex bootstrapping, and, for efficiency, you pre-allocate container vectors to keep the results. This is easy if you have just a single vector of effects—all you need to do is take into account to iterate an index counter whenever you upload an end result to the vector.

```
for (i in 1:nboot) {
 bootmeans[i] <- mean(sample(data, length(data), 
                             replace = TRUE))
}
```

```
> mean(data)
[1] 0.0196
> mean(bootmeans)
[1] 0.0188
```

But think you need to track several extraordinary statistics, every requiring you to maintain track of a unique index variable. If your bootstrapping ordinary is even a little bit complicated, this could be tedious and vulnerable to blunders. By the use of closures, you may summary away all of this bookkeeping. Here is a constructor function that wraps a pre-allocated container vector:

```
make_container <- function(n) {
   x <- numeric(n)
   i <- 1
  
   function(value = NULL) {
       if (is.null(value)) {
           return(x)
       }
       else {
           x[i] <<- value
           i <<- i + 1
       }  
   }
}
```
When you call **make_container** with an issue, it pre-allocates a numeric vector of the specified period, `n`, and returns a feature that permits you to feature statistics to that vector while not having to fear approximately keeping the music of an index. If the argument to that return feature is NULL, the entire vector is the lower back.

```
bootmeans <- make_container(nboot)
  
for (i in 1:nboot)
bootmeans(mean(sample(data, length(data), 
                      replace = TRUE)))

```

```
> mean(data)
[1] 0.0196
> mean(bootmeans())
[1] 0.0207
```

Here **make_container** is tremendously easy, but it may be as complicated as you need. For example, you could want to have the constructor function carry out some expensive calculations which you could instead no longer do on every occasion the character is known as. In reality, that is what I even have completed within the **boolean3** package deal to decrease the range of calculations performed at each new release of the optimization habitual.



# Looping over Objects in R Programming
One of the biggest issues with the `for` loop is its *memory consumption* and its *slowness in executing a repetitive task*. 

And when it comes to *dealing with large data set* and *iterating over it*, `for` loop is not advised.

R provides many alternatives to be applied to vectors for looping operations that are pretty useful when working interactively on a command line. Here, we deal with **apply()** function and its variants:

- apply()
- lapply()
- sapply()
- tapply()
- mapply()

Let us see what each of these functions does.
|Looping Function   |   Operation  |
|------------------  |----------------|
|**apply()**         | Applies a function over the margins of an array or matrix|
|**lapply**       | Apply a function over a list or a vector|
| **sapply**     | Same as lapply() but with simplified results|
| **tapply**    | Apply a function over a ragged array |
|**mapply**   | Apply a function over a ragged array |

- **apply()**: This function applies a given function over the margins of a given array.

```
apply(array, margins, function, …)

array = list of elements
margins = dimension of the array along which the function needs to be applied
function = the operation which you want to perform
```
**Example:**
```
# R program to illustrate apply() function 
  
# Creating a matrix 
A = matrix(1:9, 3, 3) 
print(A) 
  
# Applying apply() over row of matrix.here margin 1 is for row  
r = apply(A, 1, sum) 
print(r) 
  
# Applying apply() over column of matrix. here margin 2 is for column 
c = apply(A, 2, sum) 
print(c) 
```

**Output:**
```
[, 1] [, 2] [, 3]
[1, ]    1    4    7
[2, ]    2    5    8
[3, ]    3    6    9

[1] 12 15 18
[1]  6 15 24
```

- **lapply():** This function is used to apply a function over a list. It always returns a list of the same length as the input list.
```
lapply(list, function, …)

list = Created list
function = the operation which you want to perform
```

**Example:**
```
# R program to illustrate lapply() function 
  
# Creating a matrix 
A = matrix(1:9, 3, 3) 
  
# Creating another matrix 
B = matrix(10:18, 3, 3)  
  
# Creating a list 
myList = list(A, B) 
  
# applying lapply() 
determinant = lapply(myList, det) 
print(determinant) 
```

**Output:**
```
[[1]]
[1] 0

[[2]]
[1] 5.329071e-15
```

- **sapply():** This function is used to simplify the result of *lapply()*, if possible. Unlike *lapply()*, the result is not always a list. The output varies in the following ways:-
- If output is a list containing elements having length 1, then a vector is returned.
- If output is a list where all the elements are vectors of same length(>1), then a matrix is returned.
- If output contains elements which cannot be simplified or elements of different types, a list is returned.
```
sapply(list, function, …)
list = Created list
function = the operation which you want to perform
```
**Example:**
```
# R program to illustrate sapply() function 
  
# Creating a list 
A = list(a = 1:5, b = 6:10) 
  
# applying sapply() 
means = sapply(A, mean) 
print(means) 
```

**Output**
```
a b
3 8
```

A vector is returned since the output had a list with elements of length 1.

- **tapply()**: This function is used to apply a function over subset of vectors given by a combination of factors.
```
tapply(vector, factor, function, …)

vector = Created vector
factor = Created factor
function = the operation which you want to perform
```
**Example:**
```
# R program to illustrate tapply() function 
  
# Creating a factor 
Id = c(1, 1, 1, 1, 2, 2, 2, 3, 3) 
  
# Creating a vector 
val = c(1, 2, 3, 4, 5, 6, 7, 8, 9) 
  
# applying tapply() 
result = tapply(val, Id, sum) 
print(result) 
```

**Output:**
```
1  2  3 
10 18 17 
```
How does the above code work?
![tapply!](/images/sapply.png)


- **mapply():** It’s a multivariate version of lapply(). This function can be applied over several list simultaneously.
```
mapply(function, list1, list2, …)

function = the operation which you want to perform
```

list1, list2 = Created lists

**Example:**
```
# R program to illustrate mapply() function 
  
# Creating a list 
A = list(c(1, 2, 3, 4)) 
  
# Creating another list 
B = list(c(2, 5, 1, 6)) 
  
# Applying mapply() 
result = mapply(sum, A, B) 
print(result) 
```

**Output:**
```
[1] 24
```













