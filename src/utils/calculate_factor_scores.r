#' @title Calculate Factor Scores
#' @description Computes the factor scores of the latent variables from the equation. 
#' @param df The dataframe used in calculation
#' @param factor_score_equations Equations used in calculation latent variables. 
#' @return dataframe with laten variables
#' @export 
calculate_factor_scores <- function(df=data.frame(), factor_score_equations=character()){

    validate_df(df)

    df <- lapply(names(factor_score_equations), function(name, eq) {

        result <- df %>% mutate(!!name := eval(parse(text=factor_score_equations[[name]])))

        }, factor_score_equations)

    return(df)
    
}