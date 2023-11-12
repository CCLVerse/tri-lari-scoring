
#' Load Data from CSV or RData Source
#'
#' This function reads data from either a CSV or RData source, processes it by converting
#' specific columns to factors, and sets the loaded data as the current data frame.
#'
#' @param source A character string specifying the path to the data source (CSV or RData file).
#' @param raters A vector specifying the levels for the RaterType column (default is NULL).
#'
#' @details The function detects the file type based on the source file extension (CSV or RData),
#' reads the data, and processes it by converting the ESI_Key and RaterType columns to factors.
#' The levels for the RaterType column can be specified using the 'raters' parameter. The processed
#' data is then set as the current data frame using the `set_current_df` function.
#'
#' @seealso [read_csv(), readRDS(), set_current_df()]
#'
#' @return The function does not return any value but sets the loaded and processed data as the current data frame.
#'
#' @examples
#' \dontrun{
#' # Example usage
#' load_data(source = "your_data.csv", raters = c("Self", "Peer"))
#' }
#'
#' @export
load_data <- function(source=as.character(), raters=NULL){
  
  if(endsWith(source, ".csv")){
    data <- read_csv(source)
  } else if(endsWith(source, ".RData")){
    data <- readRDS(source)
  }
  
  data <- data %>% 
    filter(RaterType %ni% c("Other", "Superior"))
  
  data$ESI_Key <- factor(data$ESI_Key)
  data$RaterType <- factor(data$RaterType, levels = raters)
  
  
  set_current_df(df=data)
  
  return(data)
  
}