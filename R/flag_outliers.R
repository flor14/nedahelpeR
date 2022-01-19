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
flag_outliers <- function(df, threshold=0.1) {

}
