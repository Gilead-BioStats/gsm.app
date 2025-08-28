test_that("mod_SelectDataCategory_UI creates the expected UI", {
  test_result <- mod_SelectDataCategory_UI("test")
  expect_s3_class(test_result, "shiny.tag")
  expect_cleaned_html({
    test_result
  })
})

test_that("mod_SelectDataCategory_Server orchestrates the input", {
  rctv_dfDomain <- reactiveVal()
  testServer(
    mod_SelectDataCategory_Server,
    args = list(
      rctv_dfDomain = rctv_dfDomain
    ),
    {
      rctv_toReturn <- session$getReturned()
      expect_s3_class(rctv_toReturn, "reactive")
      expect_null(rctv_toReturn())

      rctv_dfDomain(dfStudyPrevalencePlots)
      session$flushReact()
      expect_identical(rctv_chrCategoricalFields(), c("Category" = "category"))
    }
  )
})
