test_that("add_adjustment_column() column names are correct", {
  expect_equal(names(add_adjustment_column(get_cpi(), 2010, 03)), c("year", "month", "value", "pct_2010_3"))
})
