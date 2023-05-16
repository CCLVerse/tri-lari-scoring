#' @title Get Factor Scoring Weights
#' @description Get the factor scoring weights from the lavaan output. 
#' 1- # Get factor scoring weights from the lavaan output
# 2- To reshape the factor weights data frame (so we can merge with raw item responses)
# 3- Merge the factor weights to the raw scores dataset above
# 4- Scale the result
#' @param fitted_values Lavaan's fitted values from lavPredict() method
#' @param which A non-empty character string specifying which attribute is to be accessed.
#' @return dataframe containing factor scoring weights in wide format. 
get_factor_scoring_weights <- function(df=data.frame(), fitted_values=matrix(), which=character()){

    factor_weights_decisiveness <- attr(fitted_values, which)

    factor_weights_decisiveness <- as.data.frame(factor_weights_decisiveness)

    factor_weights_decisiveness <- factor_weights_decisiveness %>% 
        tibble::rownames_to_column(., var="lv") %>% 
        tidyr::pivot_wider(.
                        , names_from = lv
                        , values_from = c(everything(), -lv))

    return(factor_weights_decisiveness)

}