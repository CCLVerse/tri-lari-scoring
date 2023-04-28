#' @title Isolate Raters
#' @description Isolate raters data into separate dataframe
#' @param df Dataframe to isolate raters
#' @param var The categorical variable name from which to filter for each rater.
#' @param raters_to_remove A character vector of raters to remove from the dataframe.
#' @param summarize_cols List of columns to summarize the values
#' @param group_by_cols The specified grouping variables for summarizing the dataframe
#' @param required_cols List of columns that must exist in the dataframe
#' @return A list of dataframe names isolated from the data using the levels in the variable. 
isolate_raters <- function(df=NULL, var=NULL, raters_to_remove=NULL, summarize_cols=NULL, group_by_cols=NULL, required_cols=NULL){

    


}