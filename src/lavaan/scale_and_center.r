#' @title Scale and Center Columns
#' @description
#'   Scale and center columns.
#'
#' @param df Dataframe to work with.
#' @param column_names Column names to mean center.
#' @param center Boolean to indicate if the columns need to be mean centered. Default is TRUE.
#'
#' @return Dataframe with the scaled column values.
# 
#' @examples
#' # Example usage:
#' data <- data.frame(Item1 = c(3, 4, 2, 3, 5), Item2 = c(4, 5, 3, 4, 5))
#' columns_to_scale_center <- c("Item1", "Item2")
#' result <- scale_and_center_columns(df = data, column_names = columns_to_scale_center, center = TRUE)
# 
#' # Scales and centers the selected columns.
# 
#' @importFrom dplyr mutate scale
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