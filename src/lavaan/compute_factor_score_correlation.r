#' @title Compute factor score correlation
#' @description The correlation helps determine if the generated factor scores are equal to lavaan-generated factor scores. 
#' @param latent_variables Character vector of latent variable names used in naming columns with factor_weights. 
#' @param df The dataframe which contains the latent variable scores
#' @param fitted_values Lavaan predicted values 
#' @return A dataframe of correlation
compute_factor_score_correlation <- function(latent_variables=character(), df=data.frame(), fitted_values=NULL){

    validate_df(df)
    cor_df <- data.frame()

    latent_variables <- clean_raters(latent_variables) %>%
        sprintf("%sLV",.)


    correlation <- cor(df[latent_variables], fitted_values) %>%
        as.data.frame()

    return(correlation)

}