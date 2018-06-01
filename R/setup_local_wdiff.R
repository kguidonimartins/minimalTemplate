setup_local_wdiff <- function(verbose = TRUE) {
  require(git2r)
  if (dir.exists(".git")) {
    system("git config diff.pandoc.prompt \"false\"")
    system("git config diff.pandoc.textconv \"pandoc --to=markdown\"")
    system("git config alias.wdiff \"diff --word-diff=color --unified=1\"")
  }
  if (verbose == TRUE) {
    git2r::config()
  }
}
