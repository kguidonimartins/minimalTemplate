#' Install and load multiple R packages
#'
#' Thanks to Steve Worthington \url{https://gist.github.com/stevenworthington/3178163}.
#'
#' @param pkg A character vector with the package names 
#'
#' @return None
#' @export
#'
#' @examples
#' list_pkg <- c("vegan", "ggplot2")
#' ipak(list_pkg)
ipak <- function(pkg){
    new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
    if (length(new.pkg))
        install.packages(new.pkg, dependencies = TRUE)
    sapply(X = pkg, FUN = require, quietly = TRUE, character.only = TRUE)
}
# ipak function: install and load multiple R packages.
# Check to see if packages are installed.
# Install them if they are not, then load them into the R session.
# https://gist.github.com/stevenworthington/3178163

