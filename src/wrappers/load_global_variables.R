#' Load Global Variables for Competency Analysis
#'
#' This function loads global variables related to competency analysis from the provided data frame.
#'
#' @param data A data frame containing the relevant columns for competency analysis.
#'
#' @details The function retrieves the names of competency columns, item columns, research columns,
#' required columns, grouping columns, and a list of raters from the provided data frame. The global
#' variables are returned as a list.
#'
#' @seealso [get_column_names()]
#'
#' @return A list containing the following global variables:
#'   \item{competency_cols}{Names of competency columns.}
#'   \item{competency_item_cols}{Names of item columns that make up the competency columns.}
#'   \item{research_cols}{Names of research-related columns.}
#'   \item{required_cols}{Names of required columns (ESI_Key and RaterType).}
#'   \item{grouping_cols}{Names of grouping columns (ESI_Key and RaterType).}
#'   \item{raters}{A vector containing different types of raters (Self, Direct Report, Peer, Boss).}
#'
#' @examples
#' \dontrun{
#' # Example usage
#' data <- read.csv("your_data.csv")
#' global_vars <- load_global_variables(data)
#' print(global_vars$competency_cols)
#' print(global_vars$raters)
#' }
#'
#' @export
load_global_variables <- function(data=NULL){
  competency_cols <- get_column_names(df=data, pattern = COMPETENCY_COL_PATTERN)
  
  ## all item columns that make up the competency columns
  competency_item_cols <- get_column_names(df=data, pattern = ITEM_COL_PATTERN)
  
  research_cols <- get_column_names(df=data, pattern = RESEARCH_COL_PATTERN)
  
  required_cols <- c("ESI_Key", "RaterType")
  
  grouping_cols <- c("ESI_Key", "RaterType")
  
  ## also in ./src/globals.r
  raters <- c("Self", "Direct Report", "Peer", "Boss")
  
  return(list(
    competency_cols=competency_cols, 
    competency_item_cols=competency_item_cols, 
    research_cols=research_cols, 
    required_cols=required_cols, 
    grouping_cols=grouping_cols, 
    raters=raters
    ))
  
}