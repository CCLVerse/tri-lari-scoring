#' @title Clean Rater Values
#' @description
#'   Cleans rater names by replacing spaces with underscores.
#'
#' @param raters A character vector or string containing rater names.
#'
#' @return Cleaned rater names with spaces replaced by underscores.
#'
#' @examples
#' # Example usage for cleaning rater names:
#' raters <- c("Self Rater", "Direct Report", "Peer Rater")
#' cleaned_raters <- clean_raters(raters)
# 
# Returns: c("Self_Rater", "Direct_Report", "Peer_Rater")
# 
clean_raters <- function(raters=character()){

    raters <- raters %>% str_replace_all(., "\\s+", "_")
    return(raters)
}