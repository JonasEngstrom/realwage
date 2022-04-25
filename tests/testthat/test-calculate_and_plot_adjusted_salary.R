test_that("calculate_and_plot_adjusted_salary() labels are correct", {
  expect_equal(calculate_and_plot_adjusted_salary(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000)))$labels$x,
                                                  "Date")
  expect_equal(calculate_and_plot_adjusted_salary(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000)))$labels$y,
               "Salary (SEK)")
  expect_equal(calculate_and_plot_adjusted_salary(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000)))$labels$colour,
               "Inflation Adjustment")
  expect_equal(calculate_and_plot_adjusted_salary(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000)))$labels$linetype,
               "Inflation Adjustment")
  expect_equal(calculate_and_plot_adjusted_salary(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000)))$labels$title,
               "Salary Adjusted to Swedish Consumer Price Index")
  expect_equal(calculate_and_plot_adjusted_salary(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000)))$labels$group,
               "series")

  expect_equal(calculate_and_plot_adjusted_salary(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000)), start_date = '2020-03-01')$labels$x,
               "Date")
  expect_equal(calculate_and_plot_adjusted_salary(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000)), start_date = '2020-03-01')$labels$y,
               "Salary (SEK)")
  expect_equal(calculate_and_plot_adjusted_salary(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000)), start_date = '2020-03-01')$labels$colour,
               "Inflation Adjustment")
  expect_equal(calculate_and_plot_adjusted_salary(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000)), start_date = '2020-03-01')$labels$linetype,
               "Inflation Adjustment")
  expect_equal(calculate_and_plot_adjusted_salary(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000)), start_date = '2020-03-01')$labels$title,
               "Salary Adjusted to Swedish Consumer Price Index")
  expect_equal(calculate_and_plot_adjusted_salary(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000)), start_date = '2020-03-01')$labels$group,
               "series")

  expect_equal(calculate_and_plot_adjusted_salary(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000)), end_date = '2022-03-01')$labels$x,
               "Date")
  expect_equal(calculate_and_plot_adjusted_salary(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000)), end_date = '2022-03-01')$labels$y,
               "Salary (SEK)")
  expect_equal(calculate_and_plot_adjusted_salary(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000)), end_date = '2022-03-01')$labels$colour,
               "Inflation Adjustment")
  expect_equal(calculate_and_plot_adjusted_salary(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000)), end_date = '2022-03-01')$labels$linetype,
               "Inflation Adjustment")
  expect_equal(calculate_and_plot_adjusted_salary(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000)), end_date = '2022-03-01')$labels$title,
               "Salary Adjusted to Swedish Consumer Price Index")
  expect_equal(calculate_and_plot_adjusted_salary(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000)), end_date = '2022-03-01')$labels$group,
               "series")

  expect_equal(calculate_and_plot_adjusted_salary(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000)), start_date = '2020-03-01', end_date = '2022-03-01')$labels$x,
               "Date")
  expect_equal(calculate_and_plot_adjusted_salary(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000)), start_date = '2020-03-01', end_date = '2022-03-01')$labels$y,
               "Salary (SEK)")
  expect_equal(calculate_and_plot_adjusted_salary(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000)), start_date = '2020-03-01', end_date = '2022-03-01')$labels$colour,
               "Inflation Adjustment")
  expect_equal(calculate_and_plot_adjusted_salary(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000)), start_date = '2020-03-01', end_date = '2022-03-01')$labels$linetype,
               "Inflation Adjustment")
  expect_equal(calculate_and_plot_adjusted_salary(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000)), start_date = '2020-03-01', end_date = '2022-03-01')$labels$title,
               "Salary Adjusted to Swedish Consumer Price Index")
  expect_equal(calculate_and_plot_adjusted_salary(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000)), start_date = '2020-03-01', end_date = '2022-03-01')$labels$group,
               "series")
})
