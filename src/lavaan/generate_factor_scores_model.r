#' @title Create Factor Scores Model
#' @description
#'   Create factor scores by weighting or summing the item responses using relevant factor scoring weights.
#'
#' @param df Dataframe to work with.
#' @param competency_cols Columns belonging to the competency.
#' @param factor_weights_cols Columns with factor weights.
#' @param factor_name The name of the competency or the name of the factor.
#' @param regex_pattern Boolean value to indicate whether the column names are regex patterns or explicit column names.
#'
#' @return
#'   Equations with all column names required to calculate the latent variable. The returned datatype is a character.
#'
#' @export
#' 
#' @examples
#' # Example usage:
#' data <- read.csv("data.csv")
#' factor_model <- create_factor_scores_model(df = data, competency_cols = c("Competency1", "Competency2"), factor_weights_cols = c("Weight1_Factor1", "Weight2_Factor1"), factor_name = "Factor1", regex_pattern = TRUE)
# 
#' # Generate factor scoring equations for the specified columns.
# 
create_factor_scores_model <- function(df=data.frame(), competency_cols=character(), factor_weights_cols=character(),
factor_name=character(), regex_pattern=FALSE){
    if(regex_pattern){
        competency_cols <- get_column_names(df=df, pattern=competency_cols)

        factor_weights_cols <- get_column_names(df=df, pattern=factor_weights_cols)
    }

    validate_cols(df, competency_cols)

    # Extract the factor weights column vector before the word "decisive"
    factor_weight_prefix <- sub(sprintf("_%s.*", factor_name), "", factor_weights_cols)

    # Find the indices of matching prefixes
    match_idx <- match(competency_cols, factor_weight_prefix)

    # Concatenate the matching strings with " * "
    result <- paste0(
        competency_cols[!is.na(match_idx)], 
        " * ", 
        factor_weights_cols[match_idx[!is.na(match_idx)]]
    )

    # Join all strings with " + "
    result <- paste(result, collapse = " + ")

    return(result)
}






#' @title Generate Factor Scores
#' @description
#'   Generates factor scores for all components of the LARI model. This function creates factor scores for the specified latent variables, which can be useful in various analyses.
#'
#' @param df Dataframe to work with.
#' @param competency_cols Columns belonging to the competency.
#' @param factor_weights_cols Columns with factor weights.
#' @param factor_name The name of the competency or the name of the factor.
#' @param latent_variables Character vector of latent variable names used in naming columns with factor_weights.
#' @param regex_pattern Boolean value to indicate if the column names are regex patterns or explicit column names.
#' @param suffix Suffix to use when renaming the columns.
#'
#' @return
#'   A list of dataframes containing factor scores for each specified latent variable.
#'
#' @details
#'   This function generates factor scores for each specified latent variable. It iteratively creates factor scores models for the given latent variables and stores the results in a list. These factor scores can be used for further analyses.
#'
#' @export
#' 
#' @examples
#' # Example usage:
#' data <- read.csv("data.csv")
#' latent_vars <- c("LV1", "LV2", "LV3")
#' factor_scores <- generate_factor_scores(df = data, competency_cols = c("Competency1", "Competency2"), factor_weights_cols = c("FW1", "FW2", "FW3"), factor_name = "Factor1", latent_variables = latent_vars, regex_pattern = TRUE)
# 
#' # Generate factor scores for specified latent variables.
# 
#' @importFrom purrr setNames
#' @importFrom dplyr
generate_factor_scores <- function(df=data.frame(), competency_cols=character(), factor_weights_cols=character(), latent_variables=character(), factor_name=character(), regex_pattern=FALSE, suffix="LV"){

    latent_variables <- clean_raters(latent_variables)

    latent_variable_names <- sprintf("%s_%s", latent_variables, suffix)
    log4r::info(report, sprintf("[*,02] suffix: %s", latent_variable_names))
    

    result <- invisible(
        lapply(latent_variables, function(x) {
            create_factor_scores_model(df=df
            , competency_cols = competency_cols
            , factor_weights_cols = sprintf("%s%s", factor_weights_cols,x)
            , factor_name = factor_name
            , regex_pattern = regex_pattern)
        
        }) %>% 
        setNames(latent_variable_names)
    )

    return(result)

}