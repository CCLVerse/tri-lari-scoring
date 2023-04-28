#' @title Set Demographic Columns
#' @description Set demographic column names to use in analyses
#' @param columns Columns to use in the demographic columns
set_demo_cols <- function(columns=NULL) {

    if(is.null(columns) && is.na(columns)){
        stop("The demographic column names are required. They must exist in the data.")
    }

    assign("demo_cols", columns, envir=lari_env)
}