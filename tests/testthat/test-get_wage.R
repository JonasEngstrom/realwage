test_that("get_wage() returns correct value", {
  expect_equal(get_wage(tibble::tibble(year = c(2020, 2021, 2022), month = c(3, 3, 3), salary = c(30000, 30250, 31000)), 2021, 3), 30250)
})
