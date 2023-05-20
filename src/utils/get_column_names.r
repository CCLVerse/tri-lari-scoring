#' @title Get column names
#' @description Get the column names based on the pattern. This uses the current dataframe from the environment. 
#' @param df A Dataframe to work with. If the dataframe is missing, the function retrieves the current dataframe. 
#' @param pattern A pattern to recognize column names from the dataframe
#' @return column names
#' @export 
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