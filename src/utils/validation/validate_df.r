#' @title Validate Dataframe
#' @description
#'   A simple validation function to check whether the object is a valid dataframe or not.
#'   The program follows stops if the dataframe validation fails.
#'
#' @param df Dataframe to validate.
#'
#' @return TRUE if the provided object is a valid dataframe; otherwise, it stops the execution.
# 
#' @examples
#' # Example usage:
#' my_dataframe <- data.frame(ID = 1:5, Name = c("Alice", "Bob", "Charlie", "David", "Eve"))
#' result <- validate_df(my_dataframe)
# 
#' # Successful validation will return TRUE.
# 
#' @importFrom dplyr nrow
#
validate_df <- function(df=NULL){

    if(is.null(df) && is.na(df)){
        stop("No dataframe was provided to validate.")
    }

    if(!(is.data.frame(df) || is_tibble(df))){
        stop(sprintf("Argument %s must be of class `data.frame` or `tibble`", deparse(substitute(df))))
    }

    if(nrow(df) < 1){
        stop("The object passed seems to be a `data.frame` or a `tibble`, but it has no data.")
    }

    return(TRUE)

}
