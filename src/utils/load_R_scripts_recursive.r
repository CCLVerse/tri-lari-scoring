#' Recursively load R scripts from a directory and its subdirectories.
#'
#' This function traverses a directory and its subdirectories to find and load
#' all R script files.
#'
#' @param directory The starting directory from which to begin the search.
#'
#' @return None (invisibly).
load_R_scripts_recursive <- function(directory) {
  
  # List all sub-directories
  subdirs <- list.dirs(directory, full.names = TRUE, recursive = FALSE)

  invisible(sapply(subdirs, function(x){
    files <- list.files(x, full.names = TRUE)
    
    # Load all R script files in the directory
    R_files <- files[grepl("\\.R|r$", files, ignore.case = TRUE)]
    
    if (length(R_files) > 0) {
      invisible(sapply(R_files, source))
    }
    
    # Recursively load R scripts from sub-directories
    load_R_scripts_recursive(x)
  }))

}
