library(foreign) 

## Slide 4 ---------------------------------------------
load("C:/Users/ngraetz/Documents/repos/r_training_penn/data/us_state_cigarette_data.rdata", verbose=T)
class(cig_tax)
class(cig_csmp)
class(pop)
class(locs)

## Slide 5 ---------------------------------------------
zmb <- readRDS("C:/Users/ngraetz/Documents/repos/r_training_penn/data/zmb_mcpa.rds")
str(zmb) 

## Slide 6 ---------------------------------------------
mmr <- read.csv("C:/Users/ngraetz/Documents/repos/r_training_penn/data/mmr_data.csv")
str(mmr) 

## Slide 7 ---------------------------------------------
mmr <- read.csv("C:/Users/ngraetz/Documents/repos/r_training_penn/data/mmr_data.csv", stringsAsFactors=F)
str(mmr) 

## Slide 11 ---------------------------------------------
rm(list=ls()) # remove all data in the work space 
main_dir <- "C:/Users/ngraetz/Documents/repos/r_training_penn/" # CHANGE TO YOUR LOCAL COPY OF THE TRAINING MATERIALS!!

## Slide 12 ---------------------------------------------
data <- read.csv(paste0(main_dir, "data/CPI_2015_EU.csv"), 
                 stringsAsFactors=F)
names(data)

## Slide 13 ---------------------------------------------
names(data) <- c('Rank', 'CPI2015', 'Country', 'Region', 'wbcode', 
                 'CPIA', 'EOS', 'TI', 'ADB', 'IMD', 'SGI', 'ROL', 'PRS', 
                 'EIU', 'IHS', 'PERC', 'NIT', 'CPI_2', 'Rank_2', 'N')
names(data)

## Slide 14 ---------------------------------------------
names(data)[5] <- "WB_code"
names(data)
names(data)[names(data) == "CPI_2"] <- "CPI2015_2"
names(data)

## Slide 15 ---------------------------------------------
library(plyr)
data <- rename(data, c("Country" = "country", "Region" = "region"))
names(data)

## Slide 16 ---------------------------------------------
library(dplyr) 
data <- rename(data, rank1 = Rank, rank2 = Rank_2)
names(data)

## Slide 18 ---------------------------------------------
## plyr::rename(data, c("Country" = "country", "Region" = "region"))
## dplyr::rename(data, rank1 = Rank, rank2 = Rank_2)

## Slide 19 ---------------------------------------------
data$country
order(data$country)

## Slide 20 ---------------------------------------------
data <- data[order(data$country),]
head(data)

## Slide 21 ---------------------------------------------
data <- data[order(data$region, data$CPI2015),]
head(data)

## Slide 22 ---------------------------------------------
cpi_ame <- read.csv(paste0(main_dir, "data/CPI_2015_AME.csv"))
nrow(cpi_ame) 
cpi_eu <- read.csv(paste0(main_dir, "data/CPI_2015_EU.csv"))
nrow(cpi_eu) 
all <- rbind(cpi_ame, cpi_eu) 
nrow(all) 

## Slide 23 ---------------------------------------------
names(cpi_eu)[1] <- "rank" # rename for demonstration purposes... 
all <- rbind(cpi_ame, cpi_eu) 
names(cpi_ame)[1] <- "rank" # rename to match cpi_eu 
all <- rbind(cpi_ame, cpi_eu) 

## Slide 24 ---------------------------------------------
cpi_eu$CPI2015 <- NULL # drop for demonstration purposes... 
all <- rbind(cpi_ame, cpi_eu) 
cpi_eu$CPI2015 <- NA
all <- rbind(cpi_ame, cpi_eu)
cpi_eu$CPI2015 <- NULL # drop for demonstration purposes... 
all <- rbind.fill(cpi_ame, cpi_eu) 

## Slide 26 ---------------------------------------------
load(paste0(main_dir, "data/us_state_cigarette_data.rdata"), verbose=T)

## Slide 27 ---------------------------------------------
summary(cig_tax)
summary(cig_csmp) 

## Slide 28 ---------------------------------------------
summary(pop)
summary(locs)

## Slide 29 ---------------------------------------------
all <- merge(cig_tax, cig_csmp, by=c("fips", "year"))
summary(all) 

## Slide 30 ---------------------------------------------
dim(cig_tax)
dim(cig_csmp)
dim(all) 
all <- merge(cig_csmp, pop, by=c("fips", "year"))
dim(cig_csmp)
dim(pop)
dim(all)

## Slide 31 ---------------------------------------------
all <- merge(cig_csmp, pop, by=c("fips", "year"), all=T)
dim(all)
summary(all) 

## Slide 32 ---------------------------------------------
all <- merge(cig_csmp, pop, by=c("fips", "year"), all.x=T)
dim(all)
summary(all) 

## Slide 33 ---------------------------------------------
all <- merge(cig_csmp, pop, by=c("fips", "year"), all.y=T)
dim(all)
summary(all) 

## Slide 35 ---------------------------------------------
all <- merge(locs, cig_csmp, by="fips")
dim(cig_csmp)
dim(locs)
dim(all) 
head(all) 

## Slide 36 ---------------------------------------------
all <- merge(cig_tax, cig_csmp, by="fips")
dim(all)
head(all)

## Slide 37 ---------------------------------------------
save(all, file=paste0(main_dir, "output/combined_cig_data.rdata"))
saveRDS(all, file=paste0(main_dir, "output/combined_cig_data.rds")) 
write.csv(all, file=paste0(main_dir, "output/combined_cig_data.csv"))
write.dta(all, file=paste0(main_dir, "output/combined_cig_data.dta"))

## Slide 39 ---------------------------------------------
ls()
rm(locs, cig_csmp) 
ls()

## Slide 40 ---------------------------------------------
rm(list=ls())

