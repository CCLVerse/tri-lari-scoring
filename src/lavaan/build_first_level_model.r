build_first_level_model <- function(competency_cols=NULL, df=NULL, factor_name=NULL, raters=NULL){
    
    model_params <- configure_model_parameters(df=df, raters=raters, competency_cols=competency_cols, factor_name=factor_name)

    raters <- model_params$raters
    factor_name <- model_params$factor_name

    column_names <- get_column_names(df=df, pattern=competency_cols)
    

    ## generate string of model for each rater types and stitch them together

    model <- invisible(
        sapply(raters, function(x){
            # select ratings by rater
            rater_model <- create_model_part_by_rater(column_names, x)

            create_model_structure(factor_name=factor_name, suffix=x, items=rater_model)
    
        }))  %>% unlist()

    return(model)

}