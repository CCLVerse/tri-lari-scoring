#' @title Compute column means
#' @description Compute the column means for the selected columns
#' @param df Datafrae
#' @param columns Columns for which to get the means
#' @param regex_pattern 
#' @return Column means
#' @export 
compute_statistics <- function(df=data.frame(), columns=character(), regex_pattern=FALSE){

    if(regex_pattern){
        columns <- get_column_names(df=df, pattern=columns)
    }

    validate_df(df)
    validate_cols(df=df, columns=columns)

     result <- data.frame( 
        Mean = sapply(df[,columns], function(x) paste0(round(mean(x, na.rm=T),2))),
        SD = sapply(df[,columns], function(x) round(sd(x, na.rm=T),2))) %>% 
        rownames_to_column(var='Variables') 
  
    return(result)
}