.DEFAULT_GOAL := help

all: render_readme check ## run render_readme and check targets

render_readme: ## render readme
	Rscript -e "rmarkdown::render(input = 'README.Rmd', encoding = 'UTF-8')"

check: ## check package build
	Rscript -e "devtools::check()"

.PHONY: help

help: ## show this message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; { printf "\033[36m%-20s\033[0m %s\n", $$1, $$2 }'
