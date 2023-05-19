#' @title Aggregate competency columns
#' @description Take all item columns to create an aggregate column of the competency
#' @param df Dataframe that contains the columns
#' @param columns All columns to aggregate
#' @param aggregated_column_name Aggregated column name to use
#' @return dataframe with added aggregated column
aggregate_competency_cols <- function(df=data.frame(), columns=character(), aggregated_column_name=character()){
    validate_df(df)
    validate_cols(df=df, columns=columns)

    if(is.na(aggregated_column_name) && is.null(aggregated_column_name) && aggregated_column_name==''){
        stop("The aggregated column name must not be empty.")
    }

    df <- df %>%
        dplyr::mutate(!!aggregated_column_name := rowMeans(across(all_of(columns)), na.rm = TRUE))
        
        
    return(df)
}