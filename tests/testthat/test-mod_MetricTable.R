test_that("mod_MetricTable_UI creates the expected UI", {
  test_result <- mod_MetricTable_UI("myID")
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
})

test_that("mod_MetricTable_Server starts as expected", {
  call <- rlang::current_env()

  dfResults <- FilterbyMetricID(
    sample_dfResults[sample_dfResults$GroupLevel == "Site", ],
    "Analysis_kri0001"
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

test_that("mod_MetricTable_Server works with no flags", {
  call <- rlang::current_env()

  dfResults <- FilterbyMetricID(
    sample_dfResults[sample_dfResults$GroupLevel == "Site", ],
    "Analysis_kri0008"
  )
  dfResults <- dplyr::filter(dfResults, Flag == 0)
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
