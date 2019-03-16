#' Download csl citation style
#'
#' Download csl citation style from \url{https://github.com/citation-style-language/styles}.
#'
#' @param journal_style Journal style (see examples)
#' @param directory Directory to store the csl file
#'
#' @return None
#' @export
#'
#' @examples
#' # First, search by your preferred citation style using:
#' (eco <- grep(pattern = "ecology", x = rcrossref::get_styles(), value = TRUE))
#' # then:
#' download_csl(journal_style = eco[4], directory = "")
download_csl <- function(journal_style, directory) {

  style <- "https://raw.githubusercontent.com/citation-style-language/styles/master/"

  utils::download.file(paste0(style, journal_style, ".csl"), mode = "w",
                destfile = paste0(directory, journal_style, ".csl"))
}
