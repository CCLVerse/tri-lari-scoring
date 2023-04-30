#' @title Set current dataframe 
#' @description The function sets the current dataframe to be used by codes. This saves time for updating the codes that uses the current dataframe. 
#' @param df The dataframe to set as the current dataframe
#' @return NULL
set_current_df <- function(df=NULL){
    validate_df(df)

    if(!exists("lari_env")){
        message("Creating lari_env environment")
        lari_env <<- new.env()
    }

    message("Storing the dataframe in the new environment")
    assign("current_df", df, envir = lari_env)
}


#' @title Get current dataframe
#' @description The function retrieves the current dataframe to be used by codes. 
#' @return The current dataframe
#' @export 
get_current_df <- function(){

    return(lari_env[["current_df"]])
}