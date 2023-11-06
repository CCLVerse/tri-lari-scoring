#' @title Wrapper for Fitting Linear Models
#' @description
#'   linear_model is used for fitting linear models to carry out regression. It is a wrapper for the 'lm' function.
#'
#' @param formula A symbolic description of the model to be fitted.
#' @param df Dataframe or list containing the variables in the model.
#' @param ... Additional arguments.
#'
#' @return A list containing the model response and summary based on lm.beta.
# 
#' @examples
#' # Example usage:
#' my_data <- data.frame(Y = c(1, 2, 3, 4, 5), X1 = c(2, 3, 4, 5, 6), X2 = c(3, 4, 5, 6, 7))
#' formula <- Y ~ X1 + X2
#' result <- linear_model(formula = formula, df = my_data)
# 
#' # The result is a list containing the model response and summary.
# 
#' @importFrom stats lm
#' @importFrom lm.beta lm.beta
linear_model <- function(formula, df, ...){

    validate_df(df)

    formula <- as.formula(formula)

    res <- lm(formula, df, ...)

    summary <- summary(lm.beta::lm.beta(res))

    result <- list(model=res
                 , summary=summary)

    return(result)

}