#' @title Missing value counts and percentages
#' @description Compute the missing values and provide the result as table
#' @param df The dataframe to work with
#' @return A dataframe of missing counts and percentages
#' @export 
count_missing_values <- function(df=data.frame()){

    validate_df(df)

    
    missing_count_df <- data.frame( 
        Percentage = sapply(df, function(x) paste0(round(mean(is.na(x)),2)*100,"%")),
        Total = sapply(df, function(x) round(sum(is.na(x)),2))) %>% 
        rownames_to_column(var='Variables') %>% 
        arrange(desc(Total))

    missing_count_df <- missing_count_df %>%
        kable() %>% 
        kable_material_dark(
            bootstrap_options=c("responsive"), 
            position = 'center', full_width=F)

    return(missing_count_df)

}