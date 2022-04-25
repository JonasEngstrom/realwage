test_that("add_wage_column() column names are correct", {
  expect_equal(names(add_wage_column(add_adjustment_column(get_cpi(), 2020, 3), tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000)), 2020, 3)),
               c("year", "month", "value", "pct_2020_3", "wage_2020_3"))
})
