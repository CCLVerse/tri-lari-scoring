#' @title Outcome Analysis Wrapper
#' @description
#'   This function is a wrapper to conduct outcome analyses based on lavaan output.
#'
#' @param df A merged data frame that contains the latent variables and the outcome columns.
#' @param columns A vector of column names that pertain to the outcome.
#' @param aggregated_column_name A new column name to create that aggregates the outcome item columns.
#' @param columns_for_correlation A vector of column names to compute correlations with the aggregated outcome columns.
#' @param competency_cols A vector of column names for computing statistics.
#' @param regex_pattern Logical. Use regex patterns for column validation.
#' @param rowmeans_new_cols Character vector of new columns to create with row means.
#' @param rowmeans_mean_cols List of column names to calculate row means.
#' @param rowmeans_correlation_columns Character vector of column names for computing correlations with row means.
#' @param rowmeans_pattern Logical. Use regex patterns for row mean validation.
#'
#' @return A data frame with the computed outcome analyses.
#' 
#' @examples
#' # Example usage:
#' result <- outcome_analysis_wrapper(df = my_data_frame,
#'                                    columns = c("outcome1", "outcome2"),
#'                                    aggregated_column_name = "aggregated_outcome",
#'                                    columns_for_correlation = c("outcome1", "outcome2", "aggregated_outcome"),
#'                                    competency_cols = c("competency1", "competency2"),
#'                                    regex_pattern = TRUE,
#'                                    rowmeans_new_cols = c("row_mean1", "row_mean2"),
#'                                    rowmeans_mean_cols = list("col1", "col2"),
#'                                    rowmeans_correlation_columns = c("row_mean1", "row_mean2"),
#'                                    rowmeans_pattern = TRUE)
# 
#' @importFrom stats aggregate
#'
outcome_analysis_wrapper <- function(df=data.frame(), columns=character(), aggregated_column_name=character(), columns_for_correlation=character(),  competency_cols=character(), regex_pattern=TRUE, rowmeans_new_cols=character(), rowmeans_mean_cols=list(), rowmeans_correlation_columns=character(), rowmeans_pattern=TRUE){

    # Validate the input data frame
    validate_df(df=df)

    # Validate the outcome columns
    validate_cols(df=df, pattern=columns)

    # Aggregate outcome columns into a new column
    df <- aggregate_competency_cols(df=df
                , columns=columns
                , aggregated_column_name=aggregated_column_name)


    compute_correlation(df=df
                    , x = c(columns_for_correlation, 
                            aggregated_column_name)
                    )

    compute_statistics(df=df
                 , columns = competency_cols
                 , regex_pattern = regex_pattern)


    # Compute row means
    df <- calculate_rowmeans(df=df
                        , new_cols=rowmeans_new_cols
                        , mean_cols=rowmeans_mean_cols)

    # Compute correlations with row means
    compute_correlation(df=df
                , x = rowmeans_correlation_columns
                , regex_pattern = rowmeans_pattern)

    return(df)

}