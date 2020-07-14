## Slide 4 ---------------------------------------------
my_office <- 424
my_office
my_office = 424
my_office

## Slide 6 ---------------------------------------------
iso3 <- c("CAN", "USA", "MEX")
iso3
pop <- c(35.16, 318.9, 122.3)
pop
admin1 <- c(13L, 51L, 31L)
admin1
spanish <- c(FALSE, FALSE, TRUE)
spanish

## Slide 7 ---------------------------------------------
seq(from = 0, to = 27, by = 3)
1990:2000
rep(c(1, 2, 3), each = 2)
rep(c("red", "blue", "green"), times=2)

## Slide 8 ---------------------------------------------
class(iso3)
class(pop)
class(admin1)
class(spanish)

## Slide 9 ---------------------------------------------
is.character(iso3)
is.numeric(pop)
is.integer(admin1)
is.logical(spanish) 
is.numeric(iso3)
is.integer(pop)
is.numeric(admin1)

## Slide 10 ---------------------------------------------
as.character(pop)
as.numeric(admin1)
as.integer(spanish)

## Slide 11 ---------------------------------------------
rain <- c(F, F, F, F, NA, NA, NA)
is.na(rain)
as.numeric(iso3)

## Slide 12 ---------------------------------------------
iso3 == "USA" 
pop > 300
admin1 < 20
spanish != TRUE
pop < admin1 

## Slide 13 ---------------------------------------------
iso3 == "USA" | iso3 == "CAN"
admin1 > 20 & admin1 < 50
pop < 100 | pop > 300
pop < 200
!(pop < 200)
!spanish

## Slide 14 ---------------------------------------------
vec1 <- 1:6
vec2 <- c(1, 10)
vec1 > vec2
vec3 <- c(1, 10, 100, 1000)
vec1 > vec3

## Slide 15 ---------------------------------------------
pop / admin1 
log(pop)
sqrt(admin1)

## Slide 16 ---------------------------------------------
hi_temp <- c(77, 73, 75, 80, 79, 72, 72, 73, 72, 76, 80, 87, 90, 83, 84, 81, 80, 86, 95, 91, 73, 72, 79, 82, 94, 88, 72, 75, 81, 70, 71)
mean(hi_temp)
sd(hi_temp)
quantile(hi_temp, c(0, 0.5, 1.0))

## Slide 17 ---------------------------------------------
hi_temp[1]
hi_temp[c(1, 3, 10)]
hi_temp[1:5]
hi_temp[seq(1, 31, 7)]
hi_temp[c(1, 1, 1)]

## Slide 18 ---------------------------------------------
iso3[c(FALSE, FALSE, TRUE)]
iso3[spanish == TRUE]
iso3[spanish]
pop > 300
pop[pop > 300]
iso3[pop > 300]

## Slide 19 ---------------------------------------------
rain[is.na(rain)]
rain[!is.na(rain)]
iso3[pop > 100 & admin1 < 50]

## Slide 20 ---------------------------------------------
sex <- c(1, 1, 2)
sex
factor_sex <- factor(sex, levels=c(1, 2), labels=c("Male", "Female"))
factor_sex

## Slide 21 ---------------------------------------------
sex <- c("Male", "Male", "Female")
sex
factor_sex <- factor(sex, levels=c("Male", "Female"))
factor_sex

## Slide 22 ---------------------------------------------
mat <- matrix(1:6, nrow=2, ncol=3, byrow=T)
mat

## Slide 23 ---------------------------------------------
is.matrix(mat)
nrow(mat)
ncol(mat)
dim(mat)

## Slide 24 ---------------------------------------------
ary <- array(1:24, dim=c(3, 4, 2))
ary

## Slide 25 ---------------------------------------------
as.character(pop)
class(pop)
pop

## Slide 26 ---------------------------------------------
pop <- as.character(pop)
class(pop)
pop

