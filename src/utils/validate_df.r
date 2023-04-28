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

    return TRUE

}