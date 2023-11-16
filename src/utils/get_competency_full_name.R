#' Get the full name corresponding to a competency value.
#'
#' This function takes a competency value and returns its corresponding full name.
#' If the competency value is not found, it returns NULL.
#'
#' @param value A character string representing a competency value.
#' @return A character string representing the full name of the competency, or NULL if not found.
#' @examples
#' \dontrun{
#' get_competency_full_name("strategic") # Returns "Strategic perspective"
#' get_competency_full_name("quick")     # Returns "Being a quick study"
#' }
#'
#' @export
get_competency_full_name <- function(value) {
  
  # Define a vector with competency values and their corresponding full names
  full_names <- c(
    "strategic" = "Strategic Perspective", 
    "quick" = "Being a Quick Study", 
    "decisive" = "Decisiveness", 
    "change" = "Change Management", 
    "leading" = "Leading Employees", 
    "confront" = "Confronting Problem Employees", 
    "participative" = "Participative Management", 
    "build" = "Building Collaborative Relationships", 
    "compassion" = "Compassion and Sensitivity", 
    "putting" = "Putting People at Ease", 
    "respect" = "Respect for Differences", 
    "taking" = "Taking Initiative", 
    "composure" = "Composure", 
    "balance" = "Balance Between Personal and Work Life", 
    "selfaware" = "Self-Awareness", 
    "career" = "Career Management"
  )
  
  # Use match to find the index of the competency value in the names of the vector
  # Return the corresponding full name or NULL if not found
  return(full_names[match(value, names(full_names))])
}
