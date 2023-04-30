#' @title Create Regular Expressions Pattern
#' @description Create a regular expression pattern for given competency. This function is only a helper function. If the pattern doesn't fit your data, you may bypass/update this function, or you may create your own regex. 
#' @param item_numbers A character vector of numeric values of the item numbers. 
#' @param df (optional) Dataframe to verify the column names. If this is not provided, then the function will use current dataframe in lari_env. 
#' @param verify (optional) A boolean variable to indicate whether or not to verfiy the column names extracted from the pattern. If true, it'll use the current dataframe to extract the column names and display on the console. Default is FALSE.
#' @return Regular expression pattern to use in extracting the columns. 
get_regex_pattern_for_competency <- function(item_numbers=NULL, df=NULL, verify=FALSE){

    if(is.null(item_numbers) && is.na(item_numbers)){
        stop("There are no numbers to generate pattern.")
    }

    item_numbers <- paste0(item_numbers, collapse="|")

    item_col_pattern <- sprintf("(?i)\\w+s(1(.*(%s))|2|5).*$", item_numbers)

    if(verify){

        if(is.null(df) && is.na(df)){
            df <- get_current_df()
            validate_df(df)
        }

        message("Please ensure that the column names matches with the ones needed for the analyses.")

        cols <- df %>%
            select(matches(item_col_pattern)) %>%
            colnames()
        print(cols)
    }

    return(item_col_pattern)
}