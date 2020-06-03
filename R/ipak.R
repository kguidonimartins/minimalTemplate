#' Install and load multiple R packages
#'
#' Thanks to Steve Worthington \url{https://gist.github.com/stevenworthington/3178163}.
#'
#' @param pkg_list A character vector with the package names 
#'
#' @return None
#' 
#' @importFrom utils download.file install.packages installed.packages
#' 
#' @export
#'
#' @examples
#' \dontrun{
#' pkg_list <- c("vegan", "ggplot2")
#' ipak(pkg_list)
#' }
ipak <- function(pkg_list) {
    new_pkg <- pkg_list[!(pkg_list %in% installed.packages()[, "Package"])]
    if (length(new_pkg))
        install.packages(new_pkg, dependencies = TRUE)
    sapply(X = pkg_list, FUN = require, quietly = TRUE, character.only = TRUE)
}
# ipak function: install and load multiple R packages.
# Check to see if packages are installed.
# Install them if they are not, then load them into the R session.
# https://gist.github.com/stevenworthington/3178163

