#' @title Remove Missing Values
#' @description Remove missing rows for competency items.
#' @param df Dataframe to work with.
#' @param column_names Column names to remove the missing values from. Must be a character vector or a single string containing the column names
#' @return Returns new dataframe without the missing values for the selected columns. 
#' @export 
remove_missing_from_competency <- function(df=data.frame(),column_names=character()){

    df <- df %>% 
        tidyr::drop_na(!!! syms(column_names))

    return(df)

}