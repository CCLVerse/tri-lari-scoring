#' @title Build First Level Model
#' @description Constructs a model for analyzing competency assessments using lavaan.
#'
#' This function generates a SEM to examine competency assessments, considering multiple raters' perspectives.
#  The SEM is created with the lavaan package in R and is designed to capture relationships between competency items, latent factors (competencies), and various raters.
#  You can specify the competency columns, the factor name (competency name), and the raters to include in the model.
#
#' @param df Dataframe containing competency assessment data.
#' @param competency_cols_names A character vector of column names representing competency assessments.
#' @param factor_name A descriptive name for the competency or latent factor.
#' @param raters A character vector specifying the types of raters to incorporate in the model.
#' @param regex_pattern Boolean indicating whether competency_cols are regular expression patterns or column names.
#' Default is FALSE.
#  
#' @return A character string representing the SEM structure for competency analysis.
#' @export
build_first_level_model <- function(df=data.frame(), competency_cols_names=NULL, factor_name=NULL, raters=NULL, regex_pattern=FALSE){

    validate_df(df)

    model_params <- configure_model_parameters(df=df, raters=raters, competency_cols_names=competency_cols_names, factor_name=factor_name, regex_pattern=regex_pattern)

    raters <- model_params$raters
    factor_name <- model_params$factor_name
    column_names <- model_params$column_names
    
    ## generate string of model for each rater types and stitch them together

    model <- invisible(
        sapply(raters, function(x){
            # select ratings by rater
            rater_model <- create_model_part_by_rater(column_names, x)

            create_model_structure(factor_name=factor_name, suffix=x, items=rater_model)
    
        })) %>% unname() 

    model <- paste(model, collapse=" \n ")
    
    return(model)

}