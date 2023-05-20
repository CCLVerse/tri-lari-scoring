#' @title Wrappe for Fitting Linear Models
#' @description linear_model is used for fitting linear models to carry out regression. It is a wrapper for the `lm` function. 
#' @param formula A symbolic description of the model to be fitted. 
#' @param df Dataframe or list containing the variables in the model. 
#' @param ... additional arguments
#' @return The model response and the summary based on lm.beta as a list
#' @export 
linear_model <- function(formula, df, ...){

    validate_df(df)

    formula <- as.formula(formula)

    res <- lm(formula, df, ...)

    summary <- summary(lm.beta::lm.beta(res))

    result <- list(model=res
                 , summary=summary)

    return(result)

}