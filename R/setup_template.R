#' Setup a new project template
#'
#' Setup and open a new projetc in RStudio
#'
#' @param project_name Name of the projetc
#' 
#' @importFrom usethis create_project
#'
#' @return None
#' @export
#'
#' @examples
#' \dontrun{
#' setup_template(project_name = "my_new_project")
#' }
setup_template <- function(project_name) {

  # criar r project
  usethis::create_project(path = project_name,
                          rstudio = TRUE,
                          open = FALSE)

  inst_files <- c(
      ".gitignore",
      ".travis.yml",
      "data",
      "DESCRIPTION",
      "Dockerfile",
      "main-script.Rmd",
      "Makefile",
      "man",
      "manuscript",
      "output",
      "R",
      "README.md",
      "todo.txt"
    )

  # criar pastas
  for (i in seq_along(inst_files)) {
    file.copy(
      from = system.file(paste0("template/full/", inst_files[i]),
                         package = "minimalTemplate"),
      to = project_name,
      recursive = TRUE
    )
  }
 
}
