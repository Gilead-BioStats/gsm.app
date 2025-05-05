test_that("mod_DomainSummary_UI produces the expected UI", {
  test_result <- mod_DomainSummary_UI("counts")
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
})

test_that("mod_DomainSummary_Server outputs the expected result", {
  call <- rlang::current_env()
  testServer(
    mod_DomainSummary_Server,
    args = list(
      id = "counts",
      rctv_strDomainID = reactiveVal("None"),
      rctv_intDomainCounts = reactiveVal(c(AE = 14L, ENROLL = 3L)),
      chrDomains = c(AE = "Adverse Events", ENROLL = "Enrollment")
    ),
    {
      # Check that the domain summary UI is rendered correctly
      expect_cleaned_html(output$domain_list$html, call = call)

      # Setting an input updates the RV.
      session$setInputs(
        `domain_list_choices-AE` = 1L
      )
      expect_equal(rctv_strDomainID(), "AE")

      session$setInputs(
        `domain_list_choices-ENROLL` = 1L
      )
      expect_equal(rctv_strDomainID(), "ENROLL")
    }
  )
})
