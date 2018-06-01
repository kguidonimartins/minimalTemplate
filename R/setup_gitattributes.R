setup_gitattributes <- function(...) {
  if (file.exists(".gitattributes")) {
    print(".gitattributes exists!")
  } else {
    file.create(".gitattributes")
    print(".gitattributes created")
  }
  write(x = "*.docx diff=pandoc", file = ".gitattributes")
}