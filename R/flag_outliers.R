#' Highlight variables containing certain threshold of outliers
#'
#' @param df A dataframe or tibble containing numeric variables
#' @param threshold Threshold (minimum) required to flag variables with outliers
#'
#' @return Tibble containing name of variables and proportion of outliers contained
#' @export
#'
#' @examples
#' df <- data.frame('col1'=c(1,2,3), 'col2'=c(1,2,3))
#' flag_outliers(df, threshold=0.2)
#'
#'
library(purrr)
library(dplyr)

flag_outliers <- function(df, threshold=0.1) {

    # Exception handling and error-checking
    if (!is.data.frame(df)) {
      stop("df argument must be type dataframe")
      }

    if (!is.numeric(threshold)) {
      stop("threshold argument can only be numeric")
      }

    if (threshold<0 | threshold>1) {
      stop("threshold argument must be a numeric value between 0 and 1")
      }

    # Main function body
    percentage_outliers <- function(x) {
      Q1 <- quantile(x, 0.25, na.rm=TRUE)
      Q3 <- quantile(x, 0.75, na.rm=TRUE)
      IQR <- Q3-Q1
      lower <- Q1 - (1.5 * IQR)
      upper <- Q3 + (1.5 * IQR)

      # sum elements where x are below lower, or above upper
      sum(x < lower | x > upper)/ length(x)
    }

    all_df <- map_df(df, percentage_outliers)
    all_df[which(all_df>threshold)]

}



