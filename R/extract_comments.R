#' Extract comments of a docx file to a csv
#'
#' @param path a character vector with path to docx files
#'
#' @importFrom docxtractr read_docx docx_extract_all_cmnts
#' @importFrom dplyr select
#' @importFrom fs dir_ls
#' @importFrom here here
#' @importFrom readr write_csv
#'
#' @return a csv file
#' @export
extract_comments_from_docx <- function(path) {

  dir_to_save <- here::here("manuscript", "docx_comments")

  if (!dir.exists(dir_to_save)) {

    dir.create(dir_to_save)

  }

  docx_files <- fs::dir_ls(path = path, regexp = "*.docx", type = "file")

  for (docx in docx_files) {

    comments_file <-
      paste0(dir_to_save, "/", gsub(".docx", "_comments.csv", basename(docx)))

    if (!file.exists(comments_file)) {

      extracted_comments <-
        docx %>%
        docxtractr::read_docx(track_changes = NULL) %>%
        docxtractr::docx_extract_all_cmnts(include_text = TRUE)

      if (nrow(extracted_comments) != 0) {

        extracted_comments %>%
          dplyr::select(id, date, author, word_src, comment_text) %>%
          readr::write_csv(comments_file, quote_escape = "double")

      } else {

        message(paste("No comment in", docx))

      }

    } else {

      message(paste(comments_file, " already exists!"))

    }

  }

}
