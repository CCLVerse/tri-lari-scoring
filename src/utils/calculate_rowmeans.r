#' @title Calculate Column Row Means
#' @description
#'   Function to calculate the row means for the given columns. The column means will be saved in the column names provided.
#'
#' @param df Dataframe that contains the columns.
#' @param new_cols A character vector of the new column names.
#' @param mean_cols A list of character vectors of column names corresponding to the new_cols for calculating the row means.
#'
#' @return Dataframe with new columns of row means.
# 
#' @examples
#' # Example usage:
#' data <- data.frame(Age = c(30, 40, 35, 45, 50), Salary = c(50000, 60000, 55000, 70000, 75000))
#' new_columns <- c("Age_Mean", "Salary_Mean")
#' columns_to_mean <- list(c("Age"), c("Salary"))
#' result <- calculate_rowmeans(df = data, new_cols = new_columns, mean_cols = columns_to_mean)
# 
#' # Computes row means for the specified columns and adds them as new columns.
# 
#' @importFrom dplyr mutate
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