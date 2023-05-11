#' @title Build First Level Model
#' @description Creates a model structure that is required for running LAVAAN analyses
#' @param df Dataframe to work with
#' @param competency_cols_pattern A regular expression pattern to identify the required cols. It is ignored  
#' @param competency_cols A character vector of required columns for building the model. It is optional if `competency_cols_patter` is provided. 
#' @param factor_name A name that describes the compentency or the factor for which the model is being created. 
#' @param raters A character vector of all raters that are required in the model. 
#' @param regex_pattern Boolean to indicate whether the column_names consists of regular expression pattern or column names vector. Default is FALSE.
#' @return Returns the character of the model
#' @export
build_first_level_model <- function(df=data.frame(), competency_cols=NULL, factor_name=NULL, raters=NULL, regex_pattern=FALSE){

    validate_df(df)
    
    model_params <- configure_model_parameters(df=df, raters=raters, competency_cols=competency_cols, factor_name=factor_name, regex_pattern=regex_pattern)

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

    model <- paste(model, collapse="\n")
    
    return(model)

}