library(reshape2)

## 1. Load the Nigeria health metrics data set ('data/nigeria_healthmap.csv'). 
main_dir <- "C:/Users/ngraetz/Documents/repos/r_training_penn/" # CHANGE TO YOUR LOCAL COPY OF THE TRAINING MATERIALS!!
    data <- read.csv(paste0(main_dir, 'data/nigeria_healthmap.csv'), stringsAsFactors=F)
    
    ## a. Drop the `location_id`, `geography`, `indicator_type`, and `units` columns and keep only rows with data for 2000 and 2010. 
    data[, c("location_id", "geography", "indicator_type", "units")] <- NULL
    data <- data[data$year == 2000 | data$year == 2010,]
    
    ## b. Reshape this data long such that the data in the `estimate`, `ci_lb`, and `ci_ub` columns is combined into one column, e.g.: 
    data <- melt(data, id.vars=c("location_name", "year", "indicator"))
    head(data)
    
    ## c. Reshape this data wide so that there are separate columns for the estimate, lower bound, and upper bound in each year, e.g.: 
    data <- dcast(data, location_name + indicator ~ variable + year, value.var="value")
    head(data)
    
    ## d. Create a new column called `increase` which is `TRUE` if the estimate for 2010 is higher than for 2000 and `FALSE` otherwise. 
    data$increase <- data$estimate_2010 > data$estimate_2000

    ## e. Remove all objects in your work space. 
## rm(list=ls())

## Bonus:
## 2. Still using the original data set, nigera_healthmap.csv: 
    ## a. Find and read the help docs for `reshape` from the stats library.
    ?reshape
    
    ## b. Use `reshape()` rather than `dcast()` to create the output from 1c above, starting with the original nigeria health metrics data. 
    data <- read.csv(paste0(main_dir, 'data/nigeria_healthmap.csv'), stringsAsFactors=F)
    data[, c("location_id", "geography", "indicator_type", "units")] <- NULL
    data <- data[data$year == 2000 | data$year == 2010,]
    data <- reshape(data, direction = 'wide', idvar = c('location_name', 'indicator'), 
                    v.names = c('estimate', 'ci_lb', 'ci_ub'), timevar = 'year', sep = '_')
head(data)

