check_require <- function(pkg) {
  full_pkgname <- pkg
  pkgname <- basename(full_pkgname)
  
  if (!requireNamespace(pkgname, quietly = TRUE)) {
    usethis::ui_stop(
      "Package {usethis::ui_field(pkgname)} needed for this function to work!
       Solution: You can install it with `misc::ipak(\"{ui_field(full_pkgname)}\")`"
    )
  }
}
