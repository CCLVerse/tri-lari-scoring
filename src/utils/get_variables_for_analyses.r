#' Create Variables for Data Processing
#'
#' This function creates variables based on input columns and factor name for data processing.
#'
#' @param df A data frame containing the input data for processing.
#' @param columns A character vector specifying the column names for variable creation.
#' @param factor_name A character string specifying the factor name.
#'
#' @details The function generates various variables needed for data processing, including regular
#' expression patterns, column patterns, and lists of columns for different analyses.
#'
#' @return A list containing global variables and lavaan variables.
#'
#' @examples
#' \dontrun{
#' # Example usage
#' create_variables(df = your_data, columns = c("BMK_S1_1", "BMK_S1_2"), factor_name = "Decisive")
#' }
#'
get_variables_for_analyses <- function(df=NULL, columns=NULL, factor_name=NULL){
  
  ## load global variables
  variables <- load_global_variables(data = df)
  
  ## create a column and column digit (the last digits of the column names) pattern
  col_pattern <- paste0(columns, collapse="|")
  digit_pattern <- str_extract_all(columns, "(\\d{1,}$)") %>% unlist() %>% paste0(., collapse="|")
  
  regex_pattern = TRUE
  column_pattern_for_analyses <- sprintf("ESI_Key|%s|BMK_S2_8|BMK_S2_13|BMK_S2_15|BMK_S2_19|BMK_S2_22|BMK_S2_17|BMK_S2_25|BMK_S2_35|BMK_S2_18|BMK_S2_21|BMK_S2_23|BMK_S2_28|BMK_S2_30|BMK_S2_34|BMK_S2_36|BMK_S2_6|BMK_S2_7|BMK_S2_12|BMK_S2_14|BMK_S2_10|BMK_S2_5|BMK_S2_16|BMK_S2_26|BMK_S2_24|BMK_S2_33|BMK_S2_2|BMK_S2_20|BMK_S2_27|BMK_S2_29|BMK_S2_31|BMK_S2_32|BMK_S2_3|BMK_S2_4|BMK_S2_1|BMK_S2_11|BMK_S2_9|BMK_S5_1|BMK_S5_2|BMK_S5_3|BMK_S5_4|BMK_S5_5|BMK_S5_6|BMK_S5_7|BMK_S5_8|BMK_S5_9", col_pattern)
  competency_cols_pattern <- col_pattern
  competency_cols_with_factor_weights <- sprintf("BMK_S1_(%s)(?!.*%s).*", digit_pattern, tolower(factor_name))
  columns_to_remove_missing_values <- sprintf("ESI_Key|%s", col_pattern)
  factor_weights_competency_cols <- sprintf("\\w+_S1_(%s)(?!.*%s).*", digit_pattern, tolower(factor_name))
  factor_weights_cols <- sprintf("\\w+_S1_(%s)(.*%s).", digit_pattern, tolower(factor_name))
  outcome_raters = "BMK_S5_1_mean_(?!Self)"
  outcome_colname = "BMK_S5_1_mean_all_rater"
  
  ## this creates a column name for the aggregated values for each rater type, reputation, and arena. It concatenates "_mean_" and rater type to the column
  ## reputation: dr + boss + peer
  ## arena: self + dr + boss + peer
  self <- paste0(columns, "_mean_Self")
  dr <- paste0(columns, "_mean_Direct_Report")
  boss <- paste0(columns, "_mean_Boss")
  peer <- paste0(columns, "_mean_Peer")
  
  rowmeans_columns_list <- list(
    self, dr, boss, peer, c(dr, boss, peer), c(self, dr, boss, peer)
  )
  
  ## all variables required during lavaan analyses
  vars <- list(
    ## data processing variables
    research_cols = variables$research_cols,
    required_cols = variables$required_cols,
    grouping_cols = variables$grouping_cols,
    competency_cols = variables$competency_cols,
    competency_item_cols = variables$competency_item_cols,
    ## lavaan variables
    raters = variables$raters,
    factor_name = factor_name,
    regex_pattern = regex_pattern, 
    outcome_raters = outcome_raters, 
    outcome_colname = outcome_colname,
    factor_weights_cols = factor_weights_cols, 
    rowmeans_columns_list = rowmeans_columns_list, 
    competency_cols_pattern = competency_cols_pattern, 
    column_pattern_for_analyses = column_pattern_for_analyses, 
    factor_weights_competency_cols = factor_weights_competency_cols, 
    columns_to_remove_missing_values = columns_to_remove_missing_values, 
    competency_cols_with_factor_weights = competency_cols_with_factor_weights 
  )
  
  return(vars)
}
