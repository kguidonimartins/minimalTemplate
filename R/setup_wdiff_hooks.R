setup_wdiff_hooks <- function(...){ 
  
  hooks.files <- c("pre-commit",
                   "post-commit")
  
  for (i in seq_along(hooks.files)){
    
    if(!file.exists(paste0(".git/hooks/", hooks.files[i]))) {
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
  
}

# setup_wdiff_hooks()
