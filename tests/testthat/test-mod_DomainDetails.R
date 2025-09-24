test_that("mod_DomainDetails_UI() returns the expected UI", {
  test_result <- mod_DomainDetails_UI("domain_details")
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
})

test_that("mod_DomainDetails_Server sets domain", {
  testServer(
    mod_DomainDetails_Server,
    args = list(
      id = "domainDetailsTest",
      l_rctvDomains = list(),
      l_rctvDomainHashes_Selection = list(),
      rctv_strDomainID = reactiveVal("z"),
      rctv_intDomainCounts = reactiveVal(c(1L, 1L, 1L)),
      rctv_strGroupLevel = reactiveVal("Site"),
      chrDomains = c(a = "a", b = "b", z = "z"),
      rctv_strGroupID = reactiveVal(),
      rctv_strSubjectID = reactiveVal(),
      rctv_strPrimaryNavBar = reactiveVal("Domain Details"),
      l_rctvDomainsLoaded = list(Study = reactiveVal(TRUE))
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
