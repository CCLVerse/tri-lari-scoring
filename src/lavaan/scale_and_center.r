#' @title Scale and Center the columns
#' @description Scale and center columns
#' @param column_names Column names to mean center
#' @param center Boolean to indicate if the columns need to be mean centered. Default is TRUE.
#' @return dataframe with the scaled column values
scale_and_center_columns <- function(df=data.frame(), column_names=character(), center=TRUE){

    validate_cols(df=df, column_names)

    # center and scale the columns using dplyr
    df <- df %>% 
        dplyr::mutate(across(all_of(column_names)
                    , ~ scale(.x
                        , center = center
                        , scale = FALSE)))

    return(df)

}