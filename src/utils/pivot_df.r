#' @title Pivot the dataframe
#' @description Pivot the dataframe to wider format such that there are columns for items scored by each rater. 
#' @param df The dataframe to work with. If df is not provided, it'll use the current dataframe loaded from the environment.
#' @param var The name of the variable which contains the raters 
#' @param id_column The column that consists of the ID. 
pivot_df <- function(df=NULL, var=NULL, id_column=NULL){

    # load current dataframe from lari_env if the dataframe is not provided.
    if(is.null(df) && is.na(df)){
        df <- get_current_df()
    } else {
        validate_df(df)
    }

    var <- enquo(var)
    id_column <- enquo(id_column)

    df <- df %>% 
        pivot_wider(
            names_from = var,
            values_from = c(everything(), -id_column, -var)
        )
        
    return(df)
}