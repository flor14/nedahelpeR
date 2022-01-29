# Test dataset
X <- data.frame('age'=c(23, 13, 7, 45), 
                'height'=c(1.65, 1.23, 0.96, 1.55), 
                'income'=c(20, 120, 120, 25))

# Testing input datatypes
test_that("Input datatype must be of type dataframe!", {
    expect_error(get_correlated_features(c('32', '45', 'a')))
    expect_error(get_correlated_features("abc"))
})

test_that("Threshold must be a number!", {
  expect_error(get_correlated_features(X, threshold="abc"))
})

# Testing output accuracy
test_that("Output should return 6 rows!", {
  expect_equal(nrow(get_correlated_features(X, threshold = 0.7)), 6)
})