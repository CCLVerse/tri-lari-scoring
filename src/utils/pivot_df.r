#' @title Pivot the Dataframe to Wider Format
#' @description
#'   Pivot the dataframe to a wider format such that there are columns for items scored by each rater.
#'
#' @param df The dataframe to work with. If 'df' is not provided, it will use the current dataframe loaded from the environment.
#' @param var The name of the variable which contains the raters.
#' @param id_column The column that consists of the ID.
#'
#' @return A dataframe in a wider format with columns for items scored by each rater.
# 
#' @examples
#' # Example usage:
#' my_dataframe <- data.frame(ID = 1:5, Rater = c("Rater1", "Rater2", "Rater1", "Rater2", "Rater3"), Item1 = c(3, 4, 5, 4, 3), Item2 = c(4, 3, 2, 3, 4))
#' rater_variable <- "Rater"
#' id_column <- "ID"
#' result <- pivot_df(df = my_dataframe, var = rater_variable, id_column = id_column)
# 
#' # The resulting dataframe is pivoted to a wider format.
# 
#' @importFrom tidyr pivot_wider
pivot_df <- function(df=NULL, var=NULL, id_column=NULL){

    # load current dataframe from lari_env if the dataframe is not provided.
    if(is.null(df) && is.na(df)){
        df <- get_current_df()
    } else {
        validate_df(df)
    }

    log4r::info(report, "[*,pivot_df] Pivoting data wider")
  
    df <- df %>% 
        tidyr::pivot_wider(
              id_cols = c(id_column)
            , names_from = var
            , values_from = setdiff(names(df), c(id_column, var))
        )

    log4r::info(report, "[*,pivot_df] Replace NaN with NA")
    log4r::info(report, "[*,pivot_df] Remove spaces")
    
    ## replace nan with na
    ## rename the columns to remove spaces
    df <- df %>%
        dplyr::mutate_all(~ifelse(is.nan(.), NA, .)) %>%
        dplyr::rename_all(~ str_replace_all(.x, "\\s+", "_"))

    return(df)
}
