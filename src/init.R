source('./src/load_packages.R')
## Load all required packages
load_packages(c('tidyverse', 
                'log4r', 
                'dotenv',
                'config',
                'lm.beta', 
                'kableExtra'))

## source all functions from the folders
dirs <- list.dirs("./src", full.names=TRUE, recursive=FALSE)

invisible(sapply(dirs, function(x){
  
  files <- list.files(x)

  # Load all files if exist
  if(length(files > 0)){
    invisible(sapply(file.path(x,files), source))
  }

}))

## logging 
log_file <- file.path(getwd(),"logs", "log.txt")
report <- logger(threshold="INFO"
                 ,appenders = file_appender(log_file))

## create an environment for storing variables
lari_env <- new.env()

## load any environment variables
dotenv::load_dot_env()
