#' @title Average Item Scores By Raters
#' @description Computes the average scores by raters in the dataframe
#' @param df A dataframe to work with
#' @param required_cols A character vector of column names that are required in the dataframe. These are columns that may or may not be used in summarization. 
#' @param item_cols A character vector of column names of items 
#' @param competency_cols A character vector of colum names of competency scores in the dataframe
#' @param research_cols A character vector of column names that are used to capture research questions. 
#' @param grouping_cols A character vector of columns that are used in grouping the dataframe
#' @return A dataframe that consists of all items, competency cols, and research columns averaged across raters and spread out in the dataframe
#' @export 
avg_scores_by_raters <- function(df=NULL, required_cols=NULL, item_cols=NULL, competency_cols=NULL, research_cols=NULL, grouping_cols=NULL){

    # Validate the dataframes and columns used in aggregation
    validate_df(df)
    validate_cols(df=df, columns=required_cols)
    validate_cols(df=df, columns=item_cols)
    validate_cols(df=df, columns=competency_cols)
    validate_cols(df=df, columns=research_cols)
    validate_cols(df=df, columns=grouping_cols)
    
    ## group by id and rater columns to aggregate the data using the given centroid method. Default centroid is mean
    df <- df %>% 
        dplyr::select(!!! all_of(required_cols), 
                      !!! all_of(item_cols), 
                      !!! all_of(competency_cols), 
                      !!! all_of(research_cols)) %>%
        dplyr::group_by(!!! syms(grouping_cols)) %>%
        dplyr::summarise_at(vars(item_cols
                                ,competency_cols
                                ,research_cols), 
                        list(mean=mean), na.rm=TRUE) %>% 
        dplyr::ungroup()

    return(df)

}