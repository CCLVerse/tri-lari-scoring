#' @title Clean rater values
#' @description Function to remove spaces from rater names
#' @param rater A character vector or string
#' @return Cleaned values of raters
clean_raters <- function(raters=character()){

    raters <- raters %>% str_replace_all(., "\\s+", "_")
    return(raters)
}