library(reshape2)

## 1. Load in the Ebola deaths data for West Africa ('data/ebola_fatalities_sex_country.csv'). 
main_dir <- "C:/Users/ngraetz/Documents/repos/r_training_penn/" # CHANGE TO YOUR LOCAL COPY OF THE TRAINING MATERIALS!!
    data <- read.csv(paste0(main_dir, 'data/ebola_fatalities_sex_country.csv'), stringsAsFactors=F)
    
    ## a. Using the data loaded in (1), create the data frame below reporting the number of deaths by country and gender: 
    dcast(data, Country ~ Gender, value.var="Deaths", fun.aggregate=sum)
    
    ## b. Using the data loaded in (1), create the data frame below reporting the number of deaths by age and country: 
    dcast(data, Age ~ Country, value.var="Deaths", fun.aggregate=sum)
    
    ## c. Using the data loaded in (1), calculate the total number of fatalities by country, i.e.: 
    country_deaths <- dcast(data, Country ~ ., value.var="Deaths", fun.aggregate=sum)
    names(country_deaths)[2] <- "Deaths"
    country_deaths
    
    ## d. Using the data loaded in (1), calculate the total number of fatalities by age, i.e.: 
    age_deaths <- dcast(data, Age ~ ., value.var="Deaths", fun.aggregate=sum)
    names(age_deaths)[2] <- "Deaths"
    age_deaths
    
    ## e. Remove all of the data frames used in this question from your work space. 
rm(data, country_deaths, age_deaths)

## Bonus:
## 2. Still using the original data set ('data/ebola_fatalities_sex_country.csv'):
    ## a. Find and read the help docs for `aggregate` and `apply`.
    ?apply
    ?aggregate
    
    ## b. Recreate the data frame from (1a) reporting the number of deaths by country and gender using `aggregate` instead of `dcast`.
    data <- read.csv(paste0(main_dir, 'data/ebola_fatalities_sex_country.csv'), stringsAsFactors=F)
    aggregate(data$Deaths, list(Country = data$Country, Gender = data$Gender), sum)
    
    ## c. Keep only rows with data for females and find the total number of deaths across all ages and locations using `apply`.
    data <- data[data$Gender == "Female", ]
apply(data[c("Deaths")], 2, sum)

