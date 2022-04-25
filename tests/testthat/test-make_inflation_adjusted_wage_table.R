test_that("make_inflation_adjusted_wage_table() column names are correct", {
  expect_equal(names(make_inflation_adjusted_wage_table(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000)))),
               c("date", "series", "value"))
})
