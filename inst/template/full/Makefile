.DEFAULT_GOAL := help

R := Rscript -e
RMD := main-script.Rmd
DOCX := manuscript/manuscript.docx
IMAGE := {{{USER}}}/{{{REPO}}}

.PHONY: analysis manuscript convert-pdf clean_cache

all: clean_cache analysis manuscript convert-pdf ## run report and convert-pdf targets

styler: ## styler package
	$(R) "styler::style_file('main-script.Rmd')"
	$(R) "styler::style_file('R/analysis.Rmd')"

manuscript: ## compile manuscript as draft_fire_beta_kggm_v6.docx
	$(R) "rmarkdown::render(\
	input = '$(RMD)', \
	output_format = 'all', \
	output_file = '$(DOCX)' \
	)"

analysis: ## compile analysis document to output/analysis.html
	$(R) "rmarkdown::render(input = 'R/analysis.Rmd', params = list(show_results = TRUE), output_dir = 'output/results')"

convert-pdf: ## convert report to a pdf file
	lowriter --convert-to pdf $(DOCX) --outdir manuscript

docker_build: ## build docker image
	docker build -t $(IMAGE) .

docker_run: ## run docker image and copy rendered to .
	@echo "You need to run: docker run --rm -v `pwd`:/rendered chapter-01"
	docker run --rm -v `pwd`:/rendered $(IMAGE)

clean_cache: ## remove cache
	rm -rf main-script_cache
	rm -rf R/analysis_cache

help: ## show this message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
