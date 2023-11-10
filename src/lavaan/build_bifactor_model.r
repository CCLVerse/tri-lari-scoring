#' @title Build Bifactor Model
#' @description Constructs a bifactor structural equation model (SEM) for analyzing competency assessments using lavaan.
#'
#' This function generates a bifactor SEM to examine competency assessments, considering multiple raters' perspectives. The bifactor model includes a general competency factor and specific factors (arena and reputation).
#  You can specify the competency columns, the factor name (competency name), and the raters to include in the model.
#
#' @param competency_cols A character vector of column names representing competency assessments.
#' @param df Dataframe containing competency assessment data.
#' @param factor_name A descriptive name for the general competency factor.
#' @param raters A character vector specifying the types of raters to incorporate in the model.
#' @param regex_pattern Boolean indicating whether competency_cols are regular expression patterns or column names.
#' Default is FALSE.
#' @return A character string representing the bifactor SEM structure for competency analysis.
#' @export
build_bifactor_model <- function(competency_cols=NULL, df=NULL, factor_name=NULL, raters=NULL, regex_pattern=FALSE){

    validate_df(df)
    
    
    model_params <- configure_model_parameters(df=df, raters=raters, competency_cols=competency_cols, factor_name=factor_name, regex_pattern=TRUE)

    raters <- model_params$raters
    factor_name <- model_params$factor_name
    column_names <- model_params$column_names

    ## generate string of model for each rater types and stitch them together

    model <- build_first_level_model(competency_cols=competency_cols, df=df, factor_name=factor_name, raters=raters, regex_pattern=regex_pattern) 
    
    arena <- create_ari_model_by_rater(column_name=column_names, raters=raters, factor_name=factor_name, suffix="arena")

    reputation <- create_ari_model_by_rater(column_name=column_names, raters=raters, factor_name=factor_name, suffix="reputation")

    model <- c(model, reputation, arena)
    
    model <- paste0(model, collapse=" \n ")

    return(model)

}