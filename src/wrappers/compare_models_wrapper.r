#' @title Compare models
#' @description Wrapper for comparing models of outcome variables with latent variablee, aggregated variables, and a combination of both
#' @param 
compare_models_wrapper <- function(df=data.frame(), aggregated_column_name=character(), latent_raters_columns=character(), aggregated_raters_columns=character()){

    validate_df(df=df)
    validate_cols(df=df, column=aggregated_column_name)

    formula <- formula()

    if((length(latent_raters_columns) >= 1)){
        ## this means the variables are provided as a character vector. All variables need to be first validated and then converted to the forumla

        validate_cols(df=df, column=latent_raters_columns)
        latent_raters_columns <- paste0(latent_raters_columns, collapse="+")
            
    } 

    formula <- create_formula(dependent_variable=aggregated_column_name
                    , independent_variable=latent_raters_columns)

    mod1 <- linear_model(formula=formula 
                     , df=df)

    ## create a function to generate mode

}


#' @title Create formula
#' @description Create formula from column names
#' @param dependent_variable An outcome column
#' @param independent_variable Independent columns
#' @return formula to compute model
create_formula <- function(dependent_variable, independent_variable){

    model <- character()
    formula <- forumla()

    forumla <- pasteo(dependent_variable, " ~ ", independent_variable)
    formula <- as.formula(forumla)


    return(formula)



}