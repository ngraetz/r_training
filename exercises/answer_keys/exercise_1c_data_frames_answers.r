## For this exercise, we will use the `msleep` data frame from the `ggplot2` library. This can be loaded using the following code: 
library(ggplot2)
data("msleep")
msleep <- data.frame(msleep) 

## Some information about the data set is available in the help file for `msleep`. 
## 1. Check that `msleep` is a data frame.
is.data.frame(msleep)
class(msleep)

## 2. Use each of the following functions to explore the data frame: `head()`, `tail()`, `summary()`, and `View()`.
head(msleep)
tail(msleep) 
summary(msleep) 
View(msleep) 

## 3. How many rows and columns does this data frame have? 
nrow(msleep)
ncol(msleep)
dim(msleep) 

## 4. What are the names of the columns? What data type is each column? 
names(msleep) 
str(msleep)

## 5. Select the `name` column three different ways. 
msleep[, 1]
msleep[, "name"]
msleep$name

## 6. Select just rows where the `order` column is "Carnivora."
msleep[msleep$order == "Carnivora",]

## 7. Select just rows for animals with body weight > 200kg. 
msleep[msleep$bodywt > 200,]

## 8. Create a new variable for the total amount of sleep in minutes (`sleep_total_min`).
msleep$sleep_total_min <- msleep$sleep_total * 60 

    ## a. What is the longest time any animal sleeps (in minutes)? 
    max(msleep$sleep_total_min)
    
    ## b. Which animal sleeps this long? 
    msleep[msleep$sleep_total_min == max(msleep$sleep_total_min), "name"]
    msleep$name[msleep$sleep_total_min == max(msleep$sleep_total_min)]
    
## 9. Create a new variable for the proportion of total sleep spent in REM (`prop_rem`). 
msleep$prop_rem <- msleep$sleep_rem / msleep$sleep_total

    ## a. What is the minimum proportion? (hint, look at the argument options in the help file for `min()`)
    min(msleep$prop_rem, na.rm=T)
    min(msleep$prop_rem[!is.na(msleep$prop_rem)])
    
    ## b. How long is REM sleep for the animal with the smallest proportion REM? (hint, this requires two conditions be met: `prop_rem` is NOT missing, and `prop_rem` is the minimum value)
    msleep$sleep_rem[msleep$prop_rem == min(msleep$prop_rem, na.rm=T) & !is.na(msleep$prop_rem)]
    
## 10. Create a new variable for the ratio of body weight to brain weight (`bdy_brn_ratio`). 
msleep$bdy_brn_ratio <- msleep$bodywt / msleep$brainwt 

    ## a. What is the median body-to-brain weight ratio? 
    median(msleep$bdy_brn_ratio, na.rm=T)
    
    ## b. What is the variance of the body-to-brain weight ratio? 
    var(msleep$bdy_brn_ratio, na.rm=T)
    
## 11. Drop the `conservation`, `sleep_cycle`, and `bodywt` variables from the `msleep` object. 
msleep[, c("conservation", "sleep_cycle", "bodywt")] <- NULL

## 12. Create a new object (`msleep_carni`) that contains just the data for carnivores and only the `name`, `genus`, `order`, `sleep_total`, and `brainwt` variables. 
msleep_carni <- msleep[msleep$vore == "carni", c("name", "genus", "order", "sleep_total", "brainwt")]

