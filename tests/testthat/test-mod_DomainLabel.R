test_that("mod_DomainLabel_UI() returns the expected UI", {
  test_result <- mod_DomainLabel_UI("myDomain", "Adverse Events", "AE")
  expect_s3_class(test_result, c("html", "character"))
  expect_cleaned_html({
    test_result
  })
})

test_that("mod_DomainLabel_Server outputs the expected result", {
  # call <- rlang::current_env()
  testServer(
    mod_DomainLabel_Server,
    args = list(
      id = "ae_count",
      rctv_intDomainCount = reactiveVal(14L)
    ),
    {
      # Check that the count is rendered correctly
      expect_snapshot(output$count)

      # Check that the value is as expected.
      expect_equal(as.integer(output$count$html), 14)

      rctv_intDomainCount(27L)
      session$flushReact()
      expect_equal(as.integer(output$count$html), 27)
    }
  )
})
