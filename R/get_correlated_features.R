#' Calculate correlation between all feature pairs in the numeric dataframe.
#' Returns feature pairs having correlation higher than the threshold value.
#'
#' @param X Input DataFrame or tibble containing numeric variables
#' @param threshold Float value for correlation above which feature pairs will be returned
#' @param consider_sign (boolean) determines whether correlation value has to be checked for magnitude
#'        only or for sign (positive/ negative) also. Default checks only the magnitude.
#'        
#' @return DataFrame Tibble containing containing feature1, feature2, and corresponding correlation.
#'
#' @examples
#' X <- data.frame('age'=c(23, 13, 7, 45), 
#'                 'height'=c(1.65, 1.23, 0.96, 1.55)
#'                 'income'=c(20, 120, 120, 25))
#' get_correlated_features(X, threshold=0.7)
#'
get_correlated_features <- function(X, threshold, consider_sign=FALSE) {

}