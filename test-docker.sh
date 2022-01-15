#!/usr/bin/env sh

docker run -it archlinux sh -c "pacman -Sy  && \
    pacman -S r base-devel --noconfirm && \
    Rscript -e 'install.packages(\"remotes\", repos = \"https://cloud.r-project.org\"); remotes::install_github(\"kguidonimartins/minimalTemplate\"); minimalTemplate::setup_template(\"teste\")'"
