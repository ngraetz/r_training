library(reshape2) 
main_dir <- "C:/Users/ngraetz/Documents/repos/r_training_penn/" # CHANGE TO YOUR LOCAL COPY OF THE TRAINING MATERIALS!!
load(paste0(main_dir, "data/wa_data.rdata"))
long <- melt(data, id.vars=c("cnty", "year", "sex"))

## Slide 5 ---------------------------------------------
head(long, 2)
dcast(long, cnty + sex ~ variable, value.var="value")

## Slide 6 ---------------------------------------------
dcast(long, cnty + sex ~ variable, value.var="value", fun.aggregate=sum)
dcast(long, cnty + sex ~ variable, value.var="value", fun.aggregate=mean)
dcast(long, cnty + sex ~ variable, value.var="value", fun.aggregate=quantile, p=0.25)

## Slide 7 ---------------------------------------------
dcast(long, cnty ~ variable, value.var="value", fun.aggregate=sum)
dcast(long, variable ~ cnty, value.var="value", fun.aggregate=sum)
dcast(long, . ~ variable, value.var="value", fun.aggregate=sum)
dcast(long, variable ~ ., value.var="value", fun.aggregate=sum)

