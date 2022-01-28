# Creating test data and expected output for the test function


test_df <- data.frame('col1' = c(1, 2 , 3, 4, 5, 6, NA, 14),
  'col2'= c(-10, -9, -8, -7, NA, -5, -4, 1),
  'col3'= c(NA, 0.1, 0.2, NA, 0.3, NA, 0.4, 0.05),
  'col4'= c(-100, -1000, -10000, 2, 4, 6, 8, 10))

expected_mean <- tibble::tibble('col1' = c(1, 2 , 3, 4, 5, 6, 5, 14),
                                        'col2'= c(-10, -9, -8, -7, -6, -5, -4, 1),
                                        'col3'= c(0.21, 0.1, 0.2, 0.21, 0.3, 0.21, 0.4, 0.05),
                                        'col4'= c(-100, -1000, -10000, 2, 4, 6, 8, 10))

expected_drop <- tibble::tibble('col1' = c(2 , 3, 14),
                                       'col2'= c(-9, -8, 1),
                                       'col3'= c(0.10, 0.20, 0.05),
                                       'col4'= c(-1000, -10000, 10))

expected_median <- tibble::tibble('col1' = c(1, 2 , 3, 4, 5, 6, 4, 14),
                                       'col2'= c(-10, -9, -8, -7, -7, -5, -4, 1),
                                       'col3'= c(0.20, 0.10, 0.20, 0.20, 0.30, 0.20, 0.40, 0.05),
                                       'col4'= c(-100, -1000, -10000, 2, 4, 6, 8, 10))


# Tests on toy data
test_that("missing_imputer works with the test dataframe", {

  # test default arguments(method = "mean")
  expect_equal(missing_imputer(test_df), expected_mean, ignore_attr = TRUE)

  # test arguments method = "drop"
  expect_equal(missing_imputer(test_df, method = "drop"), expected_drop, ignore_attr = TRUE)

  # test arguments method = "median"
  expect_equal(missing_imputer(test_df, method = "median"), expected_median, ignore_attr = TRUE)

})

# tests on exception handling
test_that("Wrong input data type should raise an error", {
  expect_error(missing_imputer(c("a","b","c")))
  expect_error(missing_imputer(1000))
})

test_that("Non-numeric data should raise an error", {
  expect_error(missing_imputer(data.frame(x =c(1, NA, 2, 3), y= c('a', 'b', NA, 'c'))))
})

test_that("If the argument 'method' is not a valid option, it should throw an error", {
  expect_error(missing_imputer(test_df, method ="med"))
})
