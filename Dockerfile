FROM rocker/r-ver:4.4.0

# System dependencies needed by Seurat and its deps (hdf5, GDAL, etc.)
RUN apt-get update && apt-get install -y --no-install-recommends \
  libcurl4-openssl-dev \
  libssl-dev \
  libxml2-dev \
  libhdf5-dev \
  libglpk-dev \
  libgeos-dev \
  libfontconfig1-dev \
  libfreetype6-dev \
  libpng-dev \
  libtiff5-dev \
  libharfbuzz-dev \
  libfribidi-dev \
  libgdal-dev \
  libproj-dev \
  libgit2-dev \
  libudunits2-dev \
  libcairo2-dev \
  libxt-dev \
  patch \
  git \
  && rm -rf /var/lib/apt/lists/*

# Use Posit Package Manager for faster binary installs
ENV CRAN_REPO="https://packagemanager.posit.co/cran/__linux__/jammy/latest"

# Install CRAN packages
RUN R -e "install.packages(c('Seurat', 'tidyverse', 'Matrix', 'patchwork', 'remotes'), repos='${CRAN_REPO}')"

# Install DoubletFinder from GitHub at the pinned commit
RUN R -e "remotes::install_github('chris-mcginnis-ucsf/DoubletFinder@3b420df68b8e2a0cc6ebd4c5c1c7ea170464c97f', upgrade=FALSE, dependencies=TRUE)"

WORKDIR /data

CMD ["/bin/bash"]