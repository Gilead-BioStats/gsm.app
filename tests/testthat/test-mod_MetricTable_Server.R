test_that("mod_MetricTable_Server starts as expected", {
  call <- rlang::current_env()

  dfResults <- filter_byMetricID(
    sample_dfResults[sample_dfResults$GroupLevel == "Site", ],
    "kri0001"
  )
  dfGroups <- sample_dfGroups

  testServer(
    mod_MetricTable_Server,
    args = list(
      id = "testingModMetricTable",
      rctv_dfResults = reactive(dfResults),
      dfGroups = dfGroups,
      rctv_strSiteID = reactive("None")
    ),
    {
      test_result <- output$table
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

test_that("mod_MetricTable_Server returns selected site", {
  dfResults <- filter_byMetricID(
    sample_dfResults[sample_dfResults$GroupLevel == "Site", ],
    "kri0001"
  )
  dfGroups <- sample_dfGroups

  testServer(
    mod_MetricTable_Server,
    args = list(
      id = "testingModMetricTable",
      rctv_dfResults = reactive(dfResults),
      dfGroups = dfGroups,
      rctv_strSiteID = reactive("None")
    ),
    {
      expect_null(input$table)
      expect_equal(session$returned(), "None")
      session$setInputs(table = "0X003")
      expect_equal(session$returned(), "0X003")
    }
  )
})
