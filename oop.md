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






































