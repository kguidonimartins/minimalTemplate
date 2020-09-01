# TODO: make this more general
# CHECK: https://github.com/benmarwick/rrtools/blob/master/inst/templates/travis.yml-no-docker

# get shiny serves plus tidyverse packages image
FROM rocker/shiny-verse:latest

# system libraries of general use
RUN apt-get update && apt-get install -y \
    sudo \
    build-essential \
    bwidget \
    libcairo2-dev \
    libcurl4-gnutls-dev \
    libgdal-dev \
    libgeos++-dev \
    libgeos-dev \
    libgsl0-dev \
    libproj-dev \
    libspatialite-dev \
    libssh2-1-dev \
    libssl-dev \
    libudunits2-dev \
    libxml2-dev \
    libxt-dev \
    netcdf-bin \
    pandoc \
    pandoc-citeproc

# install R packages required
# (change it dependeing on the packages you need)
RUN R -e "pkg <- c('dplyr', 'DT', 'ggplot2', 'here', 'knitr', 'qs', \
           'rmarkdown', 'rsconnect', 'scales', 'sf', 'shiny', \
           'shinydashboard', 'shinytest', 'shinythemes', \
           'usethis', 'xpectr', 'testthat'); \
           install.packages(pkg, repos = 'http://cran.rstudio.com/')"

# create folder to store data
RUN mkdir -p /srv/shiny-server/inst/extdata

# copy the app to the image
RUN rm -rf /srv/shiny-server/*
COPY . /srv/shiny-server/

# this file needs to be executable.
# dont forget: `sudo chmod +x shiny-server.sh`
COPY shiny-server.sh /usr/bin/shiny-server.sh

# select port
EXPOSE 3838

# run app
CMD ["/usr/bin/shiny-server.sh"]
