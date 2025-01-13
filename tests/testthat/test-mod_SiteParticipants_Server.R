test_that("mod_SiteParticipants_Server starts as expected", {
  call <- rlang::current_env()
  dfAnalyticsInput <- filter_byMetricID(
    sample_dfAnalyticsInput,
    "Analysis_kri0001"
  )
  rctv_strGroupID <- reactiveVal("None")

  testServer(
    mod_SiteParticipants_Server,
    args = list(
      id = "testingModSiteParticipants",
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

      rctv_strGroupID("0X003")
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

test_that("mod_SiteParticipants_Server returns selected participant", {
  dfAnalyticsInput <- filter_byMetricID(
    sample_dfAnalyticsInput,
    "Analysis_kri0001"
  )

  testServer(
    mod_SiteParticipants_Server,
    args = list(
      id = "testingModSiteParticipants",
      rctv_strGroupID = reactive("None"),
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
      expect_equal(session$returned(), "0010")
      session$setInputs(`gt-table` = 0L)
      expect_equal(session$returned(), "All")
      session$setInputs(`gt-table` = NULL)
      expect_null(session$returned())
    }
  )
})
