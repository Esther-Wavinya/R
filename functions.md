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

