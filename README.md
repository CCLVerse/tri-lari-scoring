# Benchmark Data Processing and Lavaan Analyses

This repository contains a set of R functions designed for data processing and Bi-Factor Leadership Arena, Reputation, and Identity analyses using the `lavaan` package. These functions aim to streamline the process of preparing the data and running LARI model for benchmark studies. 

The code is supplemental to the paper titled: [EJP Paper Title]

## Table of Contents
- [Prerequisites](#prerequisites)
- [Functions](#functions)
  - [01_bmk_data_processing.Rmd](#01_bmk_data_processingRmd)
  - [02_bmk_lavaan_analyses.Rmd](#02_bmk_lavaan_analysesRmd)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

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




```

For convenience, you can also use Dockerfile to run the container. Docker compose.yaml file is also included to run the docker container. Please follow the installation and usage [instructions](https://docs.docker.com/get-started/08_using_compose/)

```R

docker compose up

```

## Process

[]("./images/Process-map.png")


## Contributing
If you want to contribute to this project, please open an issue or submit a pull request.

## License
This project is licensed under the XYZ License - see the LICENSE.md file for details.
