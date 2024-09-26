test_that("out_Card generates the expected card", {
  test_result <- out_Card("Test card", div("Stuff"))
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html(test_result)
})

test_that("out_Placeholder generates a placeholder card", {
  test_result <- out_Placeholder("thing and another thing")
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html(test_result)
})

test_that("out_Placeholder accepts a vector of requirements", {
  test_result <- out_Placeholder(c("thing", "other thing"))
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html(test_result)
})

test_that("out_CardSubtitle wraps text into a subtitle", {
  test_result <- out_CardSubtitle("Test subtitle")
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html(test_result)
})

test_that("out_CardSubtitle uses extra classes", {
  test_result <- out_CardSubtitle("Test subtitle", "spacer-class")
  expect_cleaned_html(test_result)
})
