#' Download csl citation style
#'
#' Download csl citation style from \url{https://github.com/citation-style-language/styles}.
#'
#' @param journal_style Journal style (see examples)
#' @param directory Directory to store the csl file
#'
#' @importFrom here here
#' @importFrom usethis ui_field ui_todo ui_done
#' @importFrom fs dir_exists
#' 
#' @section Note:
#' See also: [Zotero Style Repository](https://www.zotero.org/styles)
#'
#' @return None
#' @export
#'
#' @examples
#' \dontrun{
#' # First, search by your preferred citation style using:
#' (eco <- grep(pattern = "ecology", x = rcrossref::get_styles(), value = TRUE))
#' # then:
#' download_csl(journal_style = eco[4], directory = "")
#' }
download_csl <- function(journal_style, directory = NULL) {
  
  check_require("ropensci/rcrossref")
  
  if (!is.null(directory)) {
    if (!fs::dir_exists(directory)) {
      usethis::ui_stop("{usethis::ui_field(here::here(directory))} does not exists!")
    }
  }
  
  if (is.null(directory)) {
    directory <- "."
  }
  
  style <- "https://raw.githubusercontent.com/citation-style-language/styles/master/"
  
  filename_url_to_download <- paste0(style, journal_style, ".csl")
  
  filename_to_save <- paste0(directory, "/", journal_style, ".csl")
  
  usethis::ui_todo("Saving {usethis::ui_field(here::here(filename_to_save))}...")
  
  utils::download.file(
    url = filename_url_to_download, 
    mode = "w",
    destfile = filename_to_save
    )
  
  usethis::ui_done("{usethis::ui_field(here::here(filename_to_save))} saved!")
  
}
