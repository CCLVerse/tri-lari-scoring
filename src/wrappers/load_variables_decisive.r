#' Load variables for analysis Decisiveness
#'
#' This function loads and returns a list of variables required for Lavaan analysis.
#'
#' @param data A data frame containing the required variables.
#' @param sample_name A character specifying the sample name.
#' @param factor_name A character specifying the competency name
#'
#' @return A list containing the following variables:
#' \item{competency_cols}{Vector of competency columns}
#' \item{competency_item_cols}{Vector of competency item columns}
#' \item{research_cols}{Vector of research columns}
#' \item{required_cols}{Vector of required columns}
#' \item{grouping_cols}{Vector of grouping columns}
#' \item{raters}{Vector of raters}
#' \item{column_pattern_for_analyses}{Pattern for Lavaan analyses}
#' \item{rowmeans_columns_list}{List of columns for row means}
#' \item{factor_name}{String specifying the factor name}
#' \item{show_model}{Logical indicating whether to show the Lavaan model}
#' \item{regex_pattern}{Logical indicating whether to use regex patterns}
#' \item{competency_cols_pattern}{Pattern for competency columns}
#' \item{competency_cols_with_factor_weights}{Pattern for competency columns with factor weights}
#' \item{columns_to_remove_missing_values}{Columns to remove missing values from}
#' \item{factor_weights_competency_cols}{Pattern for factor weights in competency columns}
#' \item{factor_weights_cols}{Pattern for factor weights columns}
#' \item{outcome_raters}{Pattern for outcome raters}
#' \item{outcome_colname}{Name of the outcome column}
#'
#' @examples
#' load_variables_decisive(data = my_data, sample_name = "Normative")
#'
#' @export
load_variables_decisive <- function(data=data.frame(), 
                                    factor_name=character()) {
  
  if (is.null(data)) {
    stop("Data is required")
  }
  
  variables <- load_global_variables(data = data)
  
  list(
    competency_cols = variables$competency_cols,
    competency_item_cols = variables$competency_item_cols,
    research_cols = variables$research_cols,
    required_cols = variables$required_cols,
    grouping_cols = variables$grouping_cols,
    raters = variables$raters,
    column_pattern_for_analyses = "ESI_Key|BMK_S1_34|BMK_S1_73|BMK_S1_77|BMK_S2_8|BMK_S2_13|BMK_S2_15|BMK_S2_19|BMK_S2_22|BMK_S2_17|BMK_S2_25|BMK_S2_35|BMK_S2_18|BMK_S2_21|BMK_S2_23|BMK_S2_28|BMK_S2_30|BMK_S2_34|BMK_S2_36|BMK_S2_6|BMK_S2_7|BMK_S2_12|BMK_S2_14|BMK_S2_10|BMK_S2_5|BMK_S2_16|BMK_S2_26|BMK_S2_24|BMK_S2_33|BMK_S2_2|BMK_S2_20|BMK_S2_27|BMK_S2_29|BMK_S2_31|BMK_S2_32|BMK_S2_3|BMK_S2_4|BMK_S2_1|BMK_S2_11|BMK_S2_9|BMK_S5_1|BMK_S5_2|BMK_S5_3|BMK_S5_4|BMK_S5_5|BMK_S5_6|BMK_S5_7|BMK_S5_8|BMK_S5_9",
    rowmeans_columns_list = list(
      c("BMK_S1_34_mean_Self", "BMK_S1_73_mean_Self", "BMK_S1_77_mean_Self"),
      c(
        "BMK_S1_34_mean_Direct_Report",
        "BMK_S1_73_mean_Direct_Report",
        "BMK_S1_77_mean_Direct_Report"
      ),
      c("BMK_S1_34_mean_Boss", "BMK_S1_73_mean_Boss", "BMK_S1_77_mean_Boss"),
      c("BMK_S1_34_mean_Peer", "BMK_S1_73_mean_Peer", "BMK_S1_77_mean_Peer"),
      c(
        "BMK_S1_34_mean_Direct_Report",
        "BMK_S1_73_mean_Direct_Report",
        "BMK_S1_77_mean_Direct_Report",
        "BMK_S1_34_mean_Boss",
        "BMK_S1_73_mean_Boss",
        "BMK_S1_77_mean_Boss",
        "BMK_S1_34_mean_Peer",
        "BMK_S1_73_mean_Peer",
        "BMK_S1_77_mean_Peer"
      ),
      c(
        "BMK_S1_34_mean_Self",
        "BMK_S1_73_mean_Self",
        "BMK_S1_77_mean_Self",
        "BMK_S1_34_mean_Direct_Report",
        "BMK_S1_73_mean_Direct_Report",
        "BMK_S1_77_mean_Direct_Report",
        "BMK_S1_34_mean_Boss",
        "BMK_S1_73_mean_Boss",
        "BMK_S1_77_mean_Boss",
        "BMK_S1_34_mean_Peer",
        "BMK_S1_73_mean_Peer",
        "BMK_S1_77_mean_Peer"
      )
    ),
    factor_name = factor_name,
    regex_pattern = TRUE,
    competency_cols_pattern = "BMK_S1_34|BMK_S1_73|BMK_S1_77",
    competency_cols_with_factor_weights = "BMK_S1_(34|73|77)(?!.*decisive).*",
    columns_to_remove_missing_values = "ESI_Key|BMK_S1_34|BMK_S1_73|BMK_S1_77",
    factor_weights_competency_cols = "\\w+_S1_(34|73|77)(?!.*decisive).*",
    factor_weights_cols = "\\w+_S1_(34|73|77)(.*decisive).",
    outcome_raters = "BMK_S5_1_mean_(?!Self)",
    outcome_colname = "BMK_S5_1_mean_all_rater"
  )
}
