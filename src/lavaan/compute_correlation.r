#' @title Compute Correlation
#' @description
#'   Computes the correlation between one or more variables and a target variable.
#'
#' @param df The dataframe containing the variables.
#' @param x String or character vector of variable names to compute the correlation.
#' @param y The target variable to correlate with.
#' @param suffix (optional) Suffix to append to the variable names if renaming the columns.
#' @param regex_pattern Boolean value to indicate whether the columns in the `x` argument contain a pattern. Default is FALSE.
#'
#' @return A dataframe with correlation coefficients.
#'
#' @examples
#' # Example usage for computing correlation:
#' df <- read.csv("data.csv")
#' correlation_df <- compute_correlation(df, x = c("Variable1", "Variable2", "Variable3"), y = df$Target, suffix = "Factor")
# 
compute_correlation <- function(df=data.frame(), x=character(), y=NULL, suffix=character(), regex_pattern=FALSE){

    validate_df(df)
    cor_df <- data.frame()

    if(regex_pattern){
        x <- get_column_names(df=df, pattern=x)
    }

    if(!missing(suffix)){
        x <- clean_raters(x) %>%
            sprintf("%s_%s",.,suffix)

    }

    correlation <- cor(df[x], y) %>%
        as.data.frame()

    return(correlation)

}