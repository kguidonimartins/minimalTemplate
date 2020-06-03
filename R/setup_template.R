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
#' \dontrun{
#' setup_template(name = "my_new_project")
#' }
setup_template <- function(name) {

  # criar r project
  usethis::create_project(path = name,
                          rstudio = FALSE)

  inst_files <- c(
      ".atom",
      ".ctagsignore",
      ".github",
      ".gitignore",
      ".session.vim",
      ".tmuxinator.yml",
      "data",
      "main-script.Rmd",
      "Makefile",
      "manuscript",
      "NOTES.md",
      "output",
      "R",
      "README.md",
      "tags",
      "todo.txt"
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
