#' Setup a new project template
#' 
#' Setup and open a new projetc in RStudio
#'
#' @param name Name of the projetc
#' @param open If the new must be open in a new RStudio session
#'
#' @return None
#' @export
#'
#' @examples
#' \dontrun{
#' setup_template(name = "my_new_project", open = FALSE)
#' }
setup_template <- function(name, open = TRUE) {
  
  # criar r project
  usethis::create_project(path = name,
                          rstudio = TRUE,
                          open = open)
  
  inst_files <- c(
      ".atom",
      ".github",
      "data",
      "manuscript",
      "output",
      "R",
      ".gitignore",
      "main-script.Rmd",
      "Makefile",
      "README.md"
    )

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
