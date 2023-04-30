#' @title Filter rows with all raters
#' @description Some leaders may not contain scores from all raters. The function will filter out the ones that do not have all rater scores. The list of raters that must have rated the leaders are self, direct reports, peer, and boss.
#' @param df The dataframe to work with
#' @param id_column The column in the dataframe that contains unique identifier to identify each observation in the dataframe. 
#' @param raters A list of raters that must have rated the leaders. The default list is self, direct reports, peer, and boss. It can be modified
#' @param rater_colname A column name that consists of the rater types.
#' @return A dataframe which consists of leaders with all raters
#' @export 
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