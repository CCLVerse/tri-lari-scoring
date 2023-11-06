#' @title Store Value in Environment
#' @description
#'   A wrapper function to store any variable in the specified environment variable.
#'
#' @param variable The variable to save in the environment.
#' @param env Name of the environment variable.
#' @param name (optional) Name to save the variable in the environment.
#'
#' @return The variable is stored in the specified environment.
# 
#' @examples
#' # Example usage:
#' my_variable <- 42
#' my_environment <- new.env()
#' save_to_env(variable = my_variable, env = my_environment, name = "my_saved_variable")
# 
#' # The variable is stored in the specified environment as "my_saved_variable".
# 
#' @export
save_to_env <- function(variable=NULL, name=NULL, env=NULL){
  
    if (is.null(env)) {
      stop("env name is required.")
    }
    
    if (is.null(variable)) {
      stop("variable is required.")
    }
  
    if(!is.environment(env)){
        message("Creating the environment")
        env <- new.env(parent=parent.frame())

    }
    
    arg_name <- if (is.null(name)) deparse(substitute(variable)) else name
    
    message("Storing the dataframe in the new environment")
    assign(arg_name, variable, envir = env)

}
