test_that("mod_GroupDetails_UI() returns the expected UI", {
  test_result <- mod_GroupDetails_UI("group_details")
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
})

test_that("mod_GroupDetails_Server renders group metadata", {
  # Inputs to simulate things that happen in the main server function.
  rctv_strMetricID <- reactiveVal("Analysis_kri0001")
  rctv_strGroupLevel <- reactiveVal("Site")
  rctv_strGroupID <- reactiveVal("0X003")
  rctv_strSubjectID <- reactiveVal("0545")
  rctv_lMetric <- reactive({
    lMetric <- as.list(FilterbyMetricID(sample_dfMetrics, rctv_strMetricID()))
    if (rctv_strGroupID() != "All") {
      lMetric$selectedGroupIDs <- rctv_strGroupID()
    }
    lMetric
  })

  testServer(
    mod_GroupDetails_Server,
    args = list(
      id = "GroupDetailsTest",
      dfGroups = sample_dfGroups,
      dfAnalyticsInput = sample_dfAnalyticsInput,
      rctv_strGroupID = rctv_strGroupID,
      rctv_strGroupLevel = rctv_strGroupLevel,
      rctv_strSubjectID = rctv_strSubjectID,
      rctv_strMetricID = rctv_strMetricID,
      rctv_lMetric = rctv_lMetric
    ),
    {
      # Test that the metadata list renders
      expect_s3_class(output$group_metadata_list$html, "html")
    }
  )
})

test_that("mod_GroupDetails_Server renders participants table", {
  # Inputs to simulate things that happen in the main server function.
  rctv_strMetricID <- reactiveVal("Analysis_kri0001")
  rctv_strGroupLevel <- reactiveVal("Site")
  rctv_strGroupID <- reactiveVal("0X003")
  rctv_strSubjectID <- reactiveVal("0545")
  rctv_lMetric <- reactive({
    lMetric <- as.list(FilterbyMetricID(sample_dfMetrics, rctv_strMetricID()))
    if (rctv_strGroupID() != "All") {
      lMetric$selectedGroupIDs <- rctv_strGroupID()
    }
    lMetric
  })

  testServer(
    mod_GroupDetails_Server,
    args = list(
      id = "GroupDetailsTest",
      dfGroups = sample_dfGroups,
      dfAnalyticsInput = sample_dfAnalyticsInput,
      rctv_strGroupID = rctv_strGroupID,
      rctv_strGroupLevel = rctv_strGroupLevel,
      rctv_strSubjectID = rctv_strSubjectID,
      rctv_strMetricID = rctv_strMetricID,
      rctv_lMetric = rctv_lMetric
    ),
    {
      # Test the participants table renders correctly
      expect_type(output$`participants-gt-table`, "list")
      expect_named(output$`participants-gt-table`, c("html", "deps"))

      # Test the participant table title is correct
      expect_equal(output$`participants-title`, "Site 0X003")
    }
  )
})
