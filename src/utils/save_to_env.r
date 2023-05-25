#' @title Store value to environment
#' @description A wrapper function to store any variable in the environment variable
#' @param variable The variable to save to the environment
#' @param env Name of the environment variable
#' @param name (optional) Name to save the variable in hte environment
#' @export
save_to_env <- function(variable=NULL, name=NULL, env=NULL){

    if(is.null(env) && is.na(env) && missing(env)){
        stop("env name is required.")
    }

    if(is.null(variable) && is.na(variable)){
        stop("variable is required.")
    }

    if(!exists(env)){
        message("Creating the environment")
        assign(env, new.env(), envir = parent.frame())

    }

    if(is.null(name) && is.na(name)){
        arg_name <- deparse(substitute(variable))
    } else {
        arg_name <- name
    }

    
    message("Storing the dataframe in the new environment")
    assign(arg_name, variable, envir = env)

}
