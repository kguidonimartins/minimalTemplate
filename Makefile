all: check build

check:
	Rscript -e "devtools::check()"

build:
	Rscript -e "rmarkdown::render(input = 'README.Rmd', output_format = 'all', encoding = 'UTF-8')"
	Rscript -e "pkgdown::build_site(preview = TRUE)"
