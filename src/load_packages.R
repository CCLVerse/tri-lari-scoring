# Author: Sirish Shrestha
# Date: 2022-10-19
# Description: This R script provides a set of functions for package management and installation. 
# It includes functions to check for GitHub packages in a list and install and load the required packages, 
# including GitHub packages if specified. The script helps streamline the process of managing R packages.


#' Install and load R packages
#' 
#' This function installs and loads a list of R packages, including GitHub packages 
#' if specified. If a GitHub package is detected, the 'devtools' package is required 
#' for installation.
#' 
#' @param pkg A character vector of package names to install and load.
#' 
#' @export
#' 
#' @examples
#' # Example usage:
#' packages <- c("tidyverse", "psych", "github_user/repo", "ggplot2")
#' load_packages(packages)
#' 
#' @importFrom devtools install_github
#'  
load_packages <- function(pkg){
  
  github_pkgs <- NULL
  root_pkg_name <- gsub(".*/", "", pkg)
  
  # check if packages are already installed 
  installed_packages <- as.character(installed.packages()[,'Package'])
  
  # extract the packages that are not yet installed
  packages <- pkg[!root_pkg_name %in% installed_packages]
  
  if(length(packages) == 0){

    # all required packages are already installed, so we can proceed with loading the packages
    invisible(lapply(root_pkg_name, require, character.only = TRUE))
    return
  }
  
  # detect GitHub packages
  github_pkgs <- check_for_github_packages(packages)
  
  
  if(length(github_pkgs$packages) > 0){
    if(!require(devtools)){

      # 'devtools' is required to install GitHub packages, so we install it
      message("Devtools is required to install github packages. Installing devtools..")
      install.packages("devtools")
      library(devtools)
    }
    
    # install GitHub packages
    install_github(github_pkgs$packages)

    # remove installed GitHub packages from the list of packages to be installed
    packages <- packages[! github_pkgs$packages %in% packages]
    
  }
  else if(length(packages) > 0){
    
    # install packages from CRAN (The Comprehensive R Archive Network)
    invisible(lapply(packages, install.packages, repo='http://cran.rstudio.com/'))
    
  }
  
  invisible(lapply(root_pkg_name, require, character.only = TRUE))
  
  # clean up the 'github_pkgs' variable
  github_pkgs <- NULL
  
}


#' Check for GitHub packages in the list
#' 
#' This function retrieves GitHub packages from the list of packages and checks 
#' for GitHub package names in the format "github_account/repo".
#' 
#' @param pkgs A character vector of package names. 
#' @return A list with two elements:
#'   - 'packages': A character vector of GitHub packages.
#'   - 'index': A numeric vector indicating the index of GitHub packages in the input list.
#' 
#' @examples
#' # Example usage:
#' pkgs <- c("dplyr", "ggplot2", "user/repo", "other/package")
#' result <- check_for_github_packages(pkgs)
#' # result$packages will contain "user/repo"
#' # result$index will contain the index of "user/repo" in the input list.
#' 
#' @export
check_for_github_packages <- function(pkgs){

  # identify GitHub packages by searching for the '/' character in package names
  root_pkg <- which(grepl(pattern = "/", x=pkgs, ignore.case = TRUE))
  
  # return a list with GitHub package names and their respective indices
  return (setNames(list(pkgs[root_pkg], root_pkg), c("packages", "index")))
}
