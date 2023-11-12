#' Render Lavaan Analyses R Markdown Document
#'
#' This function renders a lavaan analyses R Markdown document, generating an HTML output file
#' with specified parameters for analysis and presentation.
#'
#' @param factor_name A character string specifying the factor name for the analyses (default is "decisive").
#' @param sample_name A character string specifying the sample name for the analyses (default is "Normative").
#' @param show_model A logical value indicating whether to include the lavaan model in the output (default is TRUE).
#' @param column_pattern_for_analyses A character string specifying a pattern for columns to include in the analyses (default is an empty string).
#' @param competency_cols A character string specifying a regular expression pattern for competency columns in the data.
#' @param competency_cols_with_factor_weights A character string specifying a regular expression pattern for competency columns with factor weights.
#' @param columns_to_remove_missing_values A character string specifying a regular expression pattern for columns to remove missing values.
#' @param factor_weights_competency_cols A character string specifying a regular expression pattern for factor weights related to competency columns.
#' @param factor_weights_cols A character string specifying a regular expression pattern for factor weights columns.
#' @param outcome_raters A character string specifying a regular expression pattern for outcome raters.
#' @param outcome_colname A character string specifying the column name for outcome measures.
#'
#' @details The function renders the R Markdown document located at "./src/02_bmk_lavaan_analyses.Rmd"
#' and saves the HTML output file in the "./output" directory. It passes various parameters to the
#' R Markdown document for customization.
#'
#' @seealso [rmarkdown::render()]
#'
#' @return The function renders the R Markdown document and does not return any value.
#'
#' @examples
#' \dontrun{
#' # Example usage
#' render_lavaan_analyses(factor_name = "factor1", sample_name = "CustomSample", show_model = TRUE)
#' }


render_lavaan_analyses <- function(factor_name="decisive", 
                                   sample_name="Normative", 
                                   show_model=TRUE,
                                   regex_pattern=TRUE,
                                   rowmeans_columns_list=as.list(),
                                   column_pattern_for_analyses="",
                                   competency_cols="BMK_S1_34|BMK_S1_73|BMK_S1_77",
                                   competency_cols_with_factor_weights="BMK_S1_(34|73|77)(?!.*decisive).*", 
                                   columns_to_remove_missing_values="ESI_Key|BMK_S1_34|BMK_S1_73|BMK_S1_77",
                                   factor_weights_competency_cols="\\w+_S1_(34|73|77)(?!.*decisive).*", 
                                   factor_weights_cols="\\w+_S1_(34|73|77)(.*decisive).",
                                   outcome_raters="BMK_S5_1_mean_(?!Self)",
                                   outcome_colname="BMK_S5_1_mean_all_rater"){
  
  title <- sprintf("Lavaan TRI<span style='color:gold;'>/</span>LARI Analyses for %s (%s Sample)", 
                   stringi::stri_trans_totitle(factor_name),  
                   stringi::stri_trans_totitle(sample_name))
  
  output_file <- sprintf("%s_%s_lavaan", tolower(sample_name), factor_name)
  
  rmarkdown::render(input = "/home/rstudio/workspace/src/02_bmk_lavaan_analyses.Rmd", 
                    output_dir = "/home/rstudio/workspace/output", 
                    output_format = "html_document",
                    output_file = output_file,
                    params = list(
                      title = title,
                      data = avg_scores_by_rater_df,
                      competency_cols = competency_cols,
                      competency_cols_with_factor_weights = competency_cols_with_factor_weights,
                      factor_name = factor_name,
                      raters = raters, 
                      regex_pattern = regex_pattern,
                      sample_name = sample_name,
                      rowmeans_columns_list=rowmeans_columns_list,
                      show_model = show_model, 
                      columns_for_analyses = column_pattern_for_analyses,
                      columns_to_remove_missing_values = columns_to_remove_missing_values, 
                      factor_weights_competency_cols = factor_weights_competency_cols, 
                      factor_weights_cols = factor_weights_cols,
                      outcome_raters = outcome_raters,
                      outcome_colname = outcome_colname
                    ))
}
