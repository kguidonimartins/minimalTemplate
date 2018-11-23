#' Setup wdiff for .docx files via pre- and post-commit hooks
#'
#' @param verbose If TRUE, (default) show global and local git config files
#'
#' @return None
#' @export
#'
#' @examples
#' # Just run:
#' setup_wdiff()
setup_wdiff <- function(verbose = TRUE) {
  
  if(!dir.exists(".git")){
    message("This is not a git repository! Access the site: https://git-scm.com/")
  } else {
  
  require(git2r)
  
  hooks.files <- c("pre-commit",
                   "post-commit")
  
  for (i in seq_along(hooks.files)) {
    if (!file.exists(paste0(".git/hooks/", hooks.files[i]))) {
      download.file(
        url = paste0(
          "https://raw.githubusercontent.com/vigente/gerardus/master/shell-script/" ,
          hooks.files[i],
          "-git-diff-docx.sh"
        ),
        destfile = paste0(".git/hooks/", hooks.files[i])
      )
      system(command = paste0("chmod u+x .git/hooks/", hooks.files[i]))
    }
  }
  
  if (!file.exists(".gitattributes")) {
    cat("*.docx diff=pandoc", file = ".gitattributes")
  }
  
  cat("\n`git wdiff` is configured\n\n")
  
  if (dir.exists(".git")) {
    system("git config diff.pandoc.prompt \"false\"")
    system("git config diff.pandoc.textconv \"pandoc --to=markdown\"")
    system("git config alias.wdiff \"diff --word-diff=color --unified=1\"")
  }
  
  if (verbose == TRUE) {
    git2r::config()
  }
}
}
