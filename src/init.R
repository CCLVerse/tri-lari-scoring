source('./src/load_packages.R')
## Load all required packages
load_packages(c('tidyverse', 'log4r', 'config'))

## source all functions from the lari folder
ws.folder <- "./src/lari/"
ws.files <- list.files(ws.folder)
invisible(sapply(paste0(ws.folder,ws.files), source))


## logging 
log_file <- file.path(getwd(),"logs", "log.txt")
report <- logger(threshold="INFO"
                 ,appenders = file_appender(log_file))
