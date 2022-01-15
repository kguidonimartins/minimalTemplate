# this is a trick to fill renv.lock
# use at your won risk
packages_file_dir <- here::here("R")
packages_file <- here::here("R", "packages.R")

if (!file.exists(packages_file)) {

  loaded_packages <- sort(loadedNamespaces())

  if (!dir.exists(packages_file_dir)) {

    dir.create(packages_file_dir)

  }

  sink(file = packages_file, type = "output")

  for(package in loaded_packages) {

    cat(paste0("# install.packages(\"", package, "\") # ", packageVersion(package)), "\n")

  }

  for(package in loaded_packages) {

    cat(paste0("library(", package, ")"), "\n")

  }

  sink()

  for(package in loadedNamespaces()) {

    usethis::use_package(package, "imports", packageVersion(package))

  }

  usethis::use_tidy_description()

} else {

  message(paste(packages_file), " already exists! Existing...")

}

