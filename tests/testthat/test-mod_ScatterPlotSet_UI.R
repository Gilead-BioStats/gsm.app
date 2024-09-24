test_that("mod_ScatterPlotSet_UI creates the expected UI", {
  test_result <- mod_ScatterPlotSet_UI(
    "myID",
    c(mod1 = "a", mod2 = "b", mod3 = "c")
  )
  expect_s3_class(test_result, c("shiny.tag.list", "list"))
  expect_s3_class(test_result[[1]], c("bslib_fragment", "shiny.tag"))
  expect_s3_class(test_result[[2]], c("shiny.tag.list", "list"))
  expect_cleaned_html({
    test_result
  })
})
