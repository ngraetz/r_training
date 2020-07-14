## Slide 11 ---------------------------------------------
library(ggplot2)
main_dir <- "C:/Users/ngraetz/Documents/repos/r_training_penn/" # CHANGE TO YOUR LOCAL COPY OF THE TRAINING MATERIALS!!
data <- read.csv(paste0(main_dir, "data/mmr_data_time_series.csv"))
data <- data[, c("location_name", "super_region_name", "region_name",
                 "year_id", "mmr", "maternal_education", "ldi")]
head(data)

## Slide 12 ---------------------------------------------
mod <- lm(mmr ~ ldi + maternal_education, data=data)
summary(mod)

## Slide 13 ---------------------------------------------
summary(mod)$coefficients

## Slide 14 ---------------------------------------------
data$post_2000 <- ifelse(data$year_id>2000, 1, 0)
head(data[,c(1:5,8)])
mod <- lm(mmr ~ post_2000, data=data)
summary(mod)$coefficients

## Slide 15 ---------------------------------------------
ggplot(data, aes(y=mmr, x=post_2000)) +
  geom_vline(xintercept=0) +
  geom_hline(yintercept=0) +
  geom_point() +
  geom_smooth(method='lm', se=FALSE) +
  theme_minimal(base_size=18)

## Slide 16 ---------------------------------------------
unique(data$super_region_name)
mod <- lm(mmr ~ factor(super_region_name), data=data)
summary(mod)$coefficients[,c(1,4)]

## Slide 17 ---------------------------------------------
mod <- lm(mmr ~ factor(super_region_name) + year_id, data=data)
summary(mod)$coefficients[,c(1,4)]
data$preds <- predict(mod)
ggplot(data, aes(y=mmr, x=year_id, color=super_region_name)) +
  geom_point(size=2.5) +
  geom_line(aes(y=preds)) +
  theme_minimal(base_size=18)

## Slide 18 ---------------------------------------------
mod <- lm(mmr ~ factor(super_region_name) * year_id, data=data)
summary(mod)$coefficients[,c(1,4)]

## Slide 19 ---------------------------------------------
data$preds <- predict(mod)
ggplot(data, aes(y=mmr, x=year_id, color=super_region_name)) +
  geom_point(size=2.5) +
  geom_line(aes(y=preds)) +
  theme_minimal(base_size=18)

## Slide 20 ---------------------------------------------
mod <- lm(mmr ~ maternal_education * ldi, data=data)
summary(mod)$coefficients
data$ldi_cat <- cut(data$ldi, breaks=c(-Inf, quantile(data$ldi, c(.25,.75)), Inf),
   labels=c('Low LDI', 'Medium LDI', 'High LDI'))
ggplot(data=data, aes(y=mmr, x=maternal_education, color=ldi_cat)) +
  geom_point(data=data[data$ldi_cat=='Low LDI', ], size=2.5, color='red') +
  geom_smooth(data=data[data$ldi_cat=='Low LDI', ], method='lm', color='red', se=F) +
  geom_point(data=data[data$ldi_cat=='Medium LDI', ], size=2.5, color='blue') +
  geom_smooth(data=data[data$ldi_cat=='Medium LDI', ], method='lm', color='blue', se=F) +
  geom_point(data=data[data$ldi_cat=='High LDI', ], size=2.5, color='green') +
  geom_smooth(data=data[data$ldi_cat=='High LDI', ], method='lm', color='green', se=F) +
  geom_point() +
  scale_color_manual(values=c('red','blue','green')) +
  theme_minimal(base_size=18)

## Slide 21 ---------------------------------------------
ggplot(data=data, aes(y=mmr, x=maternal_education)) +
  geom_point() +
  geom_smooth(method='lm', se=F) +
  theme_minimal(base_size=18)

## Slide 22 ---------------------------------------------
mod <- lm(log(mmr) ~ maternal_education, data=data)
predData <- data.frame(maternal_education=seq(max(data$maternal_education)))
predData$preds <- exp(predict(mod, newdata=predData))
ggplot(data=data, aes(y=mmr, x=maternal_education)) +
  geom_point() +
  geom_line(data=predData, aes(y=preds)) +
  theme_minimal(base_size=18)

## Slide 23 ---------------------------------------------
mod <- lm(mmr ~ maternal_education, data=data)
betas <- coef(mod)
betas
betas[1] + betas[2]*5
ggplot(data=data, aes(y=mmr, x=maternal_education)) +
  geom_point() +
  geom_smooth(method='lm', se=F) +
  theme_minimal(base_size=18)

## Slide 24 ---------------------------------------------
data$predictions <- predict(mod)
head(data[, c(1,2,3,5,6,8)], 3)
mod <- lm(mmr ~ year_id, data=data)
more_data <- data.frame(year_id=seq(1990,2020))
more_data$predictions <- predict(mod, newdata=more_data)
head(more_data, 3)

## Slide 25 ---------------------------------------------
preds <- predict(mod, interval="confidence")
head(preds, 3)
data <- cbind(data, preds)
head(data[, c(1,5,12,13,14)])

