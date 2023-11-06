#' @title Set Current Dataframe
#' @description
#'   The function sets the current dataframe to be used by codes. This saves time for updating the codes that use the current dataframe.
#'
#' @param df The dataframe to set as the current dataframe.
#'
#' @return NULL
# 
#' @examples
#' # Example usage:
#' my_data <- data.frame(ID = 1:5, Name = c("Alice", "Bob", "Charlie", "David", "Eve"))
#' set_current_df(df = my_data)
# 
#' # Sets the specified dataframe as the current dataframe for use in your code.
# 
#' @importFrom base [[]]
set_current_df <- function(df=NULL){
    
    validate_df(df)

    save_to_env(variable=df, name="current_df", env="lari_env")

}


#' @title Get Current Dataframe
#' @description
#'   The function retrieves the current dataframe to be used by codes.
#'
#' @return The current dataframe.
# 
#' @examples
#' # Example usage:
#' current_data <- get_current_df()
# 
#' # Retrieves the current dataframe for use in your code.
# 
#' @importFrom base [[]]
get_current_df <- function(){

    return(lari_env[["current_df"]])
}