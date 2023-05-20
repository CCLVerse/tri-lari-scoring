

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
             
    model <- c(model, arena, reputation)
    
    model <- paste0(model, collapse=" \n ")

    return(model)

}