FROM rocker/tidyverse:4.2.3

RUN apt-get -y update && \
    apt-get -y install \
    apt-utils \
    curl \
    default-jdk \
    build-essential && \
    apt-get -y upgrade && \
    apt-get -y purge && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

## Install R Package
RUN install2.r remotes \
                rmarkdown \
                knitr \
                config \
                kableExtra \
                rlang \
                log4r \
                lm.beta \
                && rm -rf /tmp/downloaded_packages

