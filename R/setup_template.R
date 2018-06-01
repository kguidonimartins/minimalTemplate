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
  
  # criar pastas
  file.copy(
    from = system.file("template/full/data", package = "minimalTemplate"),
    to = name,
    recursive = TRUE
  )
  file.copy(
    from = system.file("template/full/manuscript", package = "minimalTemplate"),
    to = name,
    recursive = TRUE
  )
  file.copy(
    from = system.file("template/full/output", package = "minimalTemplate"),
    to = name,
    recursive = TRUE
  )
  file.copy(
    from = system.file("template/full/main-script.Rmd", package = "minimalTemplate"),
    to = name,
    recursive = TRUE
  )
  
}

