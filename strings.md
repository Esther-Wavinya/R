# Strings
Strings are a bunch of character variables. It is a one-dimensional array of characters. One or more characters enclosed in a pair of matching single or double quotes can be considered a string in R. Strings represent textual content and can contain numbers, spaces, and special characters. An empty string is represented by using `“`. Strings are always stored as `double-quoted values` in R. Double quoted string can contain single quotes within it. Single quoted strings can’t contain single quotes. Similarly, double quotes can’t be surrounded by double quotes.

## Creation of String
Strings can be created by assigning character values to a variable. These strings can be further concatenated by using various functions and methods to form a big string. 

**Example:**

```
 # R program for String Creation

# creating a string with double quotes
str1 <- "OK1"
cat ("String 1 is : ", str1)

# creating a string with single quotes
str2 <- 'OK2'
cat ("String 2 is : ", str2)

str3 <- "This is 'acceptable and 'allowed' in R"
cat ("String 3 is : ", str3)

str4 <- 'Hi, Wondering "if this "works"'
cat ("String 4 is : ", str4)

str5 <- 'hi, ' this is not allowed'
cat ("String 5 is : ", str5)
```

**Output:**
```
String 1 is:  OK1
String 2 is:  OK2
String 3 is:  This is 'acceptable and 'allowed' in R
String 4 is:  Hi, Wondering "if this "works"
Error: unexpected symbol in "        str5 <- 'hi, ' this"
Execution halted
```

## Length of a String
The length of strings indicates the number of characters present in the string. The function **str_length()** belonging to the ‘**string**’ package or **nchar()** inbuilt function of R can be used to determine the `length of strings in R`. 

**Example 1: Using the str_length() function**

```
# R program for finding length of string

# Importing package
library(stringr)

# Calculating length of string	
str_length("hello")
```
**Output:**
```
5
```

**Example 2: Using nchar() function**
```
# R program to find length of string

# Using nchar() function
nchar("hel'lo")
```
**Output:**
```
6
```

## Accessing portions of a string
The individual characters of a string can be extracted from a string by using the indexing methods of a string. There are two R’s inbuilt functions in order to access both the single character as well as the substrings of the string. 

**substr()** or **substring()** function in R extracts substrings out of a string beginning with the start index and ending with the end index. It also replaces the specified substring with a new set of characters. 

**Syntax:**
```
substr(..., start, end)
or 
substring(..., start, end)
```

**Example 1: Using substr() function**
```
# R program to access
# characters in a string
 
# Accessing characters
# using substr() function
substr("Learn Code Tech", 1, 1)
```

**Output:** 

```
"L"
```

If the starting index is equal to the ending index, the corresponding character of the string is accessed. In this case, the first character, ‘L’ is printed. 

**Example 2: Using substring() function**
```
# R program to access characters in string
str <- "Learn Code"

# counts the characters in the string
len <- nchar(str)

# Accessing character using substring() function
print (substring(str, len, len))

# Accessing elements out of index
print (substring(str, len+1, len+1))
```
**Output:** 
```
[1] "e"
```

The number of characters in the string is `10`. The first print statement prints the last character of the string, `“e”`, which is str[10]. The second print statement prints the 11th character of the string, which doesn’t exist, but the code doesn’t throw an error and print “”, that is an empty character. 



The following R code indicates the mechanism of **String Slicing**, where in the substrings of a string are extracted: 
```
# R program to access characters in string
str <- "Learn Code"

# counts the number of characters of str = 10
len <- nchar(str)
print(substr(str, 1, 4))
print(substr(str, len-2, len))
```
**Output:**
```
[1]"Lear"
[1]"ode"
```
The `first print` statement prints the `first four characters` of the string. The `second print` statement prints the `substring from the indexes 8 to 10`, which is `“ode”`.



## Case Conversion
The string characters can be converted to upper or lower case by R’s inbuilt function **toupper()** which converts all the characters to `upper case`, **tolower()** which converts all the characters to `lower case`, and **casefold(…, upper=TRUE/FALSE)** which converts on the basis of the value specified to the upper argument. All these functions can take in multiple strings as arguments too. The `time complexity` of all the operations is **O**(number of characters in the string). 

**Example:** 
```
# R program to Convert case of a string
str <- "Hi LeArn CodiNG"
print(toupper(str))
print(tolower(str))
print(casefold(str, upper = TRUE))
```

**Output**
```
[1] "HI LEARN CODING"
[1] "hi learn coding"
[1] "HI LEARN CODING" 
```
By default, the value of upper in **casefold()** function is set to `FALSE`. If we set it to `TRUE`, the string gets printed in `upper case`.

## Updating strings
The characters, as well as substrings of a string, can be manipulated to new string values. The changes are reflected in the original string. In R, the string values can be updated in the following way:
```
substr (..., start, end) <- newstring
substring (..., start, end) <- newstring
```

Multiple strings can be updated at once, with the `start <= end`.

- If the length of the substring is larger than the new string, only the portion of the substring equal to the length of the new string is replaced.
- If the length of the substring is smaller than the new string, the position of the substring is replaced with the corresponding new string values.















