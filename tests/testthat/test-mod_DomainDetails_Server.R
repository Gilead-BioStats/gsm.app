test_that("mod_DomainDetails_Server returns selected tab", {
  # There really isn't much to test in this server until/unless we use the
  # returned data.
  testServer(
    mod_DomainDetails_Server,
    args = list(
      id = "domainDetailsTest",
      l_rctvDomains = list()
    ),
    {
      session$setInputs(
        selected_tab = "a"
      )
      expect_identical(session$returned(), "a")
      session$setInputs(
        selected_tab = "b"
      )
      expect_identical(session$returned(), "b")
    }
  )
})
