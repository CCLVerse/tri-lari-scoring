#' Render Data Processing R Markdown Document
#'
#' This function renders a data processing R Markdown document, processing
#' the provided data and generating an HTML output file.
#'
#' @param data A data frame containing the input data for processing.
#' @param sample_name A character string specifying the sample name (default is "Normative").
#' @param factor_name A character string specifying the factor name (default is "decisive").
#'
#' @details The function renders the R Markdown document located at "./src/01_bmk_data_processing.Rmd"
#' and saves the HTML output file in the "./output" directory. It passes various parameters to the
#' R Markdown document for customization.
#'
#' @param raters A vector specifying the column names representing raters in the input data.
#' @param grouping_cols A vector specifying the column names used for grouping in the data processing.
#' @param required_cols A vector specifying the column names required for data processing.
#' @param competency_item_cols A vector specifying the column names representing competency items in the data.
#' @param competency_cols A vector specifying the column names representing competency scores in the data.
#' @param research_cols A vector specifying the column names representing research-related information in the data.
#'
#' @seealso [rmarkdown::render()]
#'
#' @return The function renders the R Markdown document and does not return any value.
#'
#' @examples
#' \dontrun{
#' # Example usage
#' data <- read.csv("your_data.csv")
#' render_data_processing(data, sample_name = "Normative")
#' }
#'
#' @export
render_data_processing <- function(data=data.frame(), 
                                   raters=character(),
                                   factor_name="decisive",
                                   sample_name="Normative", 
                                   research_cols=character(),
                                   grouping_cols=character(),
                                   required_cols=character(), 
                                   competency_cols=character(),
                                   competency_item_cols=character()){
  
  output_filename <- sprintf("%s_%s_data_processing", tolower(sample_name), factor_name)
  
  ## process data
  rmarkdown::render(input = "/home/rstudio/workspace/src/01_bmk_data_processing.Rmd", 
                    output_dir = "/home/rstudio/workspace/output",
                    output_format = "html_document", 
                    output_file = output_filename,
                    params = list(
                      data = data, 
                      raters = raters, 
                      factor_name = factor_name,
                      research_cols = research_cols,
                      grouping_cols = grouping_cols,
                      required_cols = required_cols, 
                      competency_cols = competency_cols,
                      competency_item_cols = competency_item_cols
                    )
  )
  
}
