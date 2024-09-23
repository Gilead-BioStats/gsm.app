test_that("mod_ScatterPlot_UI creates the expected UI", {
  expect_cleaned_html({
    test_result <- mod_ScatterPlot_UI(strID = "myID")
    class(test_result) <- "shiny.tag"
    test_result
  })
})

test_that("mod_ScatterPlot_UI uses title when it's supplied", {
  test_result <- mod_ScatterPlot_UI(strID = "myID", strPlotTitle = "myTitle")
  expect_identical(
    test_result$children[[1]]$attribs$class,
    "card-header"
  )
  expect_identical(
    test_result$children[[1]]$children[[1]],
    "myTitle"
  )
  expect_cleaned_html({
    test_result <- mod_ScatterPlot_UI(strID = "myID", strPlotTitle = "myTitle")
    class(test_result) <- "shiny.tag"
    test_result
  })
})
