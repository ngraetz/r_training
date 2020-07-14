library(reshape2) 
main_dir <- "C:/Users/ngraetz/Documents/repos/r_training_penn/" # CHANGE TO YOUR LOCAL COPY OF THE TRAINING MATERIALS!!

## Slide 5 ---------------------------------------------
load(paste0(main_dir, "data/wa_data.rdata"))
dim(data)
data

## Slide 6 ---------------------------------------------
long <- melt(data, id.vars=c("cnty", "year", "sex"))
dim(long)
head(long, 30)

## Slide 7 ---------------------------------------------
wide <- dcast(long, cnty + year + variable ~ sex, value.var="value")
head(wide, 15)

## Slide 8 ---------------------------------------------
wide <- dcast(long, sex + year + variable ~ cnty, value.var="value")
wide

## Slide 9 ---------------------------------------------
wide <- dcast(long, cnty + sex + variable ~ year, value.var="value")
wide

## Slide 10 ---------------------------------------------
wide <- dcast(long, cnty + year + sex ~ variable, value.var="value")
head(wide, 20)

## Slide 11 ---------------------------------------------
wide <- dcast(long, cnty + variable ~ sex + year, value.var="value")
wide

## Slide 12 ---------------------------------------------
wide <- dcast(long, variable ~ cnty + sex + year, value.var="value")
wide

## Slide 13 ---------------------------------------------
long <- melt(data, id.vars=c("cnty", "year", "sex"))
wide <- dcast(long, year + sex ~ variable + cnty, value.var="value")
head(data, 3)
head(long, 3)
head(wide, 3)

