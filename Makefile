.DEFAULT_GOAL := help

all: check build ## run check and build

check: ## check package build
	Rscript -e "devtools::check()"

build: ## build package site
	Rscript -e "rmarkdown::render(input = 'README.Rmd', output_format = 'all', encoding = 'UTF-8')"
	Rscript -e "pkgdown::build_site(preview = TRUE)"

.PHONY: help

help: ## show this message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; { printf "\033[36m%-20s\033[0m %s\n", $$1, $$2 }'
