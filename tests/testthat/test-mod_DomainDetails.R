test_that("mod_DomainDetails_UI() returns the expected UI", {
  test_result <- mod_DomainDetails_UI("domain_details")
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
})

test_that("mod_DomainDetails_Server sets domain", {
  # There really isn't much to test in this server until/unless we use the
  # returned data.

  testServer(
    mod_DomainDetails_Server,
    args = list(
      id = "domainDetailsTest",
      l_rctvDomains = list(),
      rctv_strDomainID = reactiveVal("z"),
      chrDomains = c(a = "a", b = "b", z = "z")
    ),
    {
      # Initialize input.
      session$setInputs(
        selected_tab = "z"
      )
      session$setInputs(
        selected_tab = "a"
      )
      expect_identical(rctv_strDomainID(), "a")
      session$setInputs(
        selected_tab = "b"
      )
      expect_identical(rctv_strDomainID(), "b")
    }
  )
})
