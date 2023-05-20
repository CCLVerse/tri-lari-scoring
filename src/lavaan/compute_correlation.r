#' @title Compute correlation
#' @description The correlation helps determine if the generated factor scores are equal to lavaan-generated factor scores. 
#' @param df The dataframe which contains the variable.
#' @param x String or character vector of variable names. 
#' @param y Variable to correlate
#' @param suffix Suffix to use if renaming the columns 
#' @param regex_pattern Boolean value to indicate whether the columns in x argument contains pattern. Default is FALSE
#' @return A dataframe of correlation
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