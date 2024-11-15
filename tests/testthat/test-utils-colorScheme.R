test_that("colorScheme loads the expected colors", {
  expect_equal(colorScheme("gray"), "#828282")
  expect_equal(colorScheme("green"), "#3DAF06")
  expect_equal(colorScheme("amber"), "#FEAA02")
  expect_equal(colorScheme("red"), "#FF5859")
  expect_equal(colorScheme(), "#828282")

  expect_equal(colorScheme("gray", "light"), "#E5E5E5")
  expect_equal(colorScheme("green", "light"), "#9ED782")
  expect_equal(colorScheme("amber", "light"), "#FED480")
  expect_equal(colorScheme("red", "light"), "#FFABAC")
  expect_equal(colorScheme(strColorFamily = "light"), "#E5E5E5")
})
