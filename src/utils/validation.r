#' @title Validate Dataframe
#' @description A simple validation function to check whether the object is a valid dataframe or not. The program folow stops if the dataframe validation fails.
#' @param df Dataframe to validate
validate_df <- function(df=NULL){

    if(is.null(df) && is.na(df)){

        stop("No dataframe was provided to validate.")
    }

    if(!is.data.frame(df) || !is_tibble(df)){
        stop(sprintf("Argument %s must be of class `data.frame`` or `tibble`", deparse(substitute(df))))
    }

    if(nrow(df) < 1){
        stop("The object passed seems to be a `data.frame` or a `tibble`, but it has no data.")
    }

    return(TRUE)

}


#' @title Validate columns
#' @description Validate columns that are used in calculation 
#' @param df A dataframe to validate the columns in 
#' @param columns A string or character vector of column names
#' @return Returns true or stops the execution
#' @export 
validate_cols <- function(df=NULL, columns=NULL){

    validate(df)

    if(is.null(columns) && is.na(columns)){
        stop("The column names are required")
    }

    if (!all(columns %in% colnames(df))) {
        
        missing_cols <- columns[!columns %in% colnames(df)]
        stop(sprintf("The following columns do not exist in the data frame: %s", paste(missing_cols, collapse = ", ")))
    }

    return(TRUE)
}


#' @title Validate rater
#' @description Validate whether the rater exist in the dataframe or not
#' @param df A dataframe to work with
#' @param raters A vector of raters
#' @param rater_colname A column name that consists of the rater types.
#' @return True or stops the execution
#' @export 
validate_rater <- function(df=NULL, raters=NULL, rater_colname=NULL){

    validate_df(df)
    validate_cols(df=df, columns=rater_colname)

    if(is.null(raters) && is.na(raters)){
        stop("Raters are required.")
    }

    if(!all(raters %in% df[[rater_colname]])){
        stop("Not all raters exist in the dataframe.")
    }

    return(TRUE)
}

