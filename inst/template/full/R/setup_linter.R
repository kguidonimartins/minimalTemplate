# from: https://github.com/jimhester/lintr#project-configuration

# Create configuration file for lintr
# Source this file in package root directory
if (!require("magrittr")) install.packages("magrittr")
if (!require("dplyr")) install.packages("dplyr")

# List here files to exclude from lint checking, as a character vector
excluded_files <- c(
    list.files(".github",           recursive = TRUE, full.names = TRUE),
    list.files("data",              recursive = TRUE, full.names = TRUE),
    list.files("manuscript",        recursive = TRUE, full.names = TRUE),
    list.files("main-script_cache", recursive = TRUE, full.names = TRUE),
    list.files("output",            recursive = TRUE, full.names = TRUE)
)

### DO NOT EDIT AFTER THIS LINE ###

# Make sure we start fresh
if (file.exists(".lintr")) {
  file.remove(".lintr")
}

# List current lints
lintr::lint_package() %>%
    as.data.frame() %>%
    group_by(linter) %>%
    tally(sort = TRUE) %$%
    sprintf("linters: with_defaults(\n    %s\n    dummy_linter = NULL\n  )\n",
            paste0(linter, " = NULL, # ", n, collapse = "\n    ")) %>%
    cat(file = ".lintr")

sprintf("exclusions: list(\n    %s\n  )\n",
        paste0('"', excluded_files, '"', collapse = ",\n    ")) %>%
    cat(file = ".lintr", append = TRUE)

# Clean up workspace
remove(excluded_files)
