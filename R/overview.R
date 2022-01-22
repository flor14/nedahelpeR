#' Gives a statistical overview of the input data,
#' returns a `tibble` of descriptive statistical values.
#'
#' @param input A dataframe or tibble containing numeric data
#' @param verbose Optional boolean value for giving more
#'    information (histogram, estimated distribution), default is FALSE
#' @param quiet Optional boolean value for creating global variables
#'    for use elsewhere in the environment, default is FALSE
#'
#' @return Tibble containing all calculated values
#' @export
#'
#' @examples
#' >>> overview(tibbleX, verbose=TRUE, quiet=FALSE)
#'
overview <- function(input, verbose=FALSE, quiet=FALSE) {

}