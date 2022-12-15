# Functions
Functions are useful when you want to perform a certain task multiple times. A function accepts input arguments and produces the output by executing valid R commands that are inside the function. In R Programming Language when you are creating a function the function name and the file in which you are creating the function need not be the same and you can have one or more function definitions in a single R file.

**Types of function in R Language**
- **Built-in Function:** Built function R is `sq()`, `mean()`, `max()`, these function are directly call in the program by users.
- **User-defined Function:** R language allow us to write our own function.

## Functions in R Language
Functions are created in R by using the command **function()**. The general structure of the function file is as follows: 

![strusture of function!](/images/functions.png)

*Note:* In the above syntax `f` is the function name, this means that you are creating a function with name `f` which takes certain arguments and executes the following statements.

### Built-in Function in R Programming Language
Here we will use built-in function like `sum()`, `max()` and `min()`.

```
# Find sum of numbers 4 to 6.
print(sum(4:6))
 
# Find max of numbers 4 and 6.
print(max(4:6))
 
# Find min of numbers 4 and 6.
print(min(4:6))
```
**Output:**
```
[1] 15
[1] 6
[1] 4
```

### User-defined Functions in R Programming Language
R provides built-in functions like `print()`, `cat()`, etc. but we can also create our own functions. These functions are called user-defined functions.

**Example:**  
```
# A simple R function to check whether x is even or odd
 
evenOdd = function(x){
  if(x %% 2 == 0)
    return("even")
  else
    return("odd")
}
 
print(evenOdd(4))
print(evenOdd(3))
```

**Output:** 
```
[1] "even"
[1] "odd"
```


**Single Input Single Output**
Now create a function in R that will take a single input and gives us a single output. 


Following is an example to create a function that calculates the area of a circle which takes in the arguments the radius. So, to create a function, name the function as “`areaOfCircle`” and the arguments that are needed to be passed are the “`radius`” of the circle.  

```
# A simple R function to calculate area of a circle
 
areaOfCircle = function(radius){
  area = pi*radius^2
  return(area)
}
 
print(areaOfCircle(2))
```
**Output:** 
```
12.56637
```

**Multiple Input Multiple Output**
Now create a function in R Language that will take multiple inputs and gives us multiple outputs using a list. 

The functions in R Language takes multiple input objects but returned only one object as output, this is, however, not a limitation because you can create lists of all the outputs which you want to create and once the list is created you can access them into the elements of the list and get the answers which you want.

Let us consider this example to create a function “Rectangle” which takes “length” and “width” of the rectangle and returns area and perimeter of that rectangle. Since R Language can return only one object. Hence, create one object which is a list that contains “area” and “perimeter” and return the list. 

```
# A simple R function to calculate area and perimeter of a rectangle
 
Rectangle = function(length, width){
  area = length * width
  perimeter = 2 * (length + width)
   
  # create an object called result which is a list of area and perimeter
  result = list("Area" = area, "Perimeter" = perimeter)
  return(result)
}
 
resultList = Rectangle(2, 3)
print(resultList["Area"])
print(resultList["Perimeter"])
```

**Output:** 
```
$Area
[1] 6

$Perimeter
[1] 10
```

**Inline Functions in R Programming Language**
Sometimes creating an R script file, loading it, executing it is a lot of work when you want to just create a very small function. So, what we can do in this kind of situation is an `inline` function.

To create an inline function you have to use the function command with the argument `x` and then the expression of the function. 

```
# A simple R program to demonstrate the inline function
 
f = function(x) x^2*4+x/3
 
print(f(4))
print(f(-2))
print(0)
```
**Output:** 
```
65.33333
15.33333
0
```

**Passing arguments to Functions in R Programming Language**
There are several ways you can pass the arguments to the function: 

- **Case 1:** Generally in R, the arguments are passed to the function in the same order as in the function definition.
- **Case 2:** If you do not want to follow any order what you can do is you can pass the arguments using the names of the arguments in any order.
- **Case 3:** If the arguments are not passed the default values are used to execute the function.


Now, let us see the examples for each of these cases in the following R code:
```
# A simple R program to demonstrate passing arguments to a function
 
Rectangle = function(length=5, width=4){
  area = length * width
  return(area)
}
 
# Case 1:
print(Rectangle(2, 3))
 
# Case 2:
print(Rectangle(width = 8, length = 4))
 
# Case 3:
print(Rectangle())
```

**Output:** 
```
6
32
20
```

**Lazy evaluations of Functions in R Programming Language**
In R the functions are executed in a lazy fashion. When we say lazy what it means is if some arguments are missing the function is still executed as long as the execution does not involve those arguments.

**Example:** 

In the function “Cylinder” given below. There are defined three-argument “`diameter`”, “`length`” and “`radius`” in the function and the `volume` calculation does not involve this argument “`radius`” in this calculation. Now, when you pass this argument “`diameter`” and “`length`” even though you are not passing this “`radius`” the function will still execute because this `radius is not used in the calculations inside the function`. 
Let’s illustrate this in an R code given below:

```
# A simple R program to demonstrate Lazy evaluations of functions
 
Cylinder = function(diameter, length radius ){
  volume = pi*diameter^2*length/4
  return(volume)
}
 
# This'll execute because this radius is not used in the calculations inside the function.
print(Cylinder(5, 10))
```
**Output:** 
```
196.3495
```

If you do not pass the argument and then use it in the definition of the function it will throw an error that this “`radius`” is not passed and it is being used in the function definition.
```
# A simple R program to demonstrate Lazy evaluations of functions
 
Cylinder = function(diameter, length, radius ){
  volume = pi*diameter^2*length/4
  print(radius)
  return(volume)
}
 
# This'll throw an error
print(Cylinder(5, 10))
```
**Output:** 
```
Error in print(radius) : argument "radius" is missing, with no default 
```


# Function Arguments in R Programming

Arguments are the parameters provided to a function to perform operations in a programming language. In R programming, we can use as many arguments as we want and are separated by a comma. There is no limit on the number of arguments in a function in R. In this article, we’ll discuss different ways of adding arguments in a function in R programming.

## Adding Arguments in R
We can pass an argument to a function while calling the function by simply giving the value as an argument inside the parenthesis. Below is an implementation of a function with a single argument.

```
# Function definition to check n is divisible by 5 or not
divisbleBy5 <- function(n){
  if(n %% 5 == 0)
  {
	return("number is divisible by 5")
  }
  else
  {
	return("number is not divisible by 5")
  }
}

# Function call
divisbleBy5(100)
divisbleBy5(4)
divisbleBy5(20.0)
```
**Output**
```
[1] "number is divisible by 5"
[1] "number is not divisible by 5"
[1] "number is divisible by 5"
```

**Adding Multiple Arguments in R**
A function in R programming can have multiple arguments too. Below is an implementation of a function with multiple arguments.

**Example:**
```
# Function definition to check a is divisible by b or not
divisible <- function(a, b){
  if(a %% b == 0)
  {
    return(paste(a, "is divisible by", b))
  }
  else 
  {
    return(paste(a, "is not divisible by", b))
  }
}
  
# Function call
divisible(7, 3)
divisible(36, 6)
divisible(9, 2)
```

**Output:**
```
[1] "7 is not divisible by 3"
[1] "36 is divisible by 6"
[1] "9 is not divisible by 2"
```

**Adding Default Value in R**
Default value in a function is a value that is not required to specify each time the function is called. If the value is passed by the user, then the user-defined value is used by the function otherwise, the default value is used. Below is an implementation of function with default value.

**Example:**
```
# Function definition to check a is divisible by b or not. If b is not provided in function call, then divisibility of a is checked with 3 as default
divisible <- function(a, b = 3){
  if(a %% b == 0)
  {
    return(paste(a, "is divisible by", b))
  } 
  else
  {
    return(paste(a, "is not divisible by", b))
  }
}
  
# Function call
divisible(10, 5)
divisible(12)
```
**Output:**
```
[1] "10 is divisible by 5"
[1] "12 is divisible by 3"
```

**Dots Argument**
Dots argument (`…`) is also known as ellipsis which allows the function to take an undefined number of arguments. It allows the function to take an arbitrary number of arguments. Below is an example of a function with an arbitrary number of arguments.

**Example:**
```
# Function definition of dots operator
fun <- function(n, ...){
  l <- list(n, ...)
  paste(l, collapse = " ")
}
  
# Function call
fun(5, 1L,  6i, TRUE, "GeeksForGeeks", "Dots operator")
```
**Output:**
```
[1] "5 1 0+6i TRUE GeeksForGeeks Dots operator"
```

**Function as Argument**
In R programming, functions can be passed to another functions as arguments. Below is an implementation of function as an argument.

**Example:**
```
# Function definition. Function is passed as argument
fun <- function(x, fun2){
  return(fun2(x))
}
  
# sum is built-in function
fun(c(1:10), sum)
  
# mean is built-in function
fun(rnorm(50), mean)
```
**Output:**
```
[1] 55
[1] 0.2153183
```

# Types of Functions in R Programming
A function is a set of statements orchestrated together to perform a specific operation. A function is an object so the interpreter is able to pass control to the function, along with arguments that may be necessary for the function to accomplish the actions. The function in turn performs the task and returns control to the interpreter as well as any return values that may be stored in other objects.
 
## How to Define a Function?
In R programming, a function can be defined using the keyword function. The syntax to define a function in R is as follows:  
**Syntax:**
```
function_name = function(arg_1, arg_2, …)
{ 
 Function body 
} 
```

The various components/parts of a function are: 
 

- **Function name:** It is the actual name of the function. It is stored in R environment as an object with this name.
- **Arguments:** An argument is a placeholder. Whenever a function is invoked, a value if passed to the argument.They are optional; that is, a function may contain no arguments. Also arguments can have default values.
- **Function Body:** It contains all the set of statements that defines what actually the function does.
- **Return Values:** It is the values that function returns after the successful execution of the tasks.
In more general,it is the last expression in the function body to be evaluated.

### Calling a Function 

It is nothing but calling the original function with a valid number of arguments. A function can be called with an argument, without an argument and with a default value as well.

 

**Example:** Calling a function without an argument

```
# create a function cube without an argument
cube <- function()
{
  for(i in 1:10)
  {
    print(i^3)
  }
}
 
# calling function cube without an argument
cube()
```
**Output:**
```
[1] 1
[1] 8
[1] 27
[1] 64
[1] 125
[1] 216
[1] 343
[1] 512
[1] 729
[1] 1000
```

**Example:** Calling a function with an argument.
```
# create a function factorial with a numeric argument n
factorial <- function(n)
{
  if(n==0)
  {
    return(1)
  }
  else
  {
    return(n * factorial(n - 2))
  }
}
 
# calling function cube with an argument
factorial(7)
```

**Output:**
```
[1] 5040
```
**Example:** Calling a function with default argument.
```
# create a function def_arg without an argument
def_arg <- function(a = 23, b = 35)
{
  output <- (a + b) * a + (a - b) * b
  print(output)
}
 
# calling function def_arg without an argument
def_arg()
 
# call the function with giving new values of the argument.
def_arg(16, 22)
```
**Output:**
```
[1] 914
[1] 476
```

## Types of Function
There are mainly three types of function in R programming: 
 

- Primitive Functions
- Infix Functions
- Replacement Functions
 

### Primitive Functions
Generally, a function comprises of three parts: 
 

- The **formals()**, the list of arguments that control how you call the function.
- The **body()**, the code inside the function.
- The **environment()**, the data structure that determines how the function finds the values associated with the names.

The formals and body are defined explicitly whenever one creates a function, but the environment is specified implicitly, based on where you define the function. But there is an exception to the rule that a function has three components, some functions call C code directly. These functions are known as primitive functions. Primitive functions exist primarily in C, not R, so their **formals()**, **body()**,and **environment()** are NULL. These functions are only found in the base package. Primitive functions are harder to write but are highly efficient. They are of two types, either type builtin or type special. 
```
typeof(sum)
typeof('[')
```

```
[1] "builtin"    #> typeof(sum)
[1] "character"  #> typeof('[')
```

**Example:** To print the names of available primitive functions in your R console run the following code.
```
names(methods:::.BasicFunsList)
```
**Output:**
```
  [1] "$"                    "$<-"                  "["                    "[<-"                  "[["                   "[[="                   "cosh"                 "cummax"               "dimnames<-"          
 [22] "as.raw"               "log2"                 "tan"                  "dim"                  "as.logical"           "^"                    "is.finite"           
 [29] "sinh"                 "log10"                "as.numeric"           "dim<-"                "is.array"             "tanpi"                "gamma"               
 [36] "atan"                 "as.integer"           "Arg"                  "signif"               "cumprod"              "cos"                  "length"              
 [43] "!="                   "digamma"              "exp"                  "floor"                "acos"                 "seq.int"              "abs"                 
 [50] "length<-"             "sqrt"                 "!"                    "acosh"                "is.nan"               "Re"                   "tanh"                
 [57] "names"                "cospi"                "&"                    "anyNA"                "trunc"                "cummin"               "levels<-"            
 [64] "*"                    "Mod"                  "|"                    "names<-"              "+"                    "log"                  "lgamma"              
 [71] "as.complex"           "asinh"                "-"                    "sin"                  "/"                    "as.environment"       "<="                  
 [78] "as.double"            "is.infinite"          "is.numeric"           "rep"                  "round"                "sinpi"                "dimnames"            
 [85] "asin"                 "as.character"         "%/%"                  "is.na"                ""                    "Im"                  
 [92] "%%"                   "trigamma"             "=="                   "cumsum"               "atanh"                "sign"                 "ceiling"             
 [99] "Conj"                 "as.call"              "log1p"                "expm1"                "("                    ":"                    "="                   
[106] "@"                    "{"                    "~"                    "&&"                   ".C"                   "baseenv"              "quote"               
[113] "<-"                   "is.name"              "if"                   "||"                   "attr<-"               "untracemem"           ".cache_class"        
[120] "substitute"           "interactive"          "is.call"              "switch"               "function"             "is.single"            "is.null"             
[127] "is.language"          "is.pairlist"          ".External.graphics"   "globalenv"            "class<-"              ".Primitive"           "is.logical"          
[134] "enc2utf8"             "UseMethod"            ".subset"              "proc.time"            "enc2native"           "repeat"               "<<-"                 
[141] "@<-"                  "missing"              "nargs"                "isS4"                 ".isMethodsDispatchOn" "forceAndCall"         ".primTrace"          
[148] "storage.mode<-"       ".Call"                "unclass"              "gc.time"              ".subset2"             "environment<-"        "emptyenv"            
[155] "seq_len"              ".External2"           "is.symbol"            "class"                "on.exit"              "is.raw"               "for"                 
[162] "is.complex"           "list"                 "invisible"            "is.character"         "oldClass<-"           "is.environment"       "attributes"          
[169] "break"                "return"               "attr"                 "tracemem"             "next"                 ".Call.graphics"       "standardGeneric"     
[176] "is.atomic"            "retracemem"           "expression"           "is.expression"        "call"                 "is.object"            "pos.to.env"          
[183] "attributes<-"         ".primUntrace"         "...length"            ".External"            "oldClass"             ".Internal"            ".Fortran"            
[190] "browser"              "is.double"            ".class2"              "while"                "nzchar"               "is.list"              "lazyLoadDBfetch"     
[197] "...elt"               "is.integer"           "is.function"          "is.recursive"         "seq_along"            "unlist"               "as.vector"           
[204] "lengths"   
```

### Infix Functions
Infix functions are those functions in which the function name comes in between its arguments, and hence have two arguments. R comes with a number of built-in infix operators such as **:, ::, :::, $, @, ^, *, /, +, -, >, >=, <, <=, ==, !=, !, &, &&, |, ||, ~, <-, and <<-**. One can create his own infix functions that start and end with `%`. The name of an infix function is more flexible as it can contain any sequence of characters except %. There are some predefined infix operators in R programming. 

| Operators | Description |
| --------- | ------------|
|%%	|Remainder operator |
| %/%  |	Integer Division |
| %*%	| Matrix multiplication |
| %o%	| Outer Product  |
| %x%	| Kronecker product |
| %in%	|Matching Operator  |

**Example:** Create a two argument function that gives greater of two numbers and bind it to a name that starts and ends with %.

```
# R program to illustrate Infix function
 
'%Greater%' <- function(a, b)
{
  if(a > b) print(a)
  else if(b > a) print(b)
  else print("equal")
}
5 %Greater% 7
2300 %Greater% 67
```

**Output:**
```
[1] 7
[1] 2300
```

### Replacement Functions
Replacement functions modify their arguments in place(modifying an R object usually creates a copy). The name of replacement functions are always succeeded by `<`. They must have arguments named `x` and `value`, and return the modified object. In case of a replacement, a function needs additional arguments, the additional arguments should be placed between `x and value`, and must be called with additional arguments on the left. The name of the function has to be quoted as it is a syntactically valid but non-standard name and the parser would interpret `<-` as the operator not as part of the function name if it weren’t quoted.

**Syntax:**
```
“function_name<-” <- function(x, additional arguments, value) 
{ 
function body 
} 
```
**Example:**
```
# R program to illustrate replacement function
 
"replace<-" <- function(x, value)
{
  x[1] = value
  x
}
x = rep.int(5, 7)
replace(x) = 0L
print(x)
```
**Output:**
```
[1] 0 5 5 5 5 5 5
```


# Recursive Functions in R Programming

Recursion, in the simplest terms, is a type of looping technique. It exploits the basic working of functions in R. Recursion is when the function calls itself. This forms a loop, where every time the function is called, it calls itself again and again and this technique is known as recursion. Since the loops increase the memory we use the recursion. The recursive function uses the concept of recursion to perform iterative tasks they call themselves, again and again, which acts as a loop. These kinds of functions need a stopping condition so that they can stop looping continuously.

Recursive functions call themselves. They break down the problem into smaller components. The function() calls itself within the original function() on each of the smaller components. After this, the results will be put together to solve the original problem.

**Example: Factorial using Recursion in R**
```
rec_fac <- function(x){
    if(x==0 || x==1)
    {
        return(1)
    }   
    else
    {
        return(x*rec_fac(x-1))
    }
}
```
**Output:**
```
[1] 120
```
Here, `rec_fac(5)`calls `rec_fac(4)`, which then calls `rec_fac(3)`, and so on until the input argument `x`, has reached `1`. The function returns `1` and is destroyed. The return value is multiplied with argument value and returned. This process continues until the first function call returns its output, giving us the final result.

**Example: Sum of Series Using Recursion**
Recursion in R is most useful for finding the sum of self-repeating series. In this example, we will find the sum of squares of a given series of numbers.

Sum = 12+22+…+N2

**Example:**
```
sum_series <- function(vec){
    if(length(vec)<=1)
    {
        return(vec^2)
    }
    else
    {
        return(vec[1]^2+sum_series(vec[-1]))
    }
}
series <- c(1:10)
sum_series(series)
```
**Output:**
```
[1] 385
```

## Key Features of R Recursion
- The use of recursion, often, makes the code shorter and it also looks clean.
- It is a simple solution for a few cases.
- It expresses in a function that calls itself.


## Applications of Recursion in R
- Recursive functions are used in many efficient programming techniques like dynamic programming language(DSL) or divide and conquer algorithms.
- In dynamic programming, for both top-down as well as bottom-up approaches, recursion is vital for performance.
- In divide and conquer algorithms, we divide a problem into smaller sub-problems that are easier to solve. The output is then built back up to the top. Recursion has a similar process, which is why it is used to implement such algorithms.
- In its essence, recursion is the process of breaking down a problem into many smaller problems, these smaller problems are further broken down until the problem left is trivial. The solution is then built back up piece by piece.


# Conversion Functions in R Programming
Sometimes to analyze data using R, we need to convert data into another data type. As we know R has the following data types Numeric, Integer, Logical, Character, etc. similarly R has various conversion functions that are used to convert the data type.

In R, Conversion Function are of two types:

- Conversion Functions for Data Types
- Conversion Functions for Data Structures

## Conversion Functions For Data Types
There are various conversion functions available for Data Types. These are:

- **as.numeric()**
Decimal value known numeric values in R. It is the default data type for real numbers in R. In R `as.numeric()` converts any values into numeric values.
**Syntax:**
```
// Conversion into numeric data type
as.numeric(x)
```
**Example:**
```
# A simple R program to convert character data type into numeric data type
x<-c('1', '2', '3')
  
# Print x
print(x)
  
# Print the type of x
print(typeof(x))
  
# Conversion into numeric data type
y<-as.numeric(x)
  
# print the type of y
print(typeof(y))
```
**Output:**
```
Output:

[1] "1" "2" "3"
[1] "character"
[1] "double"
```

- **as.integer()**
In R, Integer data type is a collection of all integers. In order to create an integer variable in R and convert any data type in to Integer we use **as.integer()** function.

**Syntax:**
```
// Conversion of any data type into Integer data type
as.integer(x)
```
**Example:**
```
# A simple R program to convert numeric data type into integer data type
x<-c(1.3, 5.6, 55.6)
  
# Print x
print(x)
  
# Print type of x
print(typeof(x))
  
# Conversion into integer data type
y<-as.integer(x)
  
# Print y
print(y)
  
# Print type of y
print(typeof(y))
```

**Output:**
```
[1]  1.3  5.6 55.6
[1] "double"
[1]  1  5 55
[1] "integer"
```

- **as.character()**
In R, character data is used to store `character value and string`. To create an character variable in R, we invoke the **as.character()** function and also if we want to convert any data type in to character we use **as.character()** function.

**Syntax:**
```
// Conversion of any data type into character data type
as.character(x)
```

**Example:**
```
x<-c(1.3, 5.6, 55.6)
  
# Print x
print(x)
  
# Print type of x
print(typeof(x))
  
# Conversion into character data type
y<-as.character(x)
  
# Print y
print(y)
  
# Print type of y
print(typeof(y))
```

**Output:**
```
[1]  1.3  5.6 55.6
[1] "double"
[1] "1.3"  "5.6"  "55.6"
[1] "character"
```
- **as.logical()**
Logical value is created to compare variables which return either true or false.To compare variables and to convert any value in to true or false, R uses **as.logical()** function.

**Syntax:**
```
// Conversion of any data type into logical data type
as.logical(x)
```

**Example:**
```
x = 3
y = 8
  
# Conversion in to logical value
result<-as.logical(x>y)
  
# Print result
print(result)
```

**Output:**
```
[1] FALSE
```

- **as.date()**
In R **as.date()** function is used to convert string into date format.

**Syntax:**
```
// Print string into date format
as.date(variable, "%m/%d/%y")
```

**Example:**
```
dates <- c("02/27/92", "02/27/92", 
           "01/14/92", "02/28/92", 
           "02/01/92")
  
# Conversion into date format
result<-as.Date(dates, "%m/%d/%y")
  
# Print result
print(result)
```

**Output:**
```
[1] "1992-02-27" "1992-02-27" "1992-01-14" "1992-02-28" "1992-02-01"
```

## Conversion Functions For Data Structure
There are various conversion functions available for Data Structure. These are:

- **as.data.frame()**
Data Frame is used to store data tables. Which is list of vectors of equal length. In R, sometimes to analyse data we need to convert list of vector into data.frame. So for this R uses **as.data.frame()** function to convert list of vector into data frame.

**Syntax:**
```
// Conversion of any data structure into data frame
as.data.frame(x)
```
**Example:**
```
x<- list( c('a', 'b', 'c'),
c('e', 'f', 'g'), c('h', 'i', 'j'))
  
# Print x
print(x)
  
# Conversion in to data frame
y<-as.data.frame(x)
  
# Print y
print(y)
```
**Output:**
```
[[1]]
[1] "a" "b" "c"

[[2]]
[1] "e" "f" "g"

[[3]]
[1] "h" "i" "j"

  c..a....b....c.. c..e....f....g.. c..h....i....j..
1                a                e                h
2                b                f                i
3                c                g                j
```


- **as.vector()**
R has a function **as.vector()** which is used to convert a distributed matrix into a non-distributed vector. Vector generates a vector of the given length and mode.

**Syntax:**
```
// Conversion of any data structure into vector
as.vector(x)
```

**Example:**
```
x<-c(a=1, b=2)
  
# Print x
print(x)
  
# Conversion into vector
y<-as.vector(x)
  
# Print y
print(y)
```

**Output:**
```
a b 
1 2 
[1] 1 2
```

- **as.matrix()**
In R, there is a function **as.matrix()** which is used to convert a data.table into a matrix, optionally using one of the columns in the data.table as the matrix row names.

**Syntax:**
```
// Conversion into matrix
as.matrix(x)
```

**Example:**
```
# Importing library
library(data.table)
x <- data.table(A = letters[1:5], X = 1:5, Y = 6:10)
  
# Print x
print(x)
  
# Conversion into matrix
z<-as.matrix(x)
  
# Print z
print(z)
```

**Output:**
```
   A X  Y
1: a 1  6
2: b 2  7
3: c 3  8
4: d 4  9
5: e 5 10
     A   X   Y   
[1,] "a" "1" " 6"
[2,] "b" "2" " 7"
[3,] "c" "3" " 8"
[4,] "d" "4" " 9"
[5,] "e" "5" "10"
```









