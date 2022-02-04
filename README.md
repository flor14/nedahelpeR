
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nedahelpeR

<!-- badges: start -->

[![R-CMD-check](https://github.com/UBC-MDS/nedahelpeR/workflows/R-CMD-check/badge.svg)](https://github.com/UBC-MDS/nedahelpeR/actions)

[![codecov](https://codecov.io/gh/UBC-MDS/nedahelpeR/branch/main/graph/badge.svg?token=S0j0YXOtij)](https://codecov.io/gh/UBC-MDS/nedahelpeR)

<!-- badges: end -->

The goal of nedahelpeR is to simplify some common and repetitive tasks
during EDA and data preprocessing for data analysts, as well as add
value to their workflow by presenting some useful insights in a quick
manner (just calling our functions), such as displaying
highly-correlated variables and outliers.

The package includes functions which can complete the following tasks:

-   Display some useful statistics
-   Detect outliers
-   Deal with missing values
-   Check for correlation between features

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("https://github.com/UBC-MDS/nedahelpeR.git")
```

## Usage

This is a basic example which shows you how to use the package:

``` r
library(nedahelpeR)
df <- data.frame('col1'= c(-100,-200, 1,2,3,4,5,6,7,8,9,NA, 1000), 
                'col2'= c(1,2,3,4,5,6,7,8,9,10,11,12,13),
                'col3'= c(-50, 1,2,3,4,5,6,7,8,9,10,11,50000),
                'col4'= c(-100,-200, 1,2,3,4,5,6,7,8,9,10, 1000))
overview(df, quiet=FALSE)
missing_imputer(df, method="median")
flag_outliers(df, threshold=0.2)
get_correlated_features(df, threshold=0.7)
```

## Function descriptions

-   `overview`: This function calculates common descriptive statistical
    values of in the input data. Users can choose the extent of
    information that is returned and have the option to use the function
    as a means to create statistical variables to be used elsewhere in
    the environment.
-   `flag_outliers`: This function helps to display numeric variables
    which contain outliers that exceed a certain user-specified
    threshold percentage, using the interquartile range method. Users
    can then take note of these variables with high percentage of
    outliers and decide what to do with the variable(s).
-   `missing_imputer`:This function aims to detect missing values in the
    numeric data frame and using strategies including drop, mean or
    median to drop missing values or to replace them with the mean or
    median of other values in the same column.
-   `get_correlated_features`:This function will get pairs of features
    which have correlation above a threshold value. We can specify if we
    want to check only the magniture of correlation value or we also
    want to consider sign (positive/ negative).

## Similar Work

In the R open-source ecosystem, there exists some useful packages that
already tackle EDA and preprocessing, but our goal is to make it even
more light-weighted, fast and specifically tailored to present numeric
EDA insights. One popular and useful package that can generate EDA
reports is:

-   [SmartEDA](https://cran.r-project.org/web/packages/SmartEDA/vignettes/SmartEDA.html)

## Contributors

We welcome all contributions and the current main contributors are:

-   Anupriya Srivastava
-   Jiwei Hu
-   Michelle Wang
-   Samuel Quist

## License

Licensed under the terms of the MIT license.
