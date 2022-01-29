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
get_correlated_features <- function(x, threshold, consider_sign=FALSE) {

    #Exception handling for input datatypes
    if (!is.data.frame(x)) {
        stop("Feature set (x) should be a dataframe!")
    }
    if (typeof(threshold) != "double") {
        stop("Threshold value should be a number!")
    }
    
    # create empty dataframe for storing correlated features
    colClasses = c("character", "character", "double")
    col.names = c("feature_1", "feature_2", "correlation")
    corr_df <- read.table(text = "",
        colClasses = colClasses,
        col.names = col.names)

    features <- colnames(X)
    for(feat_1 in features) {
        for(feat_2 in features) {
            corr_val_abs <- 0
            corr_val <- round(cor(x[feat_1], x[feat_2]), 2)      # calculate pair-wise correlation
            
            ifelse(consider_sign == FALSE,
                corr_val_abs <- abs(corr_val),
                corr_val_abs <- corr_val)
            
            if (feat_1 != feat_2 & corr_val_abs >= threshold) {
                corr_df[nrow(corr_df) + 1,] = c(feat_1, feat_2, corr_val) # Add correlated pairs to dataframe
            }
        }
    }
    
    return(corr_df)
}