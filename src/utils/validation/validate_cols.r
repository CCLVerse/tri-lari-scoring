#' @title Validate Columns
#' @description
#'   Validate columns that are used in calculations.
#'
#' @param df A dataframe to validate the columns in.
#' @param columns A string or character vector of column names to validate.
#'
#' @return TRUE if all specified columns exist in the dataframe; otherwise, it stops the execution and provides an error message.
# 
#' @examples
#' # Example usage:
#' my_dataframe <- data.frame(ID = 1:5, Name = c("Alice", "Bob", "Charlie", "David", "Eve"))
#' required_columns <- c("ID", "Name", "Age")
#' result <- validate_cols(df = my_dataframe, columns = required_columns)
# 
#' # Successful validation will return TRUE.
# 
#' @importFrom dplyr colnames
#'
validate_cols <- function(df=NULL, columns=NULL){

    validate_df(df)

    if(is.null(columns) && is.na(columns)){
        stop("The column names are required")
    }

    if (!all(columns %in% colnames(df))) {
        
        missing_cols <- columns[!columns %in% colnames(df)]
        stop(sprintf("The following columns do not exist in the data frame: %s", paste(missing_cols, collapse = ", ")))
    }

    return(TRUE)
}
