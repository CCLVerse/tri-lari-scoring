FROM rocker/tidyverse:4.3.0

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install \
    build-essential && \
    apt-get -y purge && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./docker/rstudio-prefs.json /home/rstudio/.config/rstudio/
RUN chown rstudio:rstudio /home/rstudio/.config/rstudio/rstudio-prefs.json

## Install R Package
RUN install2.r remotes \
                devtools \
                rmarkdown \
                tidyverse \
                knitr \
                kableExtra \
                lavaan \
                rlang \
                log4r \
                lm.beta \
                && rm -rf /tmp/downloaded_packages

