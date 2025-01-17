test_that("mod_DomainDetails_Server sets domain", {
  # There really isn't much to test in this server until/unless we use the
  # returned data.
  testServer(
    mod_DomainDetails_Server,
    args = list(
      id = "domainDetailsTest",
      l_rctvDomains = list(),
      rctv_strDomainID = shiny::reactiveVal("z")
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
