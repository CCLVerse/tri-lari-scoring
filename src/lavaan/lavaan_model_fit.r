#' @title Fit the Model
#' @description
#'   Fit the model based on the type and the model provided.
#'
#' @param df Dataframe to work with.
#' @param model A character model with latent variables that lavaan requires. See `https://www.lavaan.ugent.be` for more details.
#'
#' @return
#'   A list containing two fit results: one for the oblique fit and one for the orthogonal fit.
#   Each fit result includes a model fit, a summary of the fit, and fitted values.
# 
#' @examples
#' # Example usage:
#' data <- read.csv("data.csv")
#' model <- 'a =~ b + c
#'           d =~ e + f'
#' 
#' fit_results <- lavaan_model_fit(df = data, model = model)
# 
#' # Fits the specified model using both oblique and orthogonal methods.
# 
#' @importFrom lavaan cfa lavPredict
lavaan_model_fit <- function(df=data.frame(), model=as.character()){

    validate_df(df)

    if(!is.character(model)){
        stop("Model doesn't seem to be proper format.")
    }

    log4r::info(report, "[*,lavaan fit] oblique fit")
    ## Oblique fit
    oblique.fit <- lavaan::cfa(model, data=df)
    oblique.summary <- get_fit_summary(fit=oblique.fit)
    oblique.fitted <- lavaan::lavPredict(oblique.fit, fsm=TRUE, method="regression")

    oblique <- list(fit=oblique.fit, 
                    summary=oblique.summary,
                    fitted=oblique.fitted)

    log4r::info(report, "[*, lavaan fit] orthogonal fit")
    ## orthogonal fit
    ortho.fit <- lavaan::cfa(model, data=df, orthogonal=TRUE)
    ortho.summary <- get_fit_summary(fit=ortho.fit)
    ortho.fitted <- lavaan::lavPredict(ortho.fit, fsm=TRUE, method="regression")

    orthogonal <- list(fit=ortho.fit, 
                       summary=ortho.summary, 
                       fitted=ortho.fitted)

    return(list(oblique=oblique, orthogonal=orthogonal))
}


#' @title Get Fit Summary
#' @description
#'   Get the summary of the model fit.
#'
#' @param fit The model fit from lavaan.
#'
#' @return A summary of the model fit.
# 
#' @examples
#' # Example usage:
#' model_fit <- lavaan::sem(model, data = data)
#' summary <- get_fit_summary(fit = model_fit)
# 
#' # Gets the summary of the model fit using lavaan.
# 
#' @importFrom lavaan summary
get_fit_summary <- function(fit=NULL){
    
    if(is.null(fit) && is.na(fit)){
        stop("Model fit is required.")
    }
    
    log4r::info(report, "[*, get fit summary] Get sumary fit")
    s <- lavaan::summary(fit, fit.measures = TRUE)

    return(s)
}