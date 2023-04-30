#' @title Missing value counts and percentages
#' @description Compute the missing values and provide the result as table
#' @param df The dataframe to work with
#' @return A dataframe of missing counts and percentages
#' @export 
count_missing_values <- function(df=NULL){

    missing_count_df <- df %>%
        summarise(across(everything(), list(perc = ~mean(is.na(.)), 
                                            total = ~sum(is.na(.))))) %>% 
        t()

    missing_count_df <- missing_count_df %>%
        kable() %>% 
        kable_material_dark(bootstrap_options=c("responsive"), 
                            position = 'center', 
                            full_width=F)

    return(missing_count_df)

}