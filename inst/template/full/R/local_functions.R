cite_pkg <- function(pkg_list) {

  packages <- sort(pkg_list)
  cites <- lapply(packages, utils::citation)
  cites.bib <- lapply(cites, utils::toBibtex)

  # generate reference key
  for (i in seq_len(length(cites.bib))) {
    cites.bib[[i]] <-
      sub(
        pattern = "\\{,$",
        replacement = paste0("{", packages[i], ","),
        x = cites.bib[[i]]
      )
  }

  # write bibtex references to file
  if (!dir.exists("sources")){
    dir.create("sources")
  }
  file.create("sources/pkg_list-refs.bib")
  writeLines(enc2utf8(unlist(cites.bib)), con = "sources/pkg_list-refs.bib", useBytes = TRUE)

  # return named list of bibtex references
  names(cites.bib) <- packages # pkgs

  writeLines(paste("- ", names(cites.bib), " [@", names(cites.bib), "]", sep = ""))
}
