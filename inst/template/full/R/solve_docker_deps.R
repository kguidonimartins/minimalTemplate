if (!require("getsysreqs")) remotes::install_github("mdneuzerling/getsysreqs")
if (!require("here")) install.packages("here")

getsysreqs::get_sysreqs(
  here::here("renv.lock"),
  distribution = "ubuntu",
  release = "20.04"
)

getsysreqs::getapt_get_install(
  here::here("renv.lock"),
  distribution = "ubuntu",
  release = "20.04"
)
