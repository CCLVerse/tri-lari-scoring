build_bifactor_model <- function(competency_cols=NULL, df=NULL, factor_name=NULL, raters=NULL){

    column_names <- get_column_names(df=df, pattern=competency_cols)
    
    
    ## generate string of model for each rater types and stitch them together

    model <- build_first_level_model(competency_cols=competency_cols, df=df, factor_name=factor_name, raters=raters) 

    # model <- paste0(model, sep="\n")

    
    arena <- create_ari_model_by_rater(column_name=column_names, raters=raters, factor_name=factor_name, suffix="arena")
    
    reputation <- create_ari_model_by_rater(column_name=column_names, raters=raters, factor_name=factor_name, suffix="reputation")
             
    model <- c(model, arena, reputation)
    
    return(model)

}