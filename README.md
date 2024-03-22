## Evaluating a Novel Method for Scoring Multi-Rater Assessments of Leadership Competencies

In the field of leadership development, 360-degree assessments are crucial tools. These multi-rater instruments allow leaders to evaluate themselves on various competencies while also receiving feedback from a wide range of stakeholders, including peers, direct reports, and supervisors. Despite the value of 360-degree assessments, challenges in scoring these instruments persist. Our research introduces a Latent Approximation Method (LAM) as a novel scoring approach. Leveraging recent advancements in modeling multi-rater data, we offer a preliminary empirical evaluation of the LAM. By applying this method to data from an international sample involving approximately 17,000 leaders and 150,000 raters, we explored the utility of LAM scoring in depth.

This repository provides the code necessary for data processing and analysis using the bi-Factor Leadership Arena, Reputation, and Identity (LARI) model through the `lavaan` package in R. It is designed to facilitate the analysis of 360-degree feedback assessments from multiple raters, complementing the findings presented in our forthcoming paper.

### Table of Contents
1. [Introduction](#introduction)
2. [Prerequisites](#prerequisites)
3. [Installation Instructions](#installation-instructions)
   - [R and RStudio](#r-and-rstudio)
   - [Docker](#docker)
4. [Running the Analysis](#running-the-analysis)
5. [License](#license)
6. [Contact](#contact)

### Introduction

Our study critically evaluates the Latent Approximation Method (LAM) for scoring 360-degree leadership assessments. Despite showing considerable overlap with standard scoring methods, LAM scores also reveal distinct differences and offer a modest increase in predictive power for certain outcomes. These findings prompt a discussion on the practical implications for professionals utilizing 360-degree assessments in leadership development.

### Prerequisites

Before proceeding, ensure you have the following prerequisites:

- R and RStudio installed on your system.
- Docker installed if you prefer to run the analysis in a containerized environment.

### Installation Instructions

#### R and RStudio

1. **Install R:**
   - Visit the [Comprehensive R Archive Network (CRAN)](https://cran.r-project.org/) and download the latest version of R for your operating system. Follow the installation instructions provided on the website.

2. **Install RStudio:**
   - Navigate to the [RStudio download page](https://www.rstudio.com/products/rstudio/download/) and select the appropriate version for your operating system. Install RStudio after downloading it.

3. **Install Required R Packages:**
   - Open RStudio
   - Open `main.Rmd` to begin. This is the entry point for the code where all required initial process is done. The notebook also calls additional notebooks for data processing and lavaan analyses for required competencies.
   - `init.R` in `main.Rmd` prepares the environment by installing required packages.  


#### Docker

To use Docker for running the analysis:

1. **Install Docker:**
   - Follow the instructions on the [Docker documentation site](https://docs.docker.com/get-docker/) to download and install Docker for your operating system.

2. **Run Docker Container:**
   - Utilize the provided `Dockerfile` and `docker-compose.yaml` file to build and run the container. Navigate to the directory containing these files and run the following command:

```sh
docker-compose up
```

### Running the Analysis

Once the prerequisites have been set up, you can proceed with the data processing and analysis as detailed in the repository. The process is illustrated in the provided process map, guiding you through the steps necessary to prepare your data and execute the LARI model analysis.

### License

Please refer to the LICENSE file for details on the distribution, usage, and contribution guidelines.

### Contact

For inquiries or further information regarding this project, please contact the repository maintainers.
