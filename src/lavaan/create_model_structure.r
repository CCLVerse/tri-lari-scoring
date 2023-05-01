#' @title Create model structure
#' @description Unwind model structure for factor model
#' @param factor_name Factor name to preceed the name in model.
#' @param suffix Suffix to add to the factor name in the model
#' @param items Items in additive format to add to the model
#' @return Model with structure a =~ b + c + d
create_model_structure <- function(factor_name, suffix, items){

    return(sprintf("%s_%s =~ %s ", factor_name, suffix, items))

}


#' @title Create model by rater
#' @description Create a part of the LARI model by rater type
#' @param column_name A vector of column names in the dataframe
#' @param rater A rater to search for the column name by them
#' @return A Lavaan model part
create_model_part_by_rater <- function(column_names, rater){

    rater_col <- column_names[grepl(paste0("*.", rater), column_names)] %>% 
                paste0(., collapse = " + ")

    return(rater_col)
}



#' @title Create Arena, Reputation model by rater
#' @description Creates model structure for arena and reputation by rater
#' @param column_names A character vector of column names to search for the ratings by raters
#' @param raters A character vector of raters
#' @param factor_name A name to added to the model 
#' @param suffix A suffix to identify the type of the model
#' @return model
create_ari_model_by_rater <- function(column_names, raters, factor_name, suffix) {

    model <- create_model_part_by_rater(column_names=column_names, rater=paste0("(", raters, ")", collapse="|"))

    model <- create_model_structure(factor_name=factor_name, suffix=suffix, items=model)

    return(model)


}