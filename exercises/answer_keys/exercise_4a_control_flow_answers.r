library(foreign)
library(ggplot2)
library(reshape2)
library(microbenchmark)

## 1. There is a series of files containing different years of data on income and poverty in Washington state ("data/wa_income_[year]"). Load and combine all of the data in these files into a single data frame. Hint: this requires just one loop combined with some `if`/`else` statements. 
main_dir <- "C:/Users/ngraetz/Documents/repos/r_training_penn/" # CHANGE TO YOUR LOCAL COPY OF THE TRAINING MATERIALS!!

data <- NULL
for (year in 1997:2015) {
  if (year < 2004) {
    sub <- read.csv(paste0(main_dir, "/data/wa_income_", year, ".csv"))
  } else {
    sub <- read.dta(paste0(main_dir, "/data/wa_income_", year, ".dta"))
    sub <- plyr::rename(sub, c("FIPS" = "fips", "median_income" = "income_median"))
  }
  data <- rbind(data, sub)
}
summary(data)

## 2. Make a line plot of median household income (y-axis) vs year (x-axis) for each county, saving these as separate pages in a PDF. Hint: the `unique()` function is useful for finding all the unique values of a vector. 
pdf(paste0(main_dir, "output/wa_median_income_trends.pdf"), width=10, height=8)
for (cnty in unique(data$fips)) {
  gg <- ggplot(data[data$fips == cnty,], aes(x=year, y=income_median)) + 
    geom_line() + labs(title = paste("County:", cnty))
  print(gg)
}
dev.off()

## 3. Using a loop, calculate the mean poverty rate in each year. Do the same using `dcast()` and compare your results. 
mean_poverty1 <- data.frame(year = 1997:2015, poverty = NA)
for (yy in 1997:2015) {
  mean_poverty1[mean_poverty1$year == yy, "poverty"] <- 
    mean(data[data$year == yy, "income_median"]) 
} 
  
mean_poverty2 <- dcast(data, year ~ ., value.var = "income_median", 
                      fun.aggregate = mean)
names(mean_poverty2)[2] <- "poverty"

all.equal(mean_poverty1, mean_poverty2)

## Bonus: 
## 4. Using the `microbenchmark()` function in the `microbenchmark` library, determine which of the two approaches in question 3 is faster, and by how much. Which approach do you prefer? Is the difference in timing enough to sway your opinion? Hint: https://www.r-bloggers.com/5-ways-to-measure-running-time-of-r-code/ has some helpful examples of using `microbenchmark()`. 
microbenchmark("loop" = {
                 mean_poverty1 <- data.frame(year = 1997:2015, poverty = NA)
                 for (yy in 1997:2015) {
                   mean_poverty1[mean_poverty1$year == yy, "poverty"] <- 
                     mean(data[data$year == yy, "income_median"]) 
                 }       
               }, 
               "dcast" = {
                 mean_poverty2 <- dcast(data, year ~ ., value.var = "income_median", 
                                        fun.aggregate = mean)
                 names(mean_poverty2)[2] <- "poverty"  
               })

