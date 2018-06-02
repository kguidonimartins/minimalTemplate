#' Setup a new project template
#' 
#' Setup and open a new projetc in RStudio
#'
#' @param name Name of the projetc
#'
#' @return None
#' @export
#'
#' @examples
#' setup_template("my_new_project")
setup_template <- function(name) {
  
  # criar r project
  usethis::create_project(path = name,
                          rstudio = TRUE,
                          open = TRUE)
  
  inst_files <- c("data", 
                  "manuscript", 
                  "output", 
                  "main-script.Rmd")
  
  # criar pastas

  for (i in seq_along(inst_files)) {
    file.copy(
      from = system.file(paste0("template/full/", inst_files[i]), 
                         package = "minimalTemplate"),
      to = name,
      recursive = TRUE
    )
  }
}