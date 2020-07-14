library(ggplot2)
main_dir <- "C:/Users/ngraetz/Documents/repos/r_training_penn/" # CHANGE TO YOUR LOCAL COPY OF THE TRAINING MATERIALS!!

## Slide 3 ---------------------------------------------
log(x = 300, base = 10)

## Slide 4 ---------------------------------------------
read.csv
## View(read.csv)

## Slide 5 ---------------------------------------------
plus_one <- function(x) {
  y <- x + 1
  return(y)
}
plus_one(10)
class(plus_one)

## Slide 7 ---------------------------------------------
## function_name <- function(arg_1, arg_2, ...) {
##   expression
##   return(value)
## }
plus_one <- function(x) {
  y <- x + 1
  return(y)
}
plus_one(10)

## Slide 8 ---------------------------------------------
plus_one <- function(x) {
  y <- x + 1
}
plus_one(10)
print(plus_one(10))
plus_one <- function(x) {
  x + 1
}
plus_one(10)

## Slide 9 ---------------------------------------------
plus_one <- function(x) x + 1
plus_one(10)

## Slide 10 ---------------------------------------------
x_plus_y <- function(x, y) {
  x + y
}
x_plus_y()
x_plus_y <- function(x = 5, y = 10) {
  x + y
}
x_plus_y()
x_plus_y(x = 10)
x_plus_y(x = 10, y = 20)

## Slide 11 ---------------------------------------------
x_plus_y_minus_z <- function(x, y) {
  x + y - z
}
x <- 10
y <- 10
z <- 10 
x_plus_y_minus_z(1, 1)

## Slide 12 ---------------------------------------------
x_plus_y_minus_z <- function(x, y) {
  val1 <- x + y
  val2 <- val1 - z
  return(val2)
}
x_plus_y_minus_z(1, 1)
val1

## Slide 14 ---------------------------------------------
num <- 1:10
df <- data.frame(lower = letters, upper = LETTERS)
mat <- matrix(rnorm(9), nrow = 3)
my_list <- list(num, df, mat)
str(my_list)

## Slide 15 ---------------------------------------------
my_list[[1]]
my_list <- list(numeric = num, data.frame = df, matrix = mat)
my_list$matrix

## Slide 16 ---------------------------------------------
random_fun <- function(n) {
  one_dim <- rnorm(n)
  two_dim <- matrix(rnorm(n*n), nrow = n)
  all <- list(one_dim = one_dim, two_dim = two_dim)
  return(all)
}
random_fun(2)

## Slide 17 ---------------------------------------------
mod <- lm(price ~ carat, data = diamonds)
class(mod)
str(mod)

## Slide 19 ---------------------------------------------
VADeaths
colsums <- rep(NA, nrow(VADeaths))
for (r in 1:nrow(VADeaths)) {
  colsums[r] <- sum(VADeaths[r, ])
} 
colsums
colsums <- apply(VADeaths, 1, sum)
colsums

## Slide 20 ---------------------------------------------
lapply(1:3, log)

## Slide 21 ---------------------------------------------
data_list <- list(diamonds, economics, presidential)
lapply(data_list, names)

## Slide 22 ---------------------------------------------
cv <- function(x) sd(x) / mean(x)
apply(VADeaths, 2, cv)
summarize_dims <- function(df)  {
  data.frame(nrow = nrow(df), 
             ncol = ncol(df), 
             NAs = sum(is.na(df)))
}
lapply(data_list, summarize_dims)

## Slide 23 ---------------------------------------------
apply(VADeaths, 2, function(x) sd(x) / mean(x))
lapply(data_list, function(df) {
  data.frame(nrow = nrow(df), 
             ncol = ncol(df), 
             NAs = sum(is.na(df)))
})

## Slide 25 ---------------------------------------------
data_list <- lapply(data_list, function(df) {
  data.frame(nrow = nrow(df), ncol = ncol(df), NAs = sum(is.na(df)))
})
data_list

## Slide 26 ---------------------------------------------
data_list <- do.call(rbind, data_list)
data_list

