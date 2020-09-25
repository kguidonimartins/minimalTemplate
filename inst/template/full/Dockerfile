FROM rocker/verse:4.0.2

RUN . /etc/environment && \
          apt-get update && \
          apt-get install -y \
          build-essential \
          bwidget \
          libcairo2-dev \
          libcurl4-gnutls-dev \
          libexif-dev \
          libfontconfig1-dev \
          libfreetype6-dev \
          libgdal-dev \
          libgeos++-dev \
          libgeos-dev \
          libglib2.0-dev \
          libgmp3-dev \
          libgsl0-dev \
          libmagick++-dev \
          libproj-dev \
          libspatialite-dev \
          libssh2-1-dev \
          libssl-dev \
          libtiff5-dev \
          libudunits2-dev \
          libxml2-dev \
          libxt-dev \
          make \
          netcdf-bin \
          pandoc \
          pandoc-citeproc \
          zlib1g-dev

RUN echo "options(Ncpus = $(nproc --all))" >> /usr/local/lib/R/etc/Rprofile.site

COPY . /research-paper

RUN cd research-paper && \
          Rscript -e 'options(repos = list(CRAN = "https://cran.microsoft.com/snapshot/2020-03-26/")); \
          install.packages("remotes"); \
          remotes::install_deps(upgrade = "never"); \
          rmarkdown::render(input = "R/analysis.Rmd", params = list(show_results = TRUE), output_file = "analysis-rendered-in-docker.html"); \
          rmarkdown::render(input = "main-script.Rmd", output_file = "paper-rendered-in-docker.docx")'

CMD cd research-paper && \
          mv paper-rendered-in-docker.docx ../rendered && \
          mv R/analysis-rendered-in-docker.html ../rendered
