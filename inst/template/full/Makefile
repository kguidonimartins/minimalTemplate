RMD = main-script.Rmd
DOC = manuscript/report.docx
MD = $(addsuffix .md, $(basename $(DOC)))

all: report convert-pdf 

report:
	Rscript -e "rmarkdown::render(\
	input = '$(RMD)', \
	output_format = 'all', \
	output_file = '$(DOC)' \
	)"

convert-pdf:
	lowriter --convert-to pdf $(DOC) --outdir manuscript

.PHONY: clean 
clean:
	rm output/figures/*

