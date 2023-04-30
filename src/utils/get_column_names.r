#' @title Get column names
#' @description Get the column names based on the pattern. This uses the current dataframe from the environment. 
#' @param pattern A pattern to recognize column names from the dataframe
#' @return column names
#' @export 
get_column_names <- function(pattern=NULL){

    if(is.null(pattern) && is.na(pattern)){
        stop("The pattern is required")
    }

    columns <- get_current_df() %>% 
            select(matches(pattern)) %>%
            colnames()

    return(columns)

}