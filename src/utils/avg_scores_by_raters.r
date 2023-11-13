#' @title Average Item Scores By Raters
#' @description
#'   Computes the average scores by raters in the dataframe.
#'
#' @param df A dataframe to work with.
#' @param required_cols A character vector of column names that are required in the dataframe. These are columns that may or may not be used in summarization.
#' @param item_cols A character vector of column names of items.
#' @param competency_cols A character vector of column names of competency scores in the dataframe.
#' @param research_cols A character vector of column names that are used to capture research questions.
#' @param grouping_cols A character vector of columns that are used in grouping the dataframe.
#'
#' @return A dataframe that consists of all items, competency cols, and research columns averaged across raters and spread out in the dataframe.
# 
#' @examples
#' # Example usage:
#' data <- data.frame(ID = c(1, 1, 2, 2, 3), 
#'                    Rater = c("A", "B", "A", "B", "A"), 
#'                    Item1 = c(3, 4, 2, 3, 5), 
#'                    Item2 = c(4, 5, 3, 4, 5))
#' required_columns <- c("ID", "Rater")
#' item_columns <- c("Item1", "Item2")
#' competency_columns <- character(0)
#' research_columns <- character(0)
#' grouping_columns <- c("ID")
#' result <- avg_scores_by_raters(df = data, required_cols = required_columns, 
#'                                 item_cols = item_columns, competency_cols = competency_columns, 
#'                                 research_cols = research_columns, grouping_cols = grouping_columns)
# 
#' # Averages item scores by raters and groups the result by ID.
# 
#' @importFrom dplyr group_by summarise_at ungroup
avg_scores_by_raters <- function(df=NULL, required_cols=NULL, item_cols=NULL, competency_cols=NULL, research_cols=NULL, grouping_cols=NULL){

    # Validate the dataframes and columns used in aggregation
    validate_df(df)
    validate_cols(df=df, columns=required_cols)
    validate_cols(df=df, columns=item_cols)
    # validate_cols(df=df, columns=competency_cols)
    validate_cols(df=df, columns=research_cols)
    validate_cols(df=df, columns=grouping_cols)
    
    # group by id and rater columns to aggregate the data
    df <- df %>%
        dplyr::select(!!! all_of(required_cols),
                      !!! all_of(item_cols),
                      # !!! all_of(competency_cols),
                      !!! all_of(research_cols)) %>%
        dplyr::group_by(!!! syms(grouping_cols)) %>%
        dplyr::summarise_at(vars(item_cols
                                # ,competency_cols
                                ,research_cols),
                        list(mean=mean), na.rm=TRUE) %>%
        dplyr::ungroup()
    
    # df <- df %>%
    #   select(c(all_of(required_cols), all_of(item_cols), all_of(competency_cols), all_of(research_cols))) %>%
    #   group_by(across(all_of(grouping_cols))) %>%
    #   summarise(across(c(item_cols, competency_cols, research_cols), list(mean = ~mean(.x, na.rm = TRUE)))) %>%
    #   ungroup()

    return(df)

}
