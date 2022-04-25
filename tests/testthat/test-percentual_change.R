test_that("percentual_change() returns correct values", {
  expect_equal(percentual_change(100, 110), 0.1)
  expect_equal(percentual_change(100, 90), -0.1)
  expect_equal(percentual_change(0, 110), Inf)
})
