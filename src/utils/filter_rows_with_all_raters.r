#' @title Filter Rows with All Raters
#' @description
#'   Some leaders may not contain scores from all raters. The function will filter out the ones that do not have scores from all specified raters.
#'
#' @param df The dataframe to work with.
#' @param id_column The column in the dataframe that contains a unique identifier to identify each observation.
#' @param raters A list of raters that must have rated the leaders, e.g., self, direct reports, peer, and boss.
#' @param rater_colname A column name that consists of the rater types.
#'
#' @return A dataframe consisting of leaders with scores from all specified raters.
# 
#' @examples
#' # Example usage:
#' leaders_data <- data.frame(ID = 1:5, Name = c("Alice", "Bob", "Charlie", "David", "Eve"), Self = c(3, 4, 5, 4, 3), Peer = c(4, 3, 2, 3, 4), DirectReports = c(3, 2, 4, 3, 4))
#' unique_id_column <- "ID"
#' required_raters <- c("Self", "Peer", "DirectReports")
#' rater_type_column <- "RaterType"
#' result <- filter_rows_with_all_raters(df = leaders_data, id_column = unique_id_column, raters = required_raters, rater_colname = rater_type_column)
# 
#' # Filters the dataframe to include leaders with scores from all specified raters.
# 
#' @importFrom dplyr group_by
#' @importFrom dplyr count
#' @importFrom dplyr filter
#' @importFrom dplyr pull
filter_rows_with_all_raters <- function(df=NULL, id_column=NULL, raters=NULL, rater_colname=NULL){

    validate_df(df)
    validate_cols(df=df, columns=id_column)
    validate_cols(df=df, columns=rater_colname)
    validate_rater(df=df, raters=raters, rater_colname=rater_colname)

    rows_with_all_raters <- df %>%
                        dplyr::group_by(!!sym(id_column)) %>%
                        dplyr::count() %>%
                        dplyr::filter(n > 1) %>% 
                        dplyr::pull(id_column)

    df <- df %>%
        dplyr::filter(!!sym(id_column) %in% rows_with_all_raters)

    return(df)

}