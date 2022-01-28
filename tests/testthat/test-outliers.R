# Setting up toy data for testing

df <- data.frame('col1' = c(-100,-200, 1,2,3,4,5,6,7,8,9,10,1000),
                 'col2' = c(1,2,3,4,5,6,7,8,9,10,11,12,13),
                 'col3' = c(-50, 1,2,3,4,5,6,7,8,9,10,11,50000))


# Testing inputs

test_that("Input datatype must be of type dataframe", {
  expect_error(flag_outliers("123"))
  expect_error(flag_outliers(c(1,2,3,4,5)))
})

test_that("Threshold must be a numeric input between 0 and 1", {
  expect_error(flag_outliers(df, threshold=10))
})


# Testing outputs

test_that("Outlier percentage outputs are incorrect", {
  expect_equal(round(flag_outliers(df)$col1, 2), 0.23)
  expect_equal(round(flag_outliers(df, threshold = 0.1)$col3, 2), 0.15)
})
