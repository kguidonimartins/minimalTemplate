test_that("setup_template copy files", {
  wanted_template_files <- c(
    ".github",
    "data",
    "manuscript",
    "output",
    "R",
    "sources",
    ".dockerignore",
    ".gitignore",
    ".pre-commit-config.yaml",
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
