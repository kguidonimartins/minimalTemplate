# required; do not exclude from this list
pkg_list <-
  c(
    "devtools",
    "bibtex",
    "knitr",
    "rmarkdown",
    "pacman",
    "captioner",
    "git2r"
    )

ipak(pkg_list)

write.bib(pkg_list, here("manuscript", "sources", "installed-r-packages.bib"))
