# Author: Sirish Shrestha
# Date: 2022-10-19
# Description: This R script file is a comprehensive data analysis and package management script. 
# It includes functions for managing R packages, loading required packages, sourcing functions 
# from various directories, configuring logging, and creating an environment for variable storage. 

# load the 'load_packages' function from the 'load_packages.R' script
source('./src/utils/load_R_scripts_recursive.r')
load_R_scripts_recursive("./src")

# load all global variables
source("./src/globals.r")

# load all required packages
load_packages(c('tidyverse', 
                'log4r', 
                'lm.beta', 
                'kableExtra'))



# configure logging 
log_file <- file.path(getwd(),"logs", "log.txt")
report <- logger(threshold="INFO"
                 ,appenders = file_appender(log_file))

# create an environment for storing variables
lari_env <- new.env()

