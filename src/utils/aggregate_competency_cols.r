#' @title Aggregate Competency Columns
#' @description
#'   Takes all item columns to create an aggregate column of the competency.
#'
#' @param df Dataframe that contains the columns.
#' @param columns All columns to aggregate.
#' @param aggregated_column_name Aggregated column name to use.
#'
#' @return Dataframe with added aggregated column.
# 
#' @examples
#' # Example usage:
#' data <- data.frame(Item1 = c(3, 4, 2, 3, 5), Item2 = c(4, 5, 3, 4, 5))
#' columns_to_aggregate <- c("Item1", "Item2")
#' aggregated_column <- "CompetencyScore"
#' result <- aggregate_competency_cols(df = data, columns = columns_to_aggregate, aggregated_column_name = aggregated_column)
# 
#' # Aggregates item columns to create a new column named "CompetencyScore."
# 
#' @importFrom dplyr mutate
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