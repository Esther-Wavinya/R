# Taking Input from User in R Programming
Developers often have a need to interact with users, either to get data or to provide some sort of result. Most programs today use a dialog box as a way of asking the user to provide some type of input. Like other programming languages in R it’s also possible to take input from the user. For doing so, there are two methods in R. 
- Using **readline()** method
- Using **scan()** method

## Using readline() method
In R language **readline()** method takes input in string format. If one inputs an integer then it is inputted as a string, lets say, one wants to input **255**, then it will input as **“255”**, like a string. So one needs to convert that inputted value to the format that he needs. In this case, string **“255”** is converted to integer 255. To convert the inputted value to the desired data type, there are some functions in R, 
 

- **as.integer(n)**; —> convert to integer
- **as.numeric(n)**; —> convert to numeric type (float, double etc)
- **as.complex(n)**; —> convert to complex number (i.e 3+2i)
- **as.Date(n)** —> convert to date …, etc

**Syntax:**
``` 
var = readline(); 
var = as.integer(var);
Note that one can use “<-“ instead of “=” 
```

**Example:** 

 ```
# R program to illustrate taking input from the user
 
# taking input using readline(). This command will prompt you to input a desired value
var = readline();
 
# convert the inputted value to integer
var = as.integer(var);
 
# print the value
print(var)
```

**Output:**
```
255
[1] 255
```

One can also show message in the console window to tell the user, what to input in the program. To do this one must use a argument named `prompt` inside the    `readline()` function. Actually **prompt** argument facilitates other functions to constructing of files documenting. But `prompt` is not mandatory to use all the time.

**Syntax:**
```
var1 = readline(prompt = “Enter any number : “); 
or, 
var1 = readline(“Enter any number : “);
```

**Example:**
```
# R program to illustrate taking input from the user
 
# taking input with showing the message
var = readline(prompt = "Enter any number : ");
 
# convert the inputted value to an integer
var = as.integer(var);
 
# print the value
print(var)
```

**Output:**
```
Enter any number : 255
[1] 255
```

### Taking multiple inputs in R
Taking multiple inputs in R language is same as taking single input, just need to define multiple **readline()** for inputs. One can use `braces` to define multiple **readline()** inside it.

**Syntax:**
```
var1 = readline(“Enter 1st number : “); 
var2 = readline(“Enter 2nd number : “); 
var3 = readline(“Enter 3rd number : “); 
var4 = readline(“Enter 4th number : “);
or,
{ 
var1 = readline(“Enter 1st number : “); 
var2 = readline(“Enter 2nd number : “); 
var3 = readline(“Enter 3rd number : “); 
var4 = readline(“Enter 4th number : “); 
}
```
**Example:**
```
# R program to illustrate taking input from the user
 
# taking multiple inputs using braces
{
    var1 = readline("Enter 1st number : ");
    var2 = readline("Enter 2nd number : ");
    var3 = readline("Enter 3rd number : ");
    var4 = readline("Enter 4th number : ");
}
 
# converting each value
var1 = as.integer(var1);
var2 = as.integer(var2);
var3 = as.integer(var3);
var4 = as.integer(var4);
 
# print the sum of the 4 number
print(var1 + var2 + var3 + var4)
```
**Output:** 
```
Enter 1st number : 12
Enter 2nd number : 13
Enter 3rd number : 14
Enter 4th number : 15
[1] 54
```

**Taking String and Character input in R** 

To take string input is the same as an integer. For “String” one doesn’t need to convert the inputted data into a string because R takes input as string always. And for “character”, it needs to be converted to ‘character’. Sometimes it may not cause any error. One can take character input as same as string also, but that inputted data is of type string for the entire program. So the best way to use that inputted data as ‘character’ is to convert the data to a character.

**Syntax:**
```
string:
var1 = readline(prompt = “Enter your name : “);

character: 
var1 = readline(prompt = “Enter any character : “); 
var1 = as.character(var1)
```
**Example:**
 ```
# R program to illustrate taking input from the user
 
# string input
var1 = readline(prompt = "Enter your name : ");
 
# character input
var2 = readline(prompt = "Enter any character : ");
# convert to character
var2 = as.character(var2)
 
# printing values
print(var1)
```

**Output:** 
```
Enter your name : GeeksforGeeks
Enter any character : G
[1] "GeeksforGeeks"
[1] "G"
```

## Using scan() method
Another way to take user input in R language is using a method, called **scan()** method. This method takes input from the console. This method is a very handy method while inputs are needed to be taken quickly for any mathematical calculation or for any dataset. This method reads data in the form of a `vector` or `list`. This method also used to read input from a file. 

**Syntax:**
```
x = scan()

scan() method takes input continuously. To terminate the input process, you need to press Enter key 2 times on the console.
```
**Example:**
This is simple method to take input using `scan()` method, where some integer number is taken as an input and prints values in the next line on the console. 
```
# R program to illustrate taking input from the user
 
# taking input using scan()
x = scan()
# print the inputted values
print(x)
```
**Output:** 
```
1: 1 2 3 4 5 6
7: 7 8 9 4 5 6
13: 
Read 12 items
 [1] 1 2 3 4 5 6 7 8 9 4 5 6
```
**Explanation:**
Total `12` integers are taken as input in 2 lines. The control goes to 3rd line. When you press `Enter` key 2 times the input process is terminated.

### Taking double, string, character type values using scan() method
To take double, string, character types inputs, specify the type of the inputted value in the **scan()** method. To do this there is an argument called **what**, by which one can specify the data type of the inputted value.

**Syntax:**
``` 
x = scan(what = double()) —-for double 
x = scan(what = ” “) —-for string 
x = scan(what = character()) —-for character 
```
** Example:**
```
# R program to illustrate taking input from the user
 
# double input using scan()
d = scan(what = double())
 
# string input using 'scan()'
s = scan(what = " ")
 
# character input using 'scan()'
c = scan(what = character())
 
# print the inputted values
print(d) # double
print(s) # string
print(c) # character
```
**Output:** 
```
1: 123.321 523.458 632.147
4: 741.25 855.36
6: 
Read 5 items

1: geeksfor geeks gfg
4: c++ R java python
8: 
Read 7 items

1: g e e k s f o
8: r g e e k s
14: 
Read 13 items

[1] 123.321 523.458 632.147 741.250 855.360
[1] "geeksfor" "geeks"    "gfg"      "c++"      "R"        "java"     "python"  
[1] "g" "e" "e" "k" "s" "f" "o" "r" "g" "e" "e" "k" "s"
```

**Explanation:**
Here, `count of double items is 5`, `count of sorting items is 7`, `count of character items is 13`.

### Read File data using scan() method
To read file using **scan()** method is same as normal console input, only thing is that, one needs to pass the file name and data type to the **scan()** method.

**Syntax:**
``` 
x = scan(“fileDouble.txt”, what = double()) —-for double 
x = scan(“fileString.txt”, what = ” “) —-for string 
x = scan(“fileChar.txt”, what = character()) —-for character
```
**Example:**
```
# R program to illustrate taking input from the user
 
# string file input using scan()
s = scan("fileString.txt", what = " ")
 
# double file input using scan()
d = scan("fileDouble.txt", what = double())
 
# character file input using scan()
c = scan("fileChar.txt", what = character())
 
# print the inputted values
print(s) # string
print(d) # double
print(c) # character
```
**Output:**
```
Read 7 items
Read 5 items
Read 13 items

[1] "geek"   "for"    "geeks"  "gfg"    "c++"    "java"   "python"
[1] 123.321 523.458 632.147 741.250 855.360
[1] "g" "e" "e" "k" "s" "f" "o" "r" "g" "e" "e" "k" "s"
```
Save the data file in the same location where the program is saved for better access. Otherwise total path of the file need to defined inside the **scan()** method.


# Printing Output of an R Program
In R there are various methods to print the output. Most common method to print output in R program is using a function called **print()** is used. Also if the program of R is written over the console line by line then the output is printed normally, no need to use any function to print that output. To do this just select the output variable and press **run** button. **Example:**
```
# select 'x' and then press 'run' button it will print 'GeeksforGeeks' on the console

x <- "GeeksforGeeks"
x
```
**Output**
```
[1] "GeeksforGeeks"
```

## Print output using print() function
Using `print()` function to print output is the most common method in R. Implementation of this method is very simple.

**Syntax:** 
```
print(“any string”) or, print(variable)
```
**Example:**
```
# R program to illustrate printing output of an R program
 
# print string
print("GFG")
 
# print variable
# it will print 'GeeksforGeeks' on the console
x <- "GeeksforGeeks"
print(x)
```
**Output:**
```
[1] "GFG"
[1] "GeeksforGeeks"
```
## Print output using paste() function inside print() function
R provides a method **paste()** to print output with `string and variable` together. This method is defined inside the **print()** function. **paste()** converts its arguments to character strings. One can also use `paste0()` method.

**Note:**
The difference between `paste()` and `paste0()` is that the argument set by default is ” “(paste) and “”(paste0).

**Syntax**
```
print(paste(“any string”, variable)) or, 

print(paste0(variable, “any string”))
```

**Example**
```
# R program to illustrate printing output of an R program
 
x <- "GeeksforGeeks"
 
# using paste inside print()
print(paste(x, "is best (paste inside print())"))
 
# using paste0 inside print()
print(paste0(x, "is best (paste0 inside print())"))
```
**Output:**
```
[1] "GeeksforGeeks is best (paste inside print())"
[1] "GeeksforGeeksis best (paste0 inside print())"
```
## Print output using sprintf() function
**sprintf()** is basically a **C library** function. This function is use to print string as **C language**. This is working as a wrapper function to print `values and strings` together like **C language**. This function returns a character vector containing a formatted combination of string and variable to be printed.
**Syntax:**
```
sprintf(“any string %d”, variable) or, 

sprintf(“any string %s”, variable) or, 

sprintf(“any string %f”, variable)) etc.
```
**Example":**
```
# R program to illustrate printing output of an R program
 
x = "GeeksforGeeks" # string
x1 = 255            # integer
x2 = 23.14          # float
 
# string print
sprintf("%s is best", x)
 
# integer print
sprintf("%d is integer", x1)
 
# float print
sprintf("%f is float", x2)
```
**Output**
```
> sprintf("%s is best", x)
[1] "GeeksforGeeks is best"

> sprintf("%d is integer", x1)
[1] "255 is integer"

> sprintf("%f is float", x2)
[1] "23.140000 is float"
```

## Print output using cat() function
Another way to print output in R is using of **cat()** function. It’s same as **print()** function. **cat()** converts its arguments to character strings. This is useful for printing output in user defined functions.

**Syntax**
```
cat(“any string”) or, 
cat(“any string”, variable)
```
**Example**
```
# R program to illustrate printing output of an R program
 
# print string with variable "\n" for new line
x = "GeeksforGeeks"
cat(x, "is best\n")
 
# print normal string
cat("This is R language")
```
**Output**
```
GeeksforGeeks is best
This is R language
```
## Print output using message() function
Another way to print something in R by using **message()** function. This is not used to print output but its used to show simple diagnostic messages which are `warnings or errors` in the program. But it can be used for normal uses for printing output.
**Syntax:**
```
message(“any string”) or, 
message(“any string”, variable)
```
**Example:**
```
# R program to illustrate printing output of an R program
 
x = "GeeksforGeeks"
# print string with variable
message(x, "is best")
 
# print normal string
message("This is R language")
```
**Output**
```
GeeksforGeeks is best
This is R language 
```
## Write output to a file
To print or write a file with a value of a variable use a function called **write()**. This function is used a option called **table** to write a file.

**Syntax**
```
write.table(variable, file = “file1.txt”) or, 
write.table(“any string”, file = “file1.txt”)
```
**Example:**
```
# R program to illustrate printing output of an R program
 
x = "GeeksforGeeks"
# write variable
write.table(x, file = "my_data1.txt")
 
# write normal string
write.table("GFG is best", file = "my_data2.txt")
```
**Output**
```
"x"
"1" "GeeksforGeeks"
"x"
"1" "GFG is best"
```

# Print the Argument to the Screen in R Programming – print() Function
**print()** function in R Language is used to print out the argument to the screen.

**Syntax:** `print(x, digits, na.print)`

**Parameters:**
**x:** specified argument to be displayed
**digits:** defines minimal number of significant digits
**na.print:** indicates NA values output format

**Example 1:**
```
# R program to illustrate print function
  
# Creating a data frame
x <- cars[1:5, ]
  
# Calling the print() function to print the above data frame
print(x)
```
**Output:**
```
  speed dist
1     4    2
2     4   10
3     7    4
4     7   22
5     8   16
```

**Example 2:**
```
# R program to illustrate print function
  
# Initializing a number
x <- 15 / 7
  
# Calling the print() function using digits parameter
print(x, digits = 2)
print(x, digits = 3)
print(x, digits = 4)
```
**Output:**
```
[1] 2.1
[1] 2.14
[1] 2.143 
```
**Example 3:**
```
# R program to illustrate print function
  
# Creating a matrix
x <- matrix(c(2, NA, 5, NA, 8, NA, 22, 67, 43),
               nrow = 3, byrow = TRUE)
  
# Calling the print() function using na.print parameter
print(x, na.print = "")
```
**Output:**
```
     [, 1] [, 2] [, 3]
[1, ]    2         5
[2, ]         8     
[3, ]   22   67   43
```















