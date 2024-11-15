test_that("mod_TogglePill_UI creates the expected UI", {
  test_result <- mod_TogglePill_UI(
    "toggle_pill_id",
    "12 Red KRIs",
    colorScheme("red")
  )
  expect_s3_class(test_result, c("shiny.tag.list", "list"))
  expect_length(test_result, 2)
  expect_s3_class(test_result[[1]], "shiny.tag")
  expect_s3_class(test_result[[2]], c("shiny.tag.list", "list"))
  expect_s3_class(test_result[[2]][[1]], "html_dependency")
  expect_s3_class(test_result[[2]][[2]], "html_dependency")
  expect_cleaned_html({
    test_result
  })
})
