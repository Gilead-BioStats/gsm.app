test_that("mod_ParticipantMetricSummary_Server renders correctly without data", {
  call <- rlang::current_env()
  testServer(
    mod_ParticipantMetricSummary_Server,
    args = list(
      rctv_lParticipantMetricData = reactive(list())
    ),
    {
      expect_cleaned_html(
        output$metric_list$html,
        call = call
      )
    }
  )
})

test_that("mod_ParticipantMetricSummary_Server renders correctly with data", {
  call <- rlang::current_env()
  testServer(
    mod_ParticipantMetricSummary_Server,
    args = list(
      rctv_lParticipantMetricData = reactive(list(
        metric1 = data.frame(a = 1:5),
        metric2 = data.frame(b = 6:10)
      ))
    ),
    {
      expect_cleaned_html(
        output$metric_list$html,
        call = call
      )
    }
  )
})

test_that("mod_ParticipantMetricSummary_Server returns selected metric", {
  testServer(
    mod_ParticipantMetricSummary_Server,
    args = list(
      rctv_lParticipantMetricData = reactive(list(
        metric1 = data.frame(a = 1:5),
        metric2 = data.frame(b = 6:10)
      ))
    ),
    {
      # Simulate a selection and check the reactive return
      rctv_toReturn <- session$getReturned()
      expect_s3_class(rctv_toReturn, "reactive")

      # Before any selection, it should be null
      expect_null(rctv_toReturn())

      # Simulate selecting "metric1"

      # See ?shiny::actionLink; this is an "empty" value for that module.
      click0 <- structure(0L, class = "shinyActionButtonValue")
      session$setInputs(`metric_list_choices-metric1` = click0)
      session$setInputs(`metric_list_choices-metric1` = 1L)
      expect_equal(rctv_toReturn(), "metric1")

      # Simulate selecting "metric2"
      session$setInputs(`metric_list_choices-metric2` = 1L)
      expect_equal(rctv_toReturn(), "metric2")
    }
  )
})
