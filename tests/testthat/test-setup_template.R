test_that("system have files", {
  wanted_template_files <- c(
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
  shipped_template_files <-
    list.files(path = system.file("template/full", package = "minimalTemplate"), all.files = TRUE)[-c(1,2)]
  expect_equivalent(sort(wanted_template_files), sort(shipped_template_files))
})

test_that("setup_template copy files", {
  wanted_template_files <- c(
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
    "todo.txt",
    "teste-setup-template.Rproj"
  )
  new_project <- file.path(tempdir(), "teste-setup-template")
  setup_template(project_name = new_project)
  shipped_template_files <-
    list.files(path = new_project, all.files = TRUE)[-c(1,2)]
  expect_equivalent(sort(wanted_template_files), sort(shipped_template_files))
})
