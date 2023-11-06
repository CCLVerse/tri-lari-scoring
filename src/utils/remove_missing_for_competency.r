#' @title Remove Missing Values from Competency Items
#' @description
#'   Remove rows with missing values for competency items in the specified columns.
#'
#' @param df Dataframe to work with.
#' @param column_names Column names to remove missing values from. Must be a character vector or a single string containing the column names.
#' @param regex_pattern Boolean to indicate whether the column_names consist of regular expression patterns or a column names vector. Default is FALSE.
#'
#' @return A new dataframe without the missing values for the selected columns.
# 
#' @examples
#' # Example usage:
#' my_data <- data.frame(ID = 1:5, Competency1 = c(NA, 2, 3, 4, 5), Competency2 = c(1, NA, 3, NA, 5))
#' columns_to_check <- c("Competency1", "Competency2")
#' result <- remove_missing_from_competency(df = my_data, column_names = columns_to_check, regex_pattern = FALSE)
# 
#' # The resulting dataframe contains rows with complete data for the specified columns.
# 
#' @importFrom tidyr drop_na
remove_missing_from_competency <- function(df=data.frame(),column_names=character(), regex_pattern=FALSE){

    if(regex_pattern){
        column_names <- get_column_names(df=df, pattern=column_names)
    }

    df <- df %>% 
        tidyr::drop_na(!!! syms(column_names))

    return(df)

}