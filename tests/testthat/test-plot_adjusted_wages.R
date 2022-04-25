test_that("plot_adjusted_wages() labels are correct", {
  expect_equal(plot_adjusted_wages(make_inflation_adjusted_wage_table(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000))))$labels$x,
               "Date")
  expect_equal(plot_adjusted_wages(make_inflation_adjusted_wage_table(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000))))$labels$y,
               "Salary (SEK)")
  expect_equal(plot_adjusted_wages(make_inflation_adjusted_wage_table(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000))))$labels$colour,
               "Inflation Adjustment")
  expect_equal(plot_adjusted_wages(make_inflation_adjusted_wage_table(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000))))$labels$linetype,
               "Inflation Adjustment")
  expect_equal(plot_adjusted_wages(make_inflation_adjusted_wage_table(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000))))$labels$title,
               "Salary Adjusted to Swedish Consumer Price Index")
  expect_equal(plot_adjusted_wages(make_inflation_adjusted_wage_table(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000))))$labels$group,
               "series")
})
