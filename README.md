# Benchmark Data Processing and Lavaan Analyses

This repository contains a set of R functions designed for data processing and Bi-Factor Leadership Arena, Reputation, and Identity analyses using the `lavaan` package. These functions aim to streamline the process of preparing the data and running LARI model for benchmark studies. 

The code is supplemental to the paper titled: TBD

## Table of Contents
- [Prerequisites](#prerequisites)
- [Process](#process)

## Prerequisites

Before using these functions, ensure you have the following prerequisites:

- R installed on your system.
- The required R packages installed. You can install them using the following command:

```R

pkgs <- c("remotes", 
		  "rmarkdown", 
		  "tidyverse", 
		  "knitr", 
		  "config", 
		  "kableExtra", 
		  "lavaan", 
		  "rlang", 
		  "log4r", 
		  "lm.beta")

load_packages(pkgs)


```

For convenience, you can also use Dockerfile to run the container. Docker compose.yaml file is also included to run the docker container. Please follow the installation and usage [instructions](https://docs.docker.com/get-started/08_using_compose/)

```R

docker compose up

```

## Process

![Process map](images/Process-map.png?raw=true)

