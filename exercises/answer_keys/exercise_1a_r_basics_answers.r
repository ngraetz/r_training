## 1. Start a new R script for the answers to this exercise. Add a header with your name, the date, and a description of the code. 
## Author: Your name
## Date: Today's date
## Description: Boot camp lecture 1A exercise

## 2. Load the `stats` and `ggplot2` packages (just for practice, we're not going to use these yet). 
library(boot)
library(stats)

## 3. Use two different functions to find the base 2 logarithm of 512 (hint: see the help file for `log()`). 
log(512, 2)
log2(512)

## 4. Consider the `round()` function. 
    ## a. Pull up the help file. 
    help(round)
    
    ## b. What does this function do? 
    # It takes a number and rounds it to the specified number of digits 
    
    ## c. What arguments does this function take? 
    # x = a number (or vector) to be rounded
    # digits = the number of decimal places to round to 
    
    ## d. Which (if any) arguments are required? 
    # x is required
    
    ## e. Which (if any) arguments have defaults? What are these defaults? 
    # digits defaults to 0
    
    ## f. Round 365/12 to the nearest 10th, naming all arguments. 
    round(x = 365/12, digits = 1)
    
    ## g. Round 365/52 to the nearest 100th, without naming any arguments. 
    round(365/52, 2)
    
## 5. Solve for x: $3x^2 + 5x - 20 = 0$ (hint: <https://en.wikipedia.org/wiki/Quadratic_formula>). 
(-5 + sqrt(5^2 - 4*3*-20))/(2*3)
(-5 - sqrt(5^2 - 4*3*-20))/(2*3)

