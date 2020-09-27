
table_cap <- captioner(prefix = "Table")

table_cap_supp <- captioner(prefix = "Table S", auto_space = FALSE)

table_ref <- function(label) {
  stringr::str_extract(label, "[^:]*")
}

figure_cap <- captioner(prefix = "Figure")

figure_cap_supp <- captioner(prefix = "Figure S", auto_space = FALSE)

figure_ref <- function(label) {
  stringr::str_extract(label, "[^:]*")
}

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

save_plot <- function(object, filename = NULL, dir_to_save = NULL, width = NA, height = NA, format = NULL, units = NULL, dpi = NULL, overwrite = FALSE, trim = FALSE) {
  default_format <- "png"
  default_units <- "cm"
  default_dpi <- 300
  default_filename <- deparse(substitute(object))

  if (!is.null(format)) default_format <- format
  if (!is.null(units)) default_units <- units
  if (!is.null(dpi)) default_dpi <- dpi
  if (!is.null(filename)) default_filename <- filename

  if (is.null(dir_to_save)) {
    dir_to_save <- here::here("output/figures")
  }

  name_to_save <- paste0(dir_to_save, "/", default_filename, ".", default_format)
  args <- list(
    plot = object,
    file = name_to_save,
    units = default_units,
    dpi = default_dpi,
    width = width,
    height = height
  )
  if (default_format == "pdf") args[["useDingbats"]] <- FALSE
  if (!fs::file_exists(name_to_save)) {
    usethis::ui_todo("Saving {usethis::ui_field(here::here(name_to_save))}...")
    do.call(ggplot2::ggsave, args)
    usethis::ui_done("{usethis::ui_field(here::here(name_to_save))} saved!")
  } else if (overwrite) {
    usethis::ui_todo("Overwriting {usethis::ui_field(here::here(name_to_save))}...")
    unlink(name_to_save)
    do.call(ggplot2::ggsave, args)
    usethis::ui_done("{usethis::ui_field(here::here(name_to_save))} saved!")
  } else {
    usethis::ui_info("File {usethis::ui_field(here::here(name_to_save))} already exists! Use overwrite = TRUE.")
  }
  if (trim) {
    trim_fig(figure_path = name_to_save, overwrite = overwrite)
  }
}


trim_fig <- function(figure_path, overwrite = FALSE) {
  check_require("magick")
  if (!fs::file_exists(figure_path)) {
    usethis::ui_stop("{usethis::ui_field(figure_path)} does not exists!")
  }
  fig_dirname <- dirname(figure_path)
  fig_name <- basename(figure_path)
  fig_dir_trim <- paste0(fig_dirname, "/", "trim/")
  fs::dir_create(fig_dir_trim)
  name_to_save <- paste0(fig_dir_trim, fig_name)
  make_trim_fig <- function(figure_path, name_to_save) {
    fig <- magick::image_read(figure_path)
    fig_trim <- magick::image_trim(fig)
    magick::image_write(image = fig_trim, path = name_to_save)
  }
  if (!fs::file_exists(name_to_save)) {
    usethis::ui_todo("Saving {usethis::ui_field(name_to_save)}...")
    make_trim_fig(figure_path = figure_path, name_to_save = name_to_save)
    usethis::ui_done("{usethis::ui_field(name_to_save)} saved!")
  } else if (overwrite) {
    usethis::ui_todo("Overwriting {usethis::ui_field(name_to_save)}...")
    unlink(name_to_save)
    make_trim_fig(figure_path = figure_path, name_to_save = name_to_save)
    usethis::ui_done("{usethis::ui_field(name_to_save)} saved!")
  } else {
    usethis::ui_info("File {usethis::ui_field(name_to_save)} already exists! Use overwrite = TRUE.")
  }
}


