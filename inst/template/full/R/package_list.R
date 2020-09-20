# required; do not exclude from this list
pkg_list <-
  c(
    "bibtex",
    "broom",
    "captioner",
    "devtools",
    "git2r",
    "here",
    "knitr",
    "pacman",
    "rmarkdown",
    "tidyverse",
    "usethis"
    )

misc::ipak(pkg_list)

write.bib(pkg_list, here("manuscript", "sources", "installed-r-packages.bib"))

suppressMessages({
  pkg_list %>%
    str_remove(., "tidyverse") %>% .[. != ""] %>%
    map(~ use_package(package = .x, type = "Imports"))

  use_package("tidyverse", type = "depends")
})
