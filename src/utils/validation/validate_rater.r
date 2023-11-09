#' @title Validate Rater
#' @description
#'   Validate whether the specified raters exist in the provided dataframe based on a specified rater column.
#'
#' @param df A dataframe to work with.
#' @param raters A vector of raters to validate.
#' @param rater_colname A column name that consists of the rater types in the dataframe.
#'
#' @return TRUE if all raters are found in the dataframe, or stops the execution and provides an error message.
# 
#' @export 
#' 
#' @examples
#' # Example usage:
#' df <- data.frame(ID = 1:5, Rater = c("Rater1", "Rater2", "Rater3", "Rater1", "Rater4"))
#' raters <- c("Rater1", "Rater2", "Rater3")
#' rater_colname <- "Rater"
#' result <- validate_rater(df, raters, rater_colname)
# 
#' # Successful validation will return TRUE.
# 
#' @importFrom dplyr filter
#'
validate_rater <- function(df=NULL, raters=NULL, rater_colname=NULL){

    # Validate the input dataframe
    validate_df(df)

    # Check if the rater column exists in the dataframe
    validate_cols(df=df, columns=rater_colname)

    if(is.null(raters) && is.na(raters)){
        stop("Raters are required.")
    }

    if(!all(raters %in% df[[rater_colname]])){
        stop("Not all specified raters exist in the dataframe.")
    }

    return(TRUE)
}
