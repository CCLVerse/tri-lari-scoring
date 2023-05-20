#' @title Calculate Column Row Means
#' @description Function to calcualte the row means for the given columns. The column means will be saved in the column name provided. 
#' @param df Dataframe that contains the columns
#' @param new_cols A character vector of the new column names. 
#' @param mean_cols A list of character vector of column names corresponding to the new_cols for calculating the row means. 
#' @return Dataframe with new columns of row means
#' @export 
calculate_rowmeans <- function(df=data.frame(), new_cols=character(), mean_cols=character()){

    validate_df(df=df)
    
    sapply(mean_cols, function(cols){
        validate_cols(df=df, columns=cols)
    })

    means <- sapply(mean_cols, function(cols){
        rowMeans(df[, cols], na.rm=TRUE)
    })
    
    df[new_cols] <- means

    return(df)

}