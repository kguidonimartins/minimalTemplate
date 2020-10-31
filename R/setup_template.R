#' Setup a new project template
#'
#' Setup and open a new projetc in RStudio
#'
#' @param project_name Name of the projetc
#'
#' @importFrom usethis create_project ui_info
#' @importFrom utils download.file
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
      ".github",
      "data",
      "manuscript",
      "output",
      "R",
      ".dockerignore",
      ".gitignore",
      ".Rbuildignore",
      ".Rprofile",
      ".travis.yml",
      "DESCRIPTION",
      "Dockerfile",
      "LICENSE.md",
      "main-script.Rmd",
      "Makefile",
      "README.md",
      "todo.txt"
    )

  # criar pastas
  for (i in seq_along(inst_files)) {
    file.copy(
      from = system.file(paste0("template/full/", inst_files[i]),
                         package = "minimalTemplate"),
      overwrite = TRUE,
      to = project_name,
      recursive = TRUE
    )
  }

  file_wanted <- paste0(project_name, "/.gitignore")
  URL_base <- "https://www.toptal.com/developers/gitignore/api/"
  type <- "r"
  URL_wanted <- paste0(URL_base, type)
  utils::download.file(url = URL_wanted, destfile = file_wanted, quiet = TRUE)
  write("tags", file = file_wanted, append = TRUE)
  write("*_files/", file = file_wanted, append = TRUE)

  usethis::ui_info("Please, follow the instructions in the 'todo.txt' file")

}
