all: check build

check:
	Rscript -e "devtools::check()"

build:
	Rscript -e "pkgdown::build_site()"
