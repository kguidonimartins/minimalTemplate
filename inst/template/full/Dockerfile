FROM rocker/verse

RUN . /etc/environment \
  && apt-get update \
  && apt-get install -y \
  build-essential \
  bwidget \
  libcairo2-dev \
  libcurl4-gnutls-dev \
  libgdal-dev \
  libgeos++-dev \
  libgeos-dev \
  libgmp3-dev \
  libgsl0-dev \
  libproj-dev \
  libspatialite-dev \
  libssh2-1-dev \
  libssl-dev \
  libudunits2-dev \
  libxml2-dev \
  libxt-dev \
  make \
  netcdf-bin \
  pandoc \
  pandoc-citeproc \
  zlib1g-dev

COPY . /research-paper

RUN cd research-paper && \
          Rscript -e "install.packages('remotes'); \
          remotes::install_deps(upgrade = 'never'); \
          rmarkdown::render(input = 'main-script.Rmd', output_file = 'rendered-in-docker.docx')"

CMD mv /research-paper/rendered-in-docker.docx /rendered/rendered-in-docker.docx
