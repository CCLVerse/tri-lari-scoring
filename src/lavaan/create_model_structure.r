#' @title Create Model Structure
#' @description
#'   Generate a model structure for a factor model by combining a factor name, suffix, and a list of items.
#'
#' @param factor_name Factor name to be included in the model.
#' @param suffix Suffix to add to the factor name in the model.
#' @param items Items to be added to the model in additive format.
#'
#' @return
#'   A model structure in the form: "factor_name_suffix =~ item1 + item2 + item3"
#'
#' @export
#'
#' @examples
#' # Example usage:
#' factor_structure <- create_model_structure(factor_name = "Factor1", suffix = "LV", items = c("Item1", "Item2", "Item3"))
# 
#' Generates the model structure for the specified factor name and items.
create_model_structure <- function(factor_name, suffix, items){

    return(sprintf("%s_%s =~ %s ", factor_name, suffix, items))

}





#' @title Create Model Part by Rater
#' @description
#'   Create a part of the LARI model based on a specific rater type. This function generates a portion of the Lavaan model
#'   by selecting the columns corresponding to the given rater from a vector of column names.
#'
#' @param column_names A character vector of column names in the dataframe.
#' @param rater A specific rater to filter the column names.
#'
#' @return A character string representing a part of the Lavaan model.
#'
#' @examples
#' # Example usage:
#' column_names <- c("Item.Self1", "Item.Peer1", "Item.Boss1", "Item.Self2", "Item.Peer2", "Item.Boss2")
#' rater_part <- create_model_part_by_rater(column_names, rater = "Peer")
# 
#' # Generates the Lavaan model part for the "Peer" rater type.
# 
#' @importFrom dplyr
create_model_part_by_rater <- function(column_names, rater){
  
    rater_col <- column_names[grepl(paste0("*.", rater),
                              column_names)] %>% 
                paste0(., collapse = " + ")
    
    return(rater_col)
}



#' @title Create Arena or Reputation Model by Rater
#' @description
#'   Create a model structure for Arena or Reputation by rater type. This function generates a Lavaan model structure
#'   based on specific raters and factor name.
#'
#' @param column_names A character vector of column names in the dataframe.
#' @param raters A character vector of raters to consider in the model.
#' @param factor_name A name to be added to the model.
#' @param suffix A suffix to identify the type of the model ("arena" or "reputation").
#'
#' @return A character string representing the Lavaan model structure.
#'
#' @examples
#' # Example usage for creating an Arena model structure:
#' column_names <- c("Item.Self1", "Item.Peer1", "Item.Boss1", "Item.Self2", "Item.Peer2", "Item.Boss2")
#' arena_model <- create_ari_model_by_rater(column_names, raters = c("Peer", "Boss"), factor_name = "Arena", suffix = "arena")
# 
#' # Generates the Lavaan model structure for the "Arena" model.
# 
# # Example usage for creating a Reputation model structure:
# reputation_model <- create_ari_model_by_rater(column_names, raters = c("DirectReport", "Peer", "Boss"), factor_name = "Reputation", suffix = "reputation")
# 
# # Generates the Lavaan model structure for the "Reputation" model.
# 
#' @importFrom dplyr
create_ari_model_by_rater <- function(column_names, raters, factor_name, suffix) {

    if(suffix == "reputation"){
        raters <- raters[raters != 'Self']
    }

    model <- create_model_part_by_rater(column_names=column_names, rater=paste0("(", raters, ")", collapse="|"))
    
    model <- create_model_structure(factor_name=factor_name, suffix=suffix, items=model)
    
    return(unlist(model))


}