# Create test data
df <- tibble('col1' = c(1,2,3,4,5,6,7,8,9,10),
             'col2' = c(11,22,33,44,55,66,77,88,99,1000),
             'col3' = c(0,0,0,0,0,0,0,0,0,1))

# Test input exceptions
test_that("Input data is correctly flagged if not acceptable", {
    expect_error(overview(50))
    expect_error(overview(df,quiet=2))
})

df_nn <- tibble('col1' = c(1,2,3,4,5,6,7,8,9,10),
             'col2' = c(11,"twentytwo",33,44,55,66,77,88,99,1000),
             'col3' = c(0,0,0,0,0,0,0,0,0,1))
test_that("Non numeric input is flagged", {
    expect_error(overview(df_nn))
})

# Test output accuracy
test_that("Output yields correct values", {
    expect_equal(round(sum(overview(df_nn)$mean),2), 155.1)
    expect_equal(nrow(overview(df_nn)),ncol(df_nn))
    expect_equal(round(sum(overview(df_nn)[3]),2), 303.53)
})