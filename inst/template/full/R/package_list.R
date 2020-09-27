ipak <- function(pkg_list, force_cran = FALSE, force_github = FALSE) {
  pkg_list <- unique(pkg_list)

  has_tidy <- grepl(pattern = "tidyverse", x = pkg_list)

  if (sum(has_tidy) >= 1) {
    pkg_list <- pkg_list[!pkg_list %in% "tidyverse"]
    pkg_list <- c(pkg_list, c("ggplot2", "tibble", "tidyr", "readr", "purrr", "dplyr", "stringr", "forcats"))
  }

  pkg_list_github <- pkg_list[grep(pattern = "/", x = pkg_list)]
  pkg_list_cran <- pkg_list[!pkg_list %in% pkg_list_github]

  new_pkg_github <- basename(pkg_list_github)[!(basename(pkg_list) %in% utils::installed.packages()[, "Package"])]
  new_pkg_cran <- pkg_list_cran[!(pkg_list_cran %in% utils::installed.packages()[, "Package"])]

  install_gh <- function(new_pkg_github, force = FALSE) {
    remotes::install_github(new_pkg_github, dependencies = TRUE, force = force)
  }

  install_cran <- function(new_pkg_cran) {
    utils::install.packages(new_pkg_cran, dependencies = TRUE, repos = "https://cloud.r-project.org")
  }

  if (force_github) {
    install_gh(pkg_list_github, force = TRUE)
  }

  if (force_cran) {
    install_cran(pkg_list_cran)
  }

  if (length(new_pkg_github)) {
    new_pkg_github_to_install <- pkg_list_github[grep(pattern = new_pkg_github, x = pkg_list_github)]
    install_gh(new_pkg_github_to_install, force = FALSE)
  }

  if (length(new_pkg_cran)) {
    install_cran(new_pkg_cran)
  }

  # load packages
  suppressMessages({
    invisible({
      install_message <- sapply(X = basename(pkg_list), FUN = require, quietly = TRUE, character.only = TRUE, USE.NAMES = TRUE)
    })
  })
}

package_list <-
  c(
    "bibtex",
    "broom",
    "captioner",
    "conflicted",
    "cowplot",
    "crayon",
    "dplyr",
    "forcats",
    "fs",
    "ggplot2",
    "ggsn",
    "glue",
    "grid",
    "gridExtra",
    "here",
    "knitr",
    "magick",
    "purrr",
    "RColorBrewer",
    "readr",
    "rmarkdown",
    "sf",
    "stringr",
    "tibble",
    "tidyr",
    "tiff",
    "usethis",
    "vegan"
  )

ipak(package_list)

write.bib(package_list, here::here("manuscript", "sources", "packages.bib"))

prefer <- function(pkg_name, quiet = TRUE) {
  for (pkg in seq_along(pkg_name)) {
    for (func in getNamespaceExports(pkg_name[pkg])) {
      conflicted::conflict_prefer(name = func, winner = pkg_name[pkg], quiet = quiet)
    }
  }
}

update_description <- function(pkg_list) {
  has_tidy <- grepl(pattern = "tidyverse", x = pkg_list)

  if (sum(has_tidy) >= 1) {
    pkg_list <- pkg_list[!pkg_list %in% "tidyverse"]
    pkg_list <- c(pkg_list, c("ggplot2", "tibble", "tidyr", "readr", "purrr", "dplyr", "stringr", "forcats"))
  }

  pkg_list_github <- pkg_list[grep(pattern = "/", x = pkg_list)]
  pkg_list_cran <- pkg_list[!pkg_list %in% pkg_list_github]

  if (!file.exists(here::here("DESCRIPTION"))) {
    usethis::use_description(check_name = FALSE)
  }

  suppressMessages({
    pkg_list_cran %>%
      map(~ use_package(package = .x, type = "Imports"))
  })

  message(glue("Consider include {pkg_list_github} into Remotes section of DESCRIPTION file"))
}

# prefer("here")
# prefer("dplyr")
# prefer("purrr")

update_description(package_list)
