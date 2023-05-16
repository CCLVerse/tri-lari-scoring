#' @title Configure Model Parameters
#' @description Configuring parameters needed to build the model by checking and validating, and by conforming the structure before applying to the model. This is a helper function.
#' @param df Dataframe to work with
#' @param competency_cols A character vector of required columns for building the model. It is optional if `competency_cols_patter` is provided. 
#' @param factor_name A name that describes the compentency or the factor for which the model is being created. 
#' @param raters A character vector of all raters that are required in the model. 
#' @param regex_pattern Boolean to indicate whether the column_names consists of regular expression pattern or column names vector. Default is FALSE.
#' @return Returns the character of the model
configure_model_parameters <- function(df=data.frame(), raters=NULL, factor_name=NULL, competency_cols=NULL,regex_pattern=FALSE){

    column_names <- as.character()

    if(regex_pattern){
        column_names <- get_column_names(df=df, pattern=competency_cols)

    } else {
        column_names <- competency_cols
        validate_cols(df, column_names)
    }

    raters <- clean_raters(raters)
    
    model_params <- list(
        raters = raters, 
        factor_name = factor_name, 
        column_names = column_names
    )

    return(model_params)

}