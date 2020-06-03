#' Extract comments of a docx file to a csv
#'
#' @param docx_path docx path
#' @param filename_to_save name of file to save
#'
#' @importFrom glue glue
#' @importFrom docxtractr read_docx docx_extract_all_cmnts
#' @importFrom dplyr select
#' @importFrom readr write_csv
#' @importFrom magrittr %>%
#'
#' @return a csv file
#' @export
#'
#' @examples
extract_comments <- function(docx_path, filename_to_save = NULL) {
  
  if (is.null(filename_to_save)) {
    
    cmmts_file <- gsub(".docx", "_comments.csv", docx_path)
    
  } else {
    
    cmmts_file <- filename_to_save
    
  }
  
  message(glue::glue("Saving {cmmts_file}"))
  
  docx_path %>%
    docxtractr::read_docx(path = ., track_changes = NULL) %>%
    docxtractr::docx_extract_all_cmnts(docx = ., include_text = TRUE) %>%
    dplyr::select(id, date, author, word_src, comment_text) %>%
    readr::write_csv(x = ., path = cmmts_file, quote_escape = "double")
  
}








