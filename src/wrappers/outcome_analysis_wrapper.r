#' @title Outcome analysis wrapper
#' @description Wrapper function to conduct outcome analyses from the lavaan output
#' @param df A merged data frame that contains the latent variables and the outcome columns
#' @param columns A vector of column names that pertain to the outcome 
#' @param aggregated_column_name A new column name to create that aggregates the outcome item columns. 
#' @param columns_for_correlation A vector of column names to compute correlation with the aggregated outcome columns.
outcome_analysis_wrapper <- function(df=data.frame(), columns=character(), aggregated_column_name=character(), columns_for_correlation=character(),  competency_cols=character(), regex_pattern=TRUE, rowmeans_new_cols=character(), rowmeans_mean_cols=list(), rowmeans_correlation_columns=character(), rowmeans_pattern=TRUE){

    validate_df(df=df)
    validate_cols(df=df, pattern=columns)

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


    ## compute conventional average

    df <- calculate_rowmeans(df=df
                        , new_cols=rowmeans_new_cols
                        , mean_cols=rowmeans_mean_cols)

    compute_correlation(df=df
                , x = rowmeans_correlation_columns
                , regex_pattern = rowmeans_pattern)

    return(df)

}