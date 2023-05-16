#' @title Fit the model
#' @description Fit the model based on the type and the model provided.  
#' @param df Dataframe to work with
#' @param model A character model with latent variables that lavaan requires. See `https://www.lavaan.ugent.be` for more details. 
lavaan_model_fit <- function(df=data.frame(), model=as.character()){

    validate_df(df)

    if(!is.character(model)){
        stop("Model doesn't seem to be proper format.")
    }


    ## Oblique fit
    oblique.fit <- lavaan::cfa(model, data=df)
    oblique.summary <- get_fit_summary(fit=oblique.fit)
    oblique.fitted <- lavaan::lavPredict(oblique.fit, fsm=TRUE, method="regression")

    oblique <- list(fit=oblique.fit, 
                    summary=oblique.summary,
                    fitted=oblique.fitted)

    ## orthogonal fit
    ortho.fit <- lavaan::cfa(model, data=df, orthogonal=TRUE)
    ortho.summary <- get_fit_summary(fit=ortho.fit)
    ortho.fitted <- lavaan::lavPredict(ortho.fit, fsm=TRUE, method="regression")

    print(ortho.fitted)

    orthogonal <- list(fit=ortho.fit, 
                       summary=ortho.summary, 
                       fitted=ortho.fitted)

    return(list(oblique=oblique, orthogonal=orthogonal))
}


#' @title Fit Summary
#' @description Get the summary of the fit
#' @param fit The model fit from lavaan
#' 
get_fit_summary <- function(fit=NULL){
    
    if(is.null(fit) && is.na(fit)){
        stop("Model fit is required.")
    }
    s <- lavaan::summary(fit, fit.measures = TRUE)

    return(s)
}