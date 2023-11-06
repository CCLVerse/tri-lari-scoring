#' @title Set current dataframe 
#' @description The function sets the current dataframe to be used by codes. This saves time for updating the codes that uses the current dataframe. 
#' @param df The dataframe to set as the current dataframe
#' @return NULL
set_current_df <- function(df=NULL){
    
    validate_df(df)

    save_to_env(variable=df, name="current_df", env="lari_env")

}


#' @title Get current dataframe
#' @description The function retrieves the current dataframe to be used by codes. 
#' @return The current dataframe
#' @export 
get_current_df <- function(){

    return(lari_env[["current_df"]])
}