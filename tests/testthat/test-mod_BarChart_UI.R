test_that("mod_BarChart_UI creates the expected UI", {
  test_result <- mod_BarChart_UI("myID")
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
})

test_that("mod_BarChart_UI uses title when it's supplied", {
  test_result <- mod_BarChart_UI("myID", strPlotTitle = "myTitle")
  expect_identical(
    test_result$children[[1]]$attribs$class,
    "card-header"
  )
  expect_identical(
    test_result$children[[1]]$children[[1]],
    "myTitle"
  )
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
})
