#' @title Get Demographic Columns
#' @description Get demographic column names to use in analyses
#' @return A character vector of demographic column names
get_demo_cols <- function(){

    if(!exists("demo_cols", envir=lari_env)){
        stop("Demographic columns are not yet set. Are you sure you ran `set_demo_cols` to assign demographic variables?")
    }


    return(lari_env$demo_cols)

}