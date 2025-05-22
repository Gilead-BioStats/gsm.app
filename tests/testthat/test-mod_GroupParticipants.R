test_that("mod_GroupParticipants_UI() creates the expected object", {
  test_result <- mod_GroupParticipants_UI("myUI")
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
})

test_that("mod_GroupParticipants_Server starts as expected", {
  call <- rlang::current_env()
  dfAnalyticsInput <- FilterbyMetricID(
    sample_dfAnalyticsInput,
    "Analysis_kri0001"
  ) %>%
    FilterByLatestIfPresent()
  rctv_strGroupID <- reactiveVal("All")

  testServer(
    mod_GroupParticipants_Server,
    args = list(
      id = "testingModGroupParticipants",
      rctv_strGroupID = rctv_strGroupID,
      rctv_strSubjectID = reactive("All"),
      rctv_dfAnalyticsInput = reactive(dfAnalyticsInput),
      rctv_lColumnNames = reactive({
        list(
          Numerator = "Num", Denominator = "Den", Metric = "Metr"
        )
      })
    ),
    {
      test_result <- output$`gt-table`
      expect_type(test_result, "list")
      expect_named(test_result, c("html", "deps"))
      test_html <- test_result$html
      gt_id <- stringr::str_extract(test_html, 'div id="(\\w+)"', 1)
      test_html <- stringr::str_replace_all(test_html, gt_id, "gtRandID")
      expect_cleaned_html(
        test_html,
        call = call
      )

      rctv_strGroupID("0X7121")
      test_result <- output$`gt-table`
      expect_type(test_result, "list")
      expect_named(test_result, c("html", "deps"))
      test_html <- test_result$html
      gt_id <- stringr::str_extract(test_html, 'div id="(\\w+)"', 1)
      test_html <- stringr::str_replace_all(test_html, gt_id, "gtRandID")
      expect_cleaned_html(
        test_html,
        call = call
      )
    }
  )
})

test_that("mod_GroupParticipants_Server returns selected participant", {
  dfAnalyticsInput <- FilterbyMetricID(
    sample_dfAnalyticsInput,
    "Analysis_kri0001"
  ) %>%
    FilterByLatestIfPresent()

  testServer(
    mod_GroupParticipants_Server,
    args = list(
      id = "testingModGroupParticipants",
      rctv_strGroupID = reactive("All"),
      rctv_strSubjectID = reactive("All"),
      rctv_dfAnalyticsInput = reactive(dfAnalyticsInput),
      rctv_lColumnNames = reactive({
        list(
          Numerator = "Num", Denominator = "Den", Metric = "Metr"
        )
      })
    ),
    {
      expect_null(input$`gt-table`)
      expect_null(session$returned())
      # Without this I don't think the gt data registers properly.
      session$flushReact()
      session$setInputs(`gt-table` = 3L)
      expect_equal(session$returned(), "S73894")
      session$setInputs(`gt-table` = 0L)
      expect_equal(session$returned(), "All")
      session$setInputs(`gt-table` = NULL)
      expect_null(session$returned())
    }
  )
})
