# Utils package for scraping site
# Author: Sirish Shrestha
# Date: 2022-10-19


#' Install and load all packages listed. 
#' 
#' Function to install required packages including github packages. It requires 
#' devtools 
#'   
#' @param pkg: list of packages to install
#' 
#' @export   
#' @example 
#' packages <- c("tidyverse", "psych", "sparklyr", "ggplot2")
#' load_packages(packages)
#'   
load_packages <- function(pkg){
  
  github_pkgs <- NULL
  root_pkg_name <- gsub(".*/", "", pkg)
  
  # check if packages are already installed 
  installed_packages <- as.character(installed.packages()[,'Package'])
  
  packages <- pkg[!root_pkg_name %in% installed_packages]
  
  if(length(packages) == 0){
    invisible(lapply(root_pkg_name, require, character.only = TRUE))
    return
  }
  
  # packages that are loaded from github
  github_pkgs <- check_for_github_packages(packages)
  
  
  if(length(github_pkgs$packages) > 0){
    if(!require(devtools)){
      message("Devtools is required to install github packages. Installing devtools..")
      install.packages("devtools")
      library(devtools)
    }
    
    install_github(github_pkgs$packages)
    packages <- packages[! github_pkgs$packages %in% packages]
    
  }
  else if(length(packages) > 0){
    
    invisible(lapply(packages, install.packages, repo='http://cran.rstudio.com/'))
    
  }
  
  invisible(lapply(root_pkg_name, require, character.only = TRUE))
  github_pkgs <- NULL
  
}


#' Check github packages in the list
#' 
#' This function retrieves the github packages from the list of packages. It checks 
#' for the github package name using the pattern github_account/repo.
#' 
#' @param pkg A list of package names. 
#' @return A list of github packages with index to install.
check_for_github_packages <- function(pkgs){
  
  root_pkg <- which(grepl(pattern = "/", x=pkgs, ignore.case = TRUE))
  
  return (setNames(list(pkgs[root_pkg], root_pkg), c("packages", "index")))
}
