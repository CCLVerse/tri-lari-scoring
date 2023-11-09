#' @title Count Missing Values and Percentages
#' @description
#'   Compute the missing values and provide the result as a table.
#'
#' @param df The dataframe to work with.
#'
#' @return A dataframe of missing counts and percentages.
# 
#' @examples
#' # Example usage:
#' missing_data <- data.frame(ID = 1:5, Name = c("Alice", "Bob", NA, "David", "Eve"), Age = c(25, 30, NA, 35, 28))
#' missing_summary <- count_missing_values(df = missing_data)
# 
#' # Computes and displays a table of missing counts and percentages for each variable.
# 
#' @importFrom dplyr arrange
#' @importFrom kableExtra kable
#' @importFrom kableExtra kable_material_dark
count_missing_values <- function(df=data.frame()){

    validate_df(df)

    
    missing_count_df <- data.frame( 
        Percentage = sapply(df, function(x) round(mean(is.na(x)),2)),
        Total = sapply(df, function(x) round(sum(is.na(x)),2))) %>% 
        rownames_to_column(var='Variables') %>% 
        arrange(Total)

    return(missing_count_df)

}
