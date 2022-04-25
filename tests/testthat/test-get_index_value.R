test_that("get_index_value() returns correct value", {
  expect_equal(get_index_value(get_cpi(), 2018, 4), 327.1)
})
