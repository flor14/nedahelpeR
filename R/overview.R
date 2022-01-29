#' Gives a statistical overview of the input data,
#' returns a `data.frame` of descriptive statistical values.
#'
#' @param input A dataframe or tibble containing numeric data
#' @param quiet Optional boolean value for creating global variables
#'    for use elsewhere in the environment, default is FALSE
#'
#' @return Data.frame containing all calculated values
#' @export
#'
#' @examples
#' df <- data.frame('col1'=c(1,2,3), 'col2'=c(2,3,6))
#' overview(df, quiet=FALSE)
#'
overview <- function(input, quiet=FALSE) {
    if (!is.data.frame(input)) {
        stop("Data type must be data.frame or tibble")
    }
    
    if (!ncol(input |> dplyr::select_if(is.numeric)) == ncol(input)){
        stop("Input data must only be numeric")
    }
    
    if (!is.logical(quiet)){
        stop("Parameter `quiet` must be logical type")
    }
    means <- c()
    medians <- c()
    stds <- c()
    variances <- c()
    for (col in colnames(input)){
        means <- c(means,mean_=map_dbl(input[col],.f=mean))
        medians <- c(medians,median_=map_dbl(input[col],.f=median))
        stds <- c(stds,std_=map_dbl(input[col],.f=sd))
        variances <- c(variances,var_=map_dbl(input[col],.f=var))
    }
    df <- data.frame('mean'=means,
                'median'=medians,
                'standard dev'=stds,
                'variance'=variances)
    rownames(df) <- colnames(input);
    if(quiet){
        return(invisible(df))
    }
    else{
        return(df)
    }
}