library(haven)
library(data.table)
library(ggplot2)
library(naniar)
library(mice)
library(survey)
setwd('C:/Users/ngraetz/Documents/repos/fragile_familes/')
process_raw_data <- TRUE
source("C:/Users/ngraetz/Documents/repos/fragile_familes/ff_functions.R")

## Function to apply codebook and keep only those clean extracted variables.
pull_wave_dta <- function(raw, cb) {
  d <- copy(raw)
  ## Recode any variables that need recoding.
  for(v in cb[, var]) {
    ## Check if we need to recode and sum multiple variables (for scales like parenting stress and material hardship).
    if(!is.na(cb[var==v, sum_values])) all_vars <- paste0(v, letters[1:cb[var==v, sum_letters]])
    if(is.na(cb[var==v, sum_values])) all_vars <- v
    message(paste0('Recoding ', v, '...'))
    for(sv in all_vars) {
      for(val in 1:5) {
        this_val <- cb[var==v, get(paste0('value_',val))]
        ## Split up these values if provided as strings (":") or numeric range ("_").
        if(grepl(':',this_val)) {
          this_val <- unlist(strsplit(this_val, ':'))
        } else if(grepl('_',this_val)) {
          this_val <- as.numeric(unlist(strsplit(this_val, '_')))
          this_val <- as.character(this_val[1]:this_val[2])
        }
        ## Grab recode value.
        this_recode <- cb[var==v, get(paste0('recode_',val))]
        ## Do the recode.
        if(this_val[1] != '') {
          d[get(sv) %in% this_val, (sv) := this_recode] 
        }
      }
      ## After recoding, make numeric if numeric specified.
      if(!is.na(cb[var==v, numeric])) d[, (sv) := as.numeric(as.character(get(sv)))]
    }
    ## Sum over multiple columns if needed (scales variables).
    if(!is.na(cb[var==v, sum_values])) d[, (v) := rowSums(.SD, na.rm = TRUE), .SDcols = all_vars] 
    ## Rename variable
    setnames(d, v, cb[var==v, var_rename])
  }
  ## Return cleaned dataset.
  d <- d[, c('idnum',cb[, var_rename]), with=FALSE]
  return(d)
}

## Load new Fall 2018 merged dataset
cb <- fread("./raw_public_data/clean_cb_fall18_release.csv")
cb[, var_rename := paste0(var_rename, '__', wave)]

in_dir='C:/Users/ngraetz/Downloads/FF_allwaves_2019_Stata'
file='FF_allwaves_2019.dta'
raw_d <- read_dta(paste0(in_dir, '/', file))
raw_d <- as.data.table(as_factor(raw_d))
merged <- pull_wave_dta(raw_d, cb)
setnames(merged, 'idnum', 'id')

