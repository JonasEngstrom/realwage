test_that("adjust_for_inflation() column names are correct", {
  expect_equal(names(adjust_for_inflation(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000)), get_cpi())),
               c("year", "month", "value", "pct_2020_3", "wage_2020_3", "pct_2021_3", "wage_2021_3", "pct_2022_3", "wage_2022_3"))
})
