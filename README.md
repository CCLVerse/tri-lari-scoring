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



## Functions
## 01_bmk_data_processing.Rmd
Function 1: linear_model
Description: Fits linear models for regression using the lm function.
Usage: linear_model(formula, df, ...)
Arguments:
formula: A symbolic description of the model to be fitted.
df: Dataframe or list containing the variables.
...: Additional arguments.
Returns: A list containing the model response and summary.
Function 2: count_missing_values
Description: Computes missing values in a dataframe.
Usage: count_missing_values(df)
Arguments:
df: The dataframe to work with.
Returns: A dataframe with missing value counts and percentages.
... (Include details for other functions)

## 02_bmk_lavaan_analyses.Rmd

Function 1: lavaan_model_fit
Description: Fits structural equation models using the lavaan package.
Usage: lavaan_model_fit(df, model)
Arguments:
df: The dataframe used in the analysis.
model: A character model with latent variables.
Returns: A list containing model fits (oblique and orthogonal), summaries, and fitted values.

### Function 2: get_factor_scoring_weights
- **Description**: Retrieves factor scoring weights from lavaan fits.
- **Usage**: get_factor_scoring_weights(fitted_values, which)
- **Arguments**:
	+ **fitted_values**: Fitted values from lavPredict.
	+ **which**: A character string specifying which attribute to access.
- **Returns**: A dataframe containing factor scoring weights.
... (Include details for other functions)

## Usage
1. Clone this repository to your local machine.
2. Open your R script or R Markdown file.
3. Load the required functions using source("01_bmk_data_processing.R") and source("02_bmk_lavaan_analyses.R").
4. Use the functions in your R script or R Markdown document as needed.

## Contributing
If you want to contribute to this project, please open an issue or submit a pull request.

## License
This project is licensed under the XYZ License - see the LICENSE.md file for details.
