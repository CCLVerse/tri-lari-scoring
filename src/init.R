source('./src/load_packages.R')
## Load all required packages
load_packages(c('tidyverse', 'log4r', 'config','lm.beta'))

## source all functions from the lari folder
ws.folder <- "./src/lari/"
ws.files <- list.files(ws.folder)

# Load all files if exist
if(length(ws.files > 0)){
  invisible(sapply(file.path(ws.folder,ws.files), source))
}


## source all functions from the utils folder
ut.folder <- "./src/utils/"
ut.files <- list.files(ut.folder)

# Load all files if exist
if(length(ut.files > 0)){
  invisible(sapply(file.path(ut.folder, ut.files), source))
}

## logging 
log_file <- file.path(getwd(),"logs", "log.txt")
report <- logger(threshold="INFO"
                 ,appenders = file_appender(log_file))

## create an environment for storing variables
lari_env <- new.env()
