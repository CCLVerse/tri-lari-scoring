#' @title Configure Model Parameters
#' @description
#'   Configure parameters needed to build a model by validating and structuring them before applying to the model.
#'
#' @param df Dataframe to work with.
#' @param competency_cols_names A character vector of required columns for building the model. It is optional if `competency_cols_pattern` is provided.
#' @param factor_name A name that describes the competency or the factor for which the model is being created.
#' @param raters A character vector of all raters that are required in the model.
#' @param regex_pattern Boolean to indicate whether the column names consist of a regular expression pattern or a column names vector. Default is FALSE.
#'
#' @return A character string representing the model structure.
#'
#' @examples
#' # Example usage for configuring model parameters:
#' df <- read.csv("data.csv")
#' model_params <- configure_model_parameters(df, competency_cols = c("Self1", "Self2", "Peer1", "Peer2"), 
#'                                           factor_name = "Competency", 
#'                                           raters = c("Self", "Peer"), 
#'                                           regex_pattern = FALSE)
# 
#' Generates a character string representing the model structure for the specified parameters.
# 
#' @importFrom dplyr
configure_model_parameters <- function(df=data.frame(), raters=NULL, factor_name=NULL, competency_cols_names=NULL,regex_pattern=FALSE){

    column_names <- as.character()

    if(regex_pattern){
        column_names <- get_column_names(df=df, pattern=competency_cols_names)

    } else {
        column_names <- competency_cols_names
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