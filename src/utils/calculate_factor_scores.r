#' @title Calculate Factor Scores
#' @description
#'   Computes the factor scores of the latent variables from the given equations.
#'
#' @param df The dataframe used in the calculations.
#' @param factor_score_equations Equations used for calculating latent variables.
#'
#' @return Dataframe with latent variables.
# 
#' @examples
#' # Example usage:
#' data <- data.frame(X1 = c(1, 2, 3, 4, 5), X2 = c(2, 3, 4, 5, 6))
#' equations <- c("X1 + X2", "2 * X1 - X2")
#' result <- calculate_factor_scores(df = data, factor_score_equations = equations)
# 
#' # Computes factor scores using the provided equations and adds them as new columns.
# 
#' @importFrom purrr map_dfc
calculate_factor_scores <- function(df=data.frame(), factor_score_equations=character()){

    validate_df(df)

    edf <- purrr::map_dfc(factor_score_equations, ~ evaluate_function(df, .))

    df <- cbind(df, edf)

    return(df)
}



#' @title Evaluate Custom Expression
#' @description
#'   This function evaluates a custom expression using the provided dataframe as the environment.
#'
#' @param df The dataframe used as the environment for the evaluation.
#' @param eq The custom expression to evaluate.
#'
#' @return The result of the evaluation.
evaluate_function <- function(df, eq){
    result <- eval(parse(text=eq), envir=df)
    return(result)
}