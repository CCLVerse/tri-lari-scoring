#' @title Lavaan Analyses Wrapper
#' @description Wrapper function for lavaan analyses. This will perform all tasks by calling this function
#' @export
lavaan_analyses_wrapper <- function(df=data.frame()){

    validate_df(df=df)

    ## get the name of the variable
    df_name <- deparse(substitute(df))

    factor_name <- "decisive"

    ## Perform Lavaan Analysis in two ways: 
    ## 1. First order
    ## 2. Bifactor
    ## where each model will compute obliqu and orthogonal fit. If the model doesn't converge, it may generate a warning but it can be ignored. 


    # First Order model
    first_level <- build_first_level_model(competency_cols="BMK_S1_34|BMK_S1_73|BMK_S1_77"
                                     , df=df
                                     , factor_name="decisive"
                                     , raters=raters
                                     , regex_pattern = TRUE)


    ## get the fit, summmary, and fitted values for oblique and orthogonal models
    fits <- lavaan_model_fit(df=df, model=first_level)

    ## save the variable to the environment variable
    save_to_env(variable=fits, env=lari_env)


    # Bifactor model
    bifactor <- build_bifactor_model( competency_cols="BMK_S1_34|BMK_S1_73|BMK_S1_77"
                                , df=df
                                , factor_name="decisive"
                                , raters=raters
                                , regex_pattern = TRUE)

    ## get the fit, summary, and fitted values for oblique and orthogonal models
    bifactor_fits <- lavaan_model_fit(df=df, model=bifactor)

    ## save the variable to the environment variable
    save_to_env(variable=bifactor_fits, env=lari_env)


    ## only select the important columns for the analyses
    ## remove missing values for the competency columns
    df <- df %>% 
        select(matches(
            "ESI_Key|BMK_S(1.*(34|73|77).*|[25]_\\d{1,2}_.)"
            )) %>%
        remove_missing_from_competency(df=., 
                            , column_names="ESI_Key|BMK_S1_34|BMK_S1_73|BMK_S1_77"
                            , regex_pattern=TRUE)


    ## Compute factor weights
    factor_weights_competency <- get_factor_scoring_weights(df=df
                                  , fitted_values=bifactor_fits$orthogonal$fitted
                                  , which="fsm")

    ## save the variable to the environment variable
    save_to_env(variable=factor_weights_competency, env=lari_env)


    ## merge the factor weights with the raw item responses
    df <- df %>% 
        dplyr::bind_cols(factor_weights_competency) %>%
        as.data.frame()

    ## save the variable to the environment variable
    save_to_env(variable=df, name=df_name, env=lari_env)


    df_merged <-  scale_and_center_columns(df=df
                              , column_names = colnames(factor_weights_competency)
                              , center = FALSE)

    
    ## generate factor scores 
    factor_score_equations <- generate_factor_scores(df=df_merged
                      , competency_cols = "\\w+_S1_(34|73|77)(?!.*decisive).*"
                      , factor_weights_cols = "\\w+_S1_(34|73|77)(.*decisive)."
                      , factor_name = "decisive"
                      , latent_variables=c("Self", "Direct_Report", "Boss", 
                                  "Peer", "arena", "reputation")
                      , regex_pattern = TRUE
                      , suffix = "LV")

    ## save the variable to the environment variable
    save_to_env(variable=factor_score_equations, env=lari_env)


    ## compute the scores
    df_merged <- calculate_factor_scores(df=df_merged
                                        , factor_score_equations = factor_score_equations)
    


    ## compute correlation
    compute_correlation(df=df_merged
                        , x = c(raters, "arena", "reputation")
                        , y = bifactor_fits$orthogonal$fitted
                        , suffix = "LV")


    return(df_merged)
    
}


