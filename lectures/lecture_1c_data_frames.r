## Slide 4 ---------------------------------------------
iso3 <- c("CAN", "USA", "MEX")
pop <- c(35.16, 318.9, 122.3)
admin1 <- c(13L, 51L, 31L)
spanish <- c(FALSE, FALSE, TRUE)
df <- data.frame(iso3, pop, admin1, spanish)
df
rm(iso3, pop, admin1, spanish) # clean up the work space 

## Slide 5 ---------------------------------------------
is.data.frame(df)
str(df)

## Slide 6 ---------------------------------------------
df

## Slide 7 ---------------------------------------------
data(airquality) # load the airquality data
airquality

## Slide 8 ---------------------------------------------
head(airquality)
tail(airquality, 3)

## Slide 9 ---------------------------------------------
## View(airquality)

## Slide 10 ---------------------------------------------
summary(airquality) 

## Slide 11 ---------------------------------------------
nrow(airquality)
ncol(airquality) 
dim(airquality)
names(airquality)

## Slide 12 ---------------------------------------------
df[, 2]
df[, "pop"]
df$pop

## Slide 13 ---------------------------------------------
mean(df$pop)
log(df$pop)
df$pop / df$admin1 
df$iso3 == "USA" 
df$iso3[df$pop > 200]

## Slide 14 ---------------------------------------------
df$gdp <- c(1827, 16770, 1261)
df$log_gdp <- log(df$gdp)
df$gdp_pc <- (1e9 * df$gdp) / (1e6 * df$pop)
df

## Slide 15 ---------------------------------------------
df$gdp <- df$gdp * 1e9 
df[, "pop"] <- df[, "pop"] * 1e6 
df

## Slide 16 ---------------------------------------------
df$log_gdp <- NULL
df[, "gdp_pc"] <- NULL 
head(df)

## Slide 17 ---------------------------------------------
df[, c("admin1", "spanish")] <- NULL
head(df)

## Slide 18 ---------------------------------------------
airquality <- airquality[, c("Ozone", "Wind", "Month", "Day")]
head(airquality) 

## Slide 19 ---------------------------------------------
df[1,]
df[2:3,]
df[c(1, 3),]

## Slide 20 ---------------------------------------------
df[c(T, F, F),]
df[df$iso3 != "CAN",]
df[df$gdp < 1e13,]

## Slide 21 ---------------------------------------------
df <- df[df$gdp < 1e13,]
df
airquality_nomiss <- airquality[!is.na(airquality$Ozone),]
nrow(airquality)
nrow(airquality_nomiss)

## Slide 22 ---------------------------------------------
df[df$pop > 1e8,]
df[, "iso3"]

## Slide 23 ---------------------------------------------
df[df$pop > 1e8, "iso3"]
df$iso3[df$pop > 1e8]

## Slide 24 ---------------------------------------------
big_pop <- df$iso3[df$pop > 1e8]
airquality_may <- airquality[airquality$Month == 5,]
class(big_pop)
class(airquality_may)

## Slide 25 ---------------------------------------------
nrow(airquality) 
range(airquality$Month)
airquality <- airquality[airquality$Month == 5,]
nrow(airquality) 
range(airquality$Month)

