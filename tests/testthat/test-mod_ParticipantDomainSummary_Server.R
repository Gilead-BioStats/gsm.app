test_that("mod_ParticipantDomainSummary_Server renders correctly without data", {
  call <- rlang::current_env()
  testServer(
    mod_ParticipantDomainSummary_Server,
    args = list(
      rctv_lParticipantDomainData = reactive(list())
    ),
    {
      expect_cleaned_html(
        output$domain_list$html,
        call = call
      )
    }
  )
})

test_that("mod_ParticipantDomainSummary_Server renders correctly with data", {
  call <- rlang::current_env()
  testServer(
    mod_ParticipantDomainSummary_Server,
    args = list(
      rctv_lParticipantDomainData = reactive(list(
        domain1 = data.frame(a = 1:5),
        domain2 = data.frame(b = 6:10)
      ))
    ),
    {
      expect_cleaned_html(
        output$domain_list$html,
        call = call
      )
    }
  )
})

test_that("mod_ParticipantDomainSummary_Server returns selected domain", {
  testServer(
    mod_ParticipantDomainSummary_Server,
    args = list(
      rctv_lParticipantDomainData = reactive(list(
        domain1 = data.frame(a = 1:5),
        domain2 = data.frame(b = 6:10)
      ))
    ),
    {
      # Simulate a selection and check the reactive return
      rctv_toReturn <- session$getReturned()
      expect_s3_class(rctv_toReturn, "reactive")

      # Before any selection, it should be null
      expect_null(rctv_toReturn())

      # Simulate selecting "domain1"

      # See ?shiny::actionLink; this is an "empty" value for that module.
      click0 <- structure(0L, class = "shinyActionButtonValue")
      session$setInputs(`domain_list_choices-domain1` = click0)
      session$setInputs(`domain_list_choices-domain1` = 1L)
      expect_equal(rctv_toReturn(), "domain1")

      # Simulate selecting "domain2"
      session$setInputs(`domain_list_choices-domain2` = 1L)
      expect_equal(rctv_toReturn(), "domain2")
    }
  )
})
