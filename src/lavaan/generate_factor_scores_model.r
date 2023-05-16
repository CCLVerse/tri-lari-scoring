#' @title Factor scoring 
#' @description Create factor scores by weighting/summing the item responses by the relevant factor scoring weights
#' @param df Dataframe to woork with
#' @param competency_cols Columns belonging to the competency
#' @param factor_weights_cols Columns with factor weights
#' @param factor_name The name of the competency or the name of the factor
#' @param regex_pattern Boolean value to indicate if the col names are regex pattern or column names
#' @return Equations with all column names to calculate the latent variable. The returned datatype is a character.
create_factor_scores_model <- function(df=data.frame(), competency_cols=character(), factor_weights_cols=character(),
factor_name=character(), regex_pattern=FALSE){
    if(regex_pattern){
        competency_cols <- get_column_names(df=df, pattern=competency_cols)

        factor_weights_cols <- get_column_names(df=df, pattern=factor_weights_cols)
    }

    validate_cols(df, competency_cols)

    # Extract the factor weights column vector before the word "decisive"

    factor_weight_prefix <- sub(sprintf("_%s.*", factor_name), "", factor_weights_cols)

    # Find the indices of matching prefixes
    match_idx <- match(competency_cols, factor_weight_prefix)

    # Concatenate the matching strings with " * "
    result <- paste0(
        competency_cols[!is.na(match_idx)], 
        " * ", 
        factor_weights_cols[match_idx[!is.na(match_idx)]]
    )

    # Join all strings with " + "
    result <- paste(result, collapse = " + ")

    return(result)
}


#' @title Generate factor scores
#' @description Generates the factor scores for all components of LARI model. 
#' @param df Dataframe to woork with
#' @param competency_cols Columns belonging to the competency
#' @param factor_weights_cols Columns with factor weights
#' @param factor_name The name of the competency or the name of the factor 
#' @param latent_variables Character vector of latent variable names used in naming columns with factor_weights. 
#' @param latent_variable_names Names of latent variable to use. It must be in the same order as the latent_variables
#' @param regex_pattern Boolean value to indicate if the col names are regex pattern or column names
generate_factor_scores <- function(df=data.frame(), competency_cols=character(), factor_weights_cols=character(), latent_variable_names=character(), latent_variables=character(), factor_name=character(), regex_pattern=FALSE){

    result <- invisible(
        lapply(latent_variables, function(x) {
            create_factor_scores_model(df=avg_scores_by_rater_df_merged
            , competency_cols = competency_cols
            , factor_weights_cols = sprintf("%s%s", factor_weights_cols,x)
            , factor_name = factor_name
            , regex_pattern = regex_pattern)
        
        }) %>% 
        setNames(latent_variable_names)
    )

    return(result)

}