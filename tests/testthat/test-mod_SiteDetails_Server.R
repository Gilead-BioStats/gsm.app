test_that("mod_SiteDetails_Server renders site metadata", {
  # Inputs to simulate things that happen in the main server function.
  rctv_input_metric <- reactiveVal("Analysis_kri0001")
  rctv_input_site <- reactiveVal("0X003")
  rctv_input_subject <- reactiveVal("0545")
  rctv_lMetric <- reactive({
    lMetric <- as.list(filter_byMetricID(sample_dfMetrics, rctv_input_metric()))
    if (rctv_input_site() != "None") {
      lMetric$selectedGroupIDs <- rctv_input_site()
    }
    lMetric
  })

  testServer(
    mod_SiteDetails_Server,
    args = list(
      id = "siteDetailsTest",
      dfGroups = sample_dfGroups,
      dfAnalyticsInput = sample_dfAnalyticsInput,
      rctv_strSiteID = rctv_input_site,
      rctv_strSubjectID = rctv_input_subject,
      rctv_strMetricID = rctv_input_metric,
      rctv_lMetric = rctv_lMetric
    ),
    {
      # Test that the metadata list renders
      expect_s3_class(output$site_metadata_list$html, "html")
    }
  )
})

test_that("mod_SiteDetails_Server renders participants table", {
  # Inputs to simulate things that happen in the main server function.
  rctv_input_metric <- reactiveVal("Analysis_kri0001")
  rctv_input_site <- reactiveVal("0X003")
  rctv_input_subject <- reactiveVal("0545")
  rctv_lMetric <- reactive({
    lMetric <- as.list(filter_byMetricID(sample_dfMetrics, rctv_input_metric()))
    if (rctv_input_site() != "None") {
      lMetric$selectedGroupIDs <- rctv_input_site()
    }
    lMetric
  })

  testServer(
    mod_SiteDetails_Server,
    args = list(
      id = "siteDetailsTest",
      dfGroups = sample_dfGroups,
      dfAnalyticsInput = sample_dfAnalyticsInput,
      rctv_strSiteID = rctv_input_site,
      rctv_strSubjectID = rctv_input_subject,
      rctv_strMetricID = rctv_input_metric,
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
