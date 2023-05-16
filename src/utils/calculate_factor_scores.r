#' @title Calculate Factor Scores
#' @description Computes the factor scores of the latent variables from the equation. 
#' @param df The dataframe used in calculation
#' @param factor_score_equations Equations used in calculation latent variables. 
#' @return dataframe with laten variables
#' @export 
calculate_factor_scores <- function(df=data.frame(), factor_score_equations=character()){

    validate_df(df)

    df <- purrr::map_dfc(factor_score_equations, ~ evaluate_function(df, .))


    return(df)
}


evaluate_function <- function(df, eq){
    result <- eval(parse(text=eq), envir=df)
    return(result)
}