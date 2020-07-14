library(ggplot2)
main_dir <- "C:/Users/ngraetz/Documents/repos/r_training_penn/" # CHANGE TO YOUR LOCAL COPY OF THE TRAINING MATERIALS!!

## Slide 3 ---------------------------------------------
x <- -5 
if (x < 0) x <- -1 * x 
x
x <- 5 
if (x < 0) x <- -1 * x 
x

## Slide 4 ---------------------------------------------
x <- -5
if (x < 0) y <- -1 * x else y <- 100 * x 
y 
x <- 5
if (x < 0) y <- -1 * x else y <- 100 * x 
y 

## Slide 5 ---------------------------------------------
x <- rnorm(1)
if (x < 0) {
  y <- -1 * x
} else {
  y <- 100 * x 
}
x; y

## Slide 6 ---------------------------------------------
x <- rnorm(1)
if (x < 0) {
  y <- -1 * x
} else if (x < 100) {
  y <- x * 100
} else {
  y <- x * 5
}
x; y 

## Slide 7 ---------------------------------------------
x <- rnorm(1) 
if (x < 0) {
  y <- x * -10 
} else {
  if (x < 10) {
    y <- x * 100  
  } else {
    y <- x * 10
  }
}
x; y 

## Slide 8 ---------------------------------------------
x <- rnorm(4)
x
if (sum(x) > 0) print("the sum of x is greater than 0")
if (x[1] > 0) print("the first value of x is greater than 0") 
if (x > 0) print("x is greater than 0?") 

## Slide 9 ---------------------------------------------
today <- as.character(Sys.time())
today 
if (grepl("2017", today)) print("The year is 2017") 
x <- log(rnorm(4))
x
if (sum(is.na(x)) > 0) print("Vector x contains missing values") 

## Slide 10 ---------------------------------------------
if (sum(is.na(x)) > 0) stop("There is missingness!")
stopifnot(sum(is.na(x)) == 0)

## Slide 11 ---------------------------------------------
if (sum(is.na(x)) > 0) message(paste('x has', sum(is.na(x)), 'missing values'))
if (sum(is.na(x)) > 0) warning(paste('x has', sum(is.na(x)), 'missing values'))

## Slide 12 ---------------------------------------------
for (x in c("red", "orange", "blue", "green", "yellow")) {
  print(paste("I like the color", x))
}

## Slide 14 ---------------------------------------------
all_data <- NULL 
for (year in c(2010, 2012, 2013)) {
  data <- read.csv(paste0(main_dir, "data/wa_data_", year, ".csv"))
  all_data <- rbind(all_data, data)
}
table(all_data$year)

## Slide 15 ---------------------------------------------
mmr <- read.csv(paste0(main_dir, "data/mmr_data_time_series.csv"))
all_locations <- unique(mmr$location_name)
pdf(paste0(main_dir, "output/mmr_time_trends_by_country.pdf"))
for (loc in all_locations) {
  gg <- ggplot(mmr[mmr$location_name == loc,], 
               aes(x=year_id, y=mmr)) + 
    geom_line()
  print(gg)
}
dev.off()

## Slide 16 ---------------------------------------------
head(mmr[, c("mmr", "lower", "upper")], 2)
for (var in c("mmr", "lower", "upper")) {
  mmr[, var] <- mmr[, var] / 100000
}
head(mmr[, c("mmr", "lower", "upper")], 2)

## Slide 17 ---------------------------------------------
pdf(paste0(main_dir, "output/mmr_barchart_by_super_region.pdf"))
for (sr in unique(mmr$super_region_name)) {
  for (yr in unique(mmr$year_id)) {
    gg <- ggplot(mmr[mmr$super_region_name == sr & mmr$year_id == yr, ], 
           aes(x = location_name, y = mmr)) + 
      geom_bar(stat = 'identity') + 
      labs(title = paste0(sr, ", ", yr))
    print(gg)
  }
}
dev.off()

## Slide 18 ---------------------------------------------
pdf(paste0(main_dir, "output/mmr_barchart_by_super_region.pdf"))
for (sr in unique(mmr$super_region_name)) {
  message(sr)
  
  for (yr in unique(mmr$year_id)) {
    message(paste0('..', yr))
    gg <- ggplot(mmr[mmr$super_region_name == sr & mmr$year_id == yr, ], 
           aes(x = location_name, y = mmr)) + 
      geom_bar(stat = 'identity') + 
      labs(title = paste0(sr, ", ", yr))
    print(gg)
  }
}
dev.off()

## Slide 19 ---------------------------------------------
all_data <- NULL 
for (year in 2010:2013) {
  file <- paste0(main_dir, "data/wa_data_", year, ".csv")
  if (!file.exists(file)) next 
  
  data <- read.csv(file)
  all_data <- rbind(all_data, data)
}
table(all_data$year) 

## Slide 20 ---------------------------------------------
all_data <- NULL 
for (year in 2010:2013) {
  file <- paste0(main_dir, "data/wa_data_", year, ".csv")
  if (!file.exists(file)) break 
  
  data <- read.csv(file)
  all_data <- rbind(all_data, data)
}
table(all_data$year) 

## Slide 21 ---------------------------------------------
x <- 0 
while (x < 5) { 
  x <- x + abs(rnorm(1))
  print(x)
}

