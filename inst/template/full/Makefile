.DEFAULT_GOAL := help

RMD = main-script.Rmd
DOC = manuscript/manuscript.docx
MD = $(addsuffix .md, $(basename $(DOC)))

all: report manuscript convert-pdf ## run report, manuscript and convert-pdf

report: ## generate analyis report
	Rscript -e "rmarkdown::render(\
	input = 'R/analysis.Rmd', \
	output_file = '../output/results/analysis.html' \
	)"

manuscript: ## compile manuscript
	Rscript -e "rmarkdown::render(\
	input = '$(RMD)', \
	output_file = '$(DOC)' \
	)"

convert-pdf: ## convert manuscript to pdf
	lowriter --convert-to pdf $(DOC) --outdir manuscript

.PHONY: clean
clean: ## remove figures
	rm output/figures/*

help: ## show this message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; { printf "\033[36m%-20s\033[0m %s\n", $$1, $$2 }'
