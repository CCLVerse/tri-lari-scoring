#' @title Get Column Names
#' @description
#'   Get the column names based on the pattern. This uses the current dataframe from the environment.
#'
#' @param df A dataframe to work with. If the dataframe is missing, the function retrieves the current dataframe.
#' @param pattern A pattern to recognize column names from the dataframe.
#'
#' @return Column names.
# 
#' @examples
#' # Example usage:
#' pattern_to_match <- "Age|Gender"
#' result <- get_column_names(df = my_dataframe, pattern = pattern_to_match)
# 
#' # Retrieves the column names that match the specified pattern.
# 
#' @importFrom dplyr select
get_column_names <- function(df=data.frame(), pattern=NULL){

    if(is.null(pattern) && is.na(pattern)){
        stop("The pattern is required")
    }

    if(is.null(df) && is.na(df)){
        df <- get_current_df()
    }

    columns <- df %>% 
        dplyr::select(tidyselect::matches(pattern, perl=TRUE)) %>%
        colnames()

    return(columns)

}