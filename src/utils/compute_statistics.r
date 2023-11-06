#' @title Compute Column Means
#' @description
#'   Compute the column means for the selected columns.
#'
#' @param df Dataframe to work with.
#' @param columns Columns for which to compute the means.
#' @param regex_pattern A logical value indicating whether the columns are specified using regular expressions. Default is FALSE.
#'
#' @return A dataframe containing the column means and standard deviations.
# 
#' @examples
#' # Example usage:
#' data <- data.frame(Age = c(30, 40, 35, 45, 50), Salary = c(50000, 60000, 55000, 70000, 75000))
#' selected_columns <- c("Age", "Salary")
#' result <- compute_statistics(df = data, columns = selected_columns, regex_pattern = FALSE)
# 
#' # Computes the means and standard deviations for the specified columns.
# 
#' @importFrom dplyr rownames_to_column
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