#' @title Create Regular Expression Pattern for Competency
#' @description
#'   Create a regular expression pattern for the given competency. This function is a helper function. If the pattern doesn't fit your data, you may bypass or update this function, or you may create your own regex.
#'
#' @param item_numbers A character vector of numeric values of the item numbers.
#' @param df (optional) Dataframe to verify the column names. If not provided, the function will use the current dataframe in lari_env.
#' @param verify (optional) A boolean variable to indicate whether or not to verify the column names extracted from the pattern. If true, it will use the current dataframe to extract the column names and display them on the console. Default is FALSE.
#'
#' @return Regular expression pattern to use in extracting the columns.
# 
#' @examples
#' # Example usage:
#' items_to_match <- c("1", "3", "5")
#' pattern <- get_regex_pattern_for_competency(item_numbers = items_to_match, verify = TRUE)
# 
#' # Creates a regular expression pattern for extracting columns.
# 
#' @importFrom dplyr select
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

        message("Please ensure that the column names match with the ones needed for the analyses.")

        cols <- df %>%
            dplyr::select(matches(item_col_pattern)) %>%
            colnames()
    }

    return(item_col_pattern)
}