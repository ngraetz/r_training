## 1. Create the following vectors: 
    ## a. The names of everyone sitting at your table (`friends`). 
    friends <- c("Laura", "Jon", "Nafis", "Kirsten")
    friends
    
    ## b. Every calendar year since 1995 (`years`). 
    years <- 1995:2017
    years
    
    ## c. A sequence from 0 to 1 by 0.1 (`tenths`). 
    tenths <- seq(0, 1, 0.1)
    tenths
    
    ## d. For each day this week, whether or not you have/will attend a boot camp class (`classes`). 
    classes <- c(F, F, T, T, T, F, F)
    classes
    
## 2. Consider the vectors from question 1. 
    ## a. What class is each vector? 
    class(friends)
    class(years)
    class(tenths)
    class(classes)
    # friends = character; years = integer; tenths = numeric; classes = logical. 
    
    ## b. What happens to each vector when it is coerced to an integer? 
    as.integer(friends)
    as.integer(years)
    as.integer(tenths)
    as.integer(classes)
    # Coercing friends to an integer creates NAs. 
    # Years is already an integer, so nothing changes.
    # Coercing tenths causes all of the numbers to be rounded down to an integer. 
    # Coercing classes causes FALSEs to become 0s and TRUEs to become 1s. 
    
    ## c. What happens to each vector when it is coerced to a numeric?
    as.numeric(friends)
    as.numeric(years)
    as.numeric(tenths)
    as.numeric(classes)
    # Coercing friends to a numeric creates NAs. 
    # Nothing changes about years when coerced to a numeric. 
    # Tenths is already a numeric, so nothing changes.
    # Coercing classes causes FALSEs to become 0s and TRUEs to become 1s. 
    
    ## d. What happens to each vector when it is coerced to a character?
    as.character(friends)
    as.character(years)
    as.character(tenths)
    as.character(classes)
    # Friends is already a character, so nothing changes. 
    # The other three remain the same except that the values are now enclosed in quotes. 
    
    ## e. What happens to each vector when it is coerced to a logical?
    as.logical(friends)
    as.logical(years)
    as.logical(tenths)
    as.logical(classes)
    # Coercing friends to a logical creates NAs. 
    # Coercing years causes all values to become 'TRUE'. 
    # Coercing tenths causes all values greater than 0 to become 'TRUE'. 
    # Classes is already a logical, so nothing changes. 
    
    ## f. [Bonus] In general, what happens when you convert numerics/integers to a logical? (hint: try running different numbers through `as.logical()` until the pattern becomes clear)
    as.logical(0)
    as.logical(0.1)
    as.logical(100)
    as.logical(-0.1)
    as.logical(-100)
    # 0s become FALSE and everything else becomes TRUE. 
    
    ## g. [Bonus] Is it ever possible to convert a character vector to a numeric or logical vector without introducing NAs? 
    # It is possible to convert a character to a numeric if the character vector contains values that can be interpreted as numbers. 
    str_nums <- c("0", "1", "2", "3", "4")
    class(str_nums)
    as.numeric(str_nums)
        
    # It is possible to convert a character to a logical if the character vector contains 'T' and 'F' or 'TRUE' and 'FALSE'. 
    str_log <- c("T", "F", "TRUE", "FALSE")
    class(str_log)
    as.logical(str_log)
    
    # It's also possible to convert a character to a logical if the character vector contains values that can be interpreted as numbers, BUT it must be converted to a numeric first. 
    as.logical(str_nums)
    as.logical(as.numeric(str_nums))
    
## 3. Consider the following vectors which contain data about counties in the Puget sound region:  
# Name 
cnty_name <- c("Jefferson", "Kitsap", "Pierce", "King", "Snohomish", "Skagit", "Whatcom", "San Juan", "Island") 
# Population 
cnty_pop <- c(30183, 255104, 835555, 2089564, 763963, 120718, 208935, 16029, 79291) 
# Area (sq. miles)
cnty_area <- c(1855, 450.6, 1781, 2238.8, 2116.4, 1771.7, 2175, 254.4, 219.1)
# Life expectancy (yrs)
cnty_e0 <- c(81.3, 79.7, 78.7, 81.4, 80.2, 79.8, 81, 83.7, 81.9)

    ## a. Calculate the population density of these counties. 
    cnty_pop / cnty_area
    
    ## b. What is the minimum and maximum life expectancy? 
    # using range: 
    range(cnty_e0)
    
    # using quantile: 
    quantile(cnty_e0, c(0, 1))
    
    # using min and max: 
    min(cnty_e0)
    max(cnty_e0)
    
    ## c. Which county has the lowest life expectancy? The highest? 
    cnty_name[cnty_e0 == min(cnty_e0)]
    cnty_name[cnty_e0 == max(cnty_e0)]
    
    # or, using which.min() and which.max(): 
    cnty_name[which.min(cnty_e0)]
    cnty_name[which.max(cnty_e0)]
    
    ## d. What is the median population size? 
    median(cnty_pop)
    
    ## e. Which counties have populations greater than 100,000? 
    cnty_name[cnty_pop > 100000]
    
    ## f. What is the mean area of counties with populations greater than 100,000? 
    mean(cnty_area[cnty_pop > 100000])
    
## 4. Create a vector called `draws` that is 100 random draws from a Normal(0,1) distribution (hint: see `rnorm()`).
draws <- rnorm(100)

    ## a. Find the mean, variance, and standard deviation of `draws`. 
    mean(draws)
    var(draws)
    sd(draws)
    
    ## b. Create a second vector (`log_draws`) that is the natural log of the `draws` vector. 
    log_draws <- log(draws)
    
    ## c. Show just the non-missing values of `log_draws`. 
    log_draws[!is.na(log_draws)]
    
    ## d. How many values of `log_draws` are missing? (hint: this requires two functions)
    sum(is.na(log_draws))
    length(log_draws[is.na(log_draws)])
    
