#' @title Get Factor Scoring Weights
#' @description 
#'   Get the factor scoring weights from the lavaan output and reshape the data frame. This allows merging with raw item responses and scaling the result.
#'      1- Get factor scoring weights from the lavaan output
#       2- To reshape the factor weights data frame (so we can merge with raw item responses)
#' @param fitted_values Lavaan's fitted values from lavPredict() method.
#' @param which A non-empty character string specifying which attribute is to be accessed.
#'
#' @return
#'   A dataframe containing factor scoring weights in wide format.
#'
#' @examples
#' # Example usage:
#' data <- read.csv("data.csv")
#' fitted_values <- lavaan::lavPredict(fitted_model)
#' factor_weights <- get_factor_scoring_weights(df = data, fitted_values = fitted_values, which = "your_attribute")
# 
#' # Get and reshape factor scoring weights from the lavaan output.
# 
#' @importFrom tibble rownames_to_column
#' @importFrom tidyr pivot_wider
get_factor_scoring_weights <- function(fitted_values=matrix(), which=character()){

    factor_weights_decisiveness <- attr(fitted_values, which)

    factor_weights_decisiveness <- as.data.frame(factor_weights_decisiveness)

    factor_weights_decisiveness <- factor_weights_decisiveness %>% 
        tibble::rownames_to_column(., var="lv") %>% 
        tidyr::pivot_wider(.
                        , names_from = lv
                        , values_from = c(everything(), -lv))

    return(factor_weights_decisiveness)

}