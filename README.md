
![](http://www.textfiles.com/underconstruction/HeHeartlandPark2601underconstructionbar9.gif)

minimalTemplate
===============

[![Build
Status](https://travis-ci.com/kguidonimartins/minimalTemplate.svg?branch=master)](https://travis-ci.com/kguidonimartins/minimalTemplate)
[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![License:
MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

`{minimalTemplate}` is a highly opinionated package to facilitate the
production of docx files using
[RMarkdown](https://rmarkdown.rstudio.com/). For now, this package has
no commitment to the structure standards of the projects or R packages.
*Use at your own risk*.

Installation
------------

You can install the development version of `{minimalTemplate}` with:

    if(!require("remotes")) install.packages("remotes")
    remotes::install_github("kguidonimartins/minimalTemplate")

Example
-------

To use the full workflow of the `{minimalTemplate}`, follow the steps
below:

1.  Set up a new template
2.  Download a new citation style
3.  Set up the version control of `.docx` files (optional, but
    recommended)

### 1. Setting up a new template

Set a new template using:

    # load minimalTemplate
    library(minimalTemplate)

    # create a temporary directory (for a demo proposal only)
    tmp_proj <- file.path(tempdir(), "awesome-manuscript")

    # run `setup_template()`
    setup_template(tmp_proj)

    ## ✔ Creating '/tmp/Rtmpgw15l1/awesome-manuscript/'

    ## ✔ Setting active project to '/tmp/Rtmpgw15l1/awesome-manuscript'

    ## ✔ Creating 'R/'

    ## ✔ Writing 'awesome-manuscript.Rproj'

    ## ✔ Adding '.Rproj.user' to '.gitignore'

    ## ✔ Setting active project to '<no active project>'

    ## ℹ Please, following the instructions in the 'todo.txt' file

The folder structure of the `awesome-project` project is (*this is not a
mandatory structure*):

    ## /tmp/Rtmpgw15l1/awesome-manuscript
    ## ├── .Rbuildignore
    ## ├── .dockerignore
    ## ├── .github
    ## │   └── workflows
    ## │       └── docker.yaml
    ## ├── .gitignore
    ## ├── .travis.yml
    ## ├── DESCRIPTION
    ## ├── Dockerfile
    ## ├── LICENSE.md
    ## ├── Makefile
    ## ├── R
    ## │   ├── analysis.Rmd
    ## │   ├── local_functions.R
    ## │   └── package_list.R
    ## ├── README.md
    ## ├── awesome-manuscript.Rproj
    ## ├── data
    ## │   ├── clean
    ## │   │   └── .gitkeep
    ## │   ├── raw
    ## │   │   └── .gitkeep
    ## │   └── temp
    ## │       └── .gitkeep
    ## ├── main-script.Rmd
    ## ├── manuscript
    ## │   └── sources
    ## │       ├── ecology-letters.csl
    ## │       ├── library.bib
    ## │       ├── packages.bib
    ## │       └── template.docx
    ## ├── output
    ## │   ├── figures
    ## │   │   └── .gitkeep
    ## │   ├── results
    ## │   │   └── .gitkeep
    ## │   └── supp
    ## │       └── .gitkeep
    ## └── todo.txt

Open the `main_script.Rmd` file and press the `Knit` button.

### 2. Download a new citation style

Set a new citation style using:

    # First, search by your citation style using:
    (eco <- grep(pattern = "ecology", x = rcrossref::get_styles(), value = TRUE))
    # then:
    download_csl(journal_style = eco[4], directory = "manuscript/sources/")

### 3. Setting up the version control of `.docx` files

In this step, I’m assuming you want to control the changes (files
changes \[text and code\], entry of new analysis files) in your new
project folder. Please, refer to
[this](https://kbroman.org/github_tutorial/) to learn how to configure
git in your new project template.

To versioning your `.docx` files, just run the function:

    setup_wdiff()

This function is based on two git hooks (available
[here](https://github.com/vigente/gerardus/tree/master/shell-script)) to
create a `.md` copy of `.docx` files and track the changes.
