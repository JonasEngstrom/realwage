test_that("get_cpi() column names are correct", {
  expect_equal(names(get_cpi()), c("year", "month", "value"))
})
