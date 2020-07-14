## Slide 4 ---------------------------------------------
library(ggplot2)
library(reshape2)
library(RColorBrewer)
rm(list=ls())
main_dir <- "C:/Users/ngraetz/Documents/repos/r_training_penn/" # CHANGE TO YOUR LOCAL COPY OF THE TRAINING MATERIALS!!
mmr_data <- read.csv(paste0(main_dir, "data/mmr_data.csv"))
head(mmr_data)

## Slide 5 ---------------------------------------------
ggplot(data = mmr_data, aes(x = maternal_education,  y = ldi))
ggplot(data = mmr_data, aes(x = maternal_education,  y = ldi)) +
  geom_point()

## Slide 7 ---------------------------------------------
ggplot(data = mmr_data, aes(x = maternal_education,  y = ldi)) +
  geom_point()

## Slide 8 ---------------------------------------------
ggplot(data = mmr_data, aes(x = maternal_education,  y = ldi,
    color = super_region_name)) +
  geom_point()

## Slide 9 ---------------------------------------------
ggplot(data = mmr_data, aes(x = maternal_education,  y = ldi,
    color = mmr)) +
  geom_point()

## Slide 10 ---------------------------------------------
ggplot(data = mmr_data, aes(x = maternal_education,  y = log(ldi),
    color = mmr)) +
  geom_point()

## Slide 11 ---------------------------------------------
ggplot(data = mmr_data, aes(x = maternal_education,  y = ldi,
    color = mmr, shape=super_region_name)) +
  geom_point()

## Slide 13 ---------------------------------------------
ggplot(data = mmr_data, aes(x = maternal_education,  y = ldi)) +
  geom_point()

## Slide 14 ---------------------------------------------
ggplot(data = mmr_data, aes(x = maternal_education,  y = ldi)) +
  geom_point() +
  geom_line()

## Slide 15 ---------------------------------------------
ggplot(data = mmr_data, aes(x = maternal_education,  y = ldi)) +
  geom_point() +
  geom_smooth()

## Slide 17 ---------------------------------------------
ggplot(data = mmr_data, aes(x = maternal_education,  y = ldi)) +
  geom_point() +
  facet_wrap(~super_region_name)

## Slide 20 ---------------------------------------------
ggplot(data = mmr_data, aes(x = maternal_education,  y = ldi)) +
  geom_point(position='jitter')

## Slide 21 ---------------------------------------------
mmr_data$category <- cut(mmr_data$maternal_education, breaks=c(0,3,6,9,12,Inf))
ggplot(data = mmr_data, aes(x = category, fill=super_region_name)) +
  geom_bar()

## Slide 22 ---------------------------------------------
ggplot(data = mmr_data, aes(x = category, fill=super_region_name)) +
  geom_bar(position='dodge')

## Slide 23 ---------------------------------------------
ggplot(data = mmr_data, aes(x = category, fill=super_region_name)) +
  geom_bar(position='fill')

## Slide 25 ---------------------------------------------
fig1 <- ggplot() + 
  geom_point(data = mmr_data,
               aes(x = maternal_education,
                   y = ldi),
               color='red',
               size=2,
               alpha=.5)

## Slide 26 ---------------------------------------------
ggplot(data = mmr_data, aes(x = maternal_education,  y = ldi,
    color = super_region_name)) +
  geom_point() +
  scale_color_manual(values=c('red','yellow','blue','green','purple','#31a354'))

## Slide 27 ---------------------------------------------
ggplot(data = mmr_data, aes(x = maternal_education,  y = ldi,
    color = super_region_name)) +
  geom_point() +
  labs(title='Maternal Education Compared to LDI', y='LDI',
    x='Education', color='GBD Super Region')

## Slide 28 ---------------------------------------------
ggplot(data = mmr_data, aes(x = maternal_education,  y = ldi,
    color = super_region_name)) +
  geom_point() +
  theme_bw()

## Slide 29 ---------------------------------------------
ggplot(data = mmr_data, aes(x = maternal_education,  y = ldi,
    color = super_region_name)) +
  geom_point() +
  theme_bw(base_size=18)

## Slide 30 ---------------------------------------------
long_data <- read.csv(paste0(main_dir, "data/ebola_fatalities_sex_country.csv"))
wide_data <- dcast(long_data, Country + Age ~ Gender, value.var="Deaths")
head(wide_data)

## Slide 31 ---------------------------------------------
ggplot(wide_data, aes(x = Age, y = Male)) +
  facet_wrap(~ Country) +
  geom_line(color='blue') +
  geom_line(data = wide_data, aes(y = Female))

## Slide 32 ---------------------------------------------
long_data <- melt(wide_data, id.vars=c("Country", "Age"),
             value.name = "Deaths", variable.name = "Gender")
head(long_data, 3)
ggplot(long_data, aes(x = Age, y = Deaths, color = Gender)) +
  facet_wrap(~ Country) +
  geom_line()

## Slide 33 ---------------------------------------------
p <- ggplot(data = mmr_data, aes(x = maternal_education,  y = ldi)) +
  geom_point()
pdf(file = paste0(main_dir, "output/my_plot.pdf"), height=5, width=9)
p
dev.off()

## Slide 34 ---------------------------------------------
p1 <- ggplot(data = mmr_data, aes(x = maternal_education,  y = ldi)) +
  geom_point()
p2 <- ggplot(data = mmr_data, aes(x = maternal_education,  y = mmr)) +
  geom_point()
pdf(file = paste0(main_dir, "output/my_plot.pdf"), height=5, width=9)
p1
p2
dev.off()

## Slide 38 ---------------------------------------------
library(gridExtra)
p1 <- ggplot(data = mmr_data, aes(x = maternal_education,  y = ldi)) +
  geom_point()
p2 <- ggplot(data = mmr_data, aes(x = maternal_education,  y = mmr)) +
  geom_point()
grid.arrange(p1, p2, ncol=2)

## Slide 40 ---------------------------------------------
ggplot(data = mmr_data, aes(x = maternal_education,  y = ldi,
    label = super_region_name)) +
  geom_point() +
  geom_text()

## Slide 41 ---------------------------------------------
library(ggrepel)
ggplot(data = mmr_data, aes(x = maternal_education,  y = ldi,
    label = super_region_name)) +
  geom_point() +
  geom_text_repel()

## Slide 42 ---------------------------------------------
library(RColorBrewer)
ggplot(data = mmr_data, aes(x = maternal_education,  y = ldi,
    color = super_region_name)) +
  geom_point() +
  scale_color_manual(values=brewer.pal(6, 'Paired'))

## Slide 43 ---------------------------------------------
ggplot(data = mmr_data, aes(x = maternal_education,  y = ldi,
    color = mmr)) +
  geom_point() +
  scale_color_gradientn(colors=rev(brewer.pal(6, 'Spectral')))

