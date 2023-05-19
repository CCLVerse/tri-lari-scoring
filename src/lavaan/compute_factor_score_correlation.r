#' @title Compute factor score correlation
#' @description The correlation helps determine if the generated factor scores are equal to lavaan-generated factor scores. 
#' @param df The dataframe which contains the variable.
#' @param x String or character vector of variable names. 
#' @param y Variable to correlate
#' @param suffix Suffix to use if renaming the columns 
#' @return A dataframe of correlation
compute_factor_score_correlation <- function(df=data.frame(), x=character(), y=NULL, suffix=character()){

    validate_df(df)
    cor_df <- data.frame()

    if(!missing(suffix)){
        x <- clean_raters(x) %>%
            sprintf("%s%s",.,suffix)

    }

    correlation <- cor(df[x], y) %>%
        as.data.frame()

    return(correlation)

}