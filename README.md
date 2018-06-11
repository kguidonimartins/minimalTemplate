# minimalTemplate

The goal of minimalTemplate is to create a template for writing scientific manuscripts using [RMarkdown](https://rmarkdown.rstudio.com/). `minimalTemplate` focuses in `.docx` output, and provides a function to set the version control those files.

## Installation

You can install the development version of minimalTemplate with:

``` r
if(!require("devtools")) install.packages("devtools")
devtools::install_github("ropensci/rcrossref")
devtools::install_github("kguidonimartins/minimalTemplate")
```

## Example

To use the full workflow of the `minimalTemplate`, follow the steps below:

1. Set up a new template
2. Download a new citation style
3. Set up git in your new template
4. Set up the version control of `.docx` files (optional, but recommended)

### 1. Setting up a new template

Set a new template using:

``` r
setup_template("ms_chap_01")
```

The above line will open a new [RStudio project](https://support.rstudio.com/hc/en-us/articles/200526207-Using-Projects).

The folder structure of the `ms_chap_01` project is (*this is not a mandatory structure*):

```
ms_chap_01/
|-- data/                  # main data folder
|   |-- clean/             # folder of cleaned data
|   `-- raw/               # folder of raw data
|-- main-script.Rmd        # script to writing your scientific manuscript
|-- manuscript/            # folder of the `.docx` output
|   `-- sources/           # folder with files to manuscript
|       |-- journal.csl    # citation style file
|       |-- library.bib    # your scientific references
|       `-- template.docx  # an editable `.docx` template
|-- ms_chap_01.Rproj       # RStudio project
|-- output/                # main output folder
|   |-- figures/           # producted figures
|   `-- results/           # output of analitical results
`-- R/                     # your R functions
```

Open the `main_script.Rmd` file and press the `Knit` button.


### 2. Download a new citation style

Set a new citation style using:

```r
# First, search by your citation style using:
(eco <- grep(pattern = "ecology", x = rcrossref::get_styles(), value = TRUE))
# then:
download_csl(journal_style = eco[4], directory = "manuscript/sources/")
```

### 3. Setting up git in your new template

todo

### 4. Setting up the version control of `.docx` files


todo
