#' Return the imputed version of data based on the methods selected
#'
#' @param data The raw data with missing values
#' @param method The method used to impute the missing values
#'
#' @return An imputed dataframe with the method specified
#' @export
#'
#' @examples
#' missing_imputer(data , method = "median")
#'
#'


missing_imputer <- function(data, method = "mean") {

  # check if data type is a dataframe
  if (!is.data.frame(data)) {
    stop("Data type is not a dataframe")
  }

  # check if all the dataframe elements are numeric
  num_data <-  data |> dplyr::select_if(is.numeric)
  if (!ncol(data) == ncol(num_data)) {
    stop("Some of the columns in the data are not numeric")
  }

  # check if method is one of the options
  if (!is.element(method, c('drop', 'mean', 'median'))) {
    stop("method should be one of the options: 'drop', 'mean', 'median'")
  }

  df <- data.table::copy(data)
  # method = "drop"
  if (method == "drop") {
    df <- tidyr::drop_na(df)
  }
  # method = "mean"
  else if (method == "mean") {
    for(col in colnames(df)) {
      df[col]  <-  lapply(df[col], function(x) {
        x[is.na(x)] <- mean(x, na.rm = TRUE)
        return(x)})
    }
  }
  # method = "median"
  else if (method == "median") {
    for(col in colnames(df)) {
      df[col]  <-  lapply(df[col], function(x) {
        x[is.na(x)] <- median(x, na.rm = TRUE)
        return(x)})
    }
  }

  return(df)
}
