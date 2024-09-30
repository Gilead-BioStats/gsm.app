test_that("mod_SiteDetails_Server renders site metadata", {
  # Inputs to simulate things that happen in the main server function.
  rctv_input_metric <- reactiveVal("kri0001")
  rctv_input_site <- reactiveVal("0X003")
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
  rctv_input_metric <- reactiveVal("kri0001")
  rctv_input_site <- reactiveVal("0X003")
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
      rctv_strMetricID = rctv_input_metric,
      rctv_lMetric = rctv_lMetric
    ),
    {
      # Test the participants table renders correctly
      expect_s3_class(output$participants, "json")

      # Test the participant table title is correct
      expect_equal(output$participant_table_title, "Site 0X003")
    }
  )
})

test_that("mod_SiteDetails_Server returns selected participant", {
  rctv_input_metric <- reactiveVal("kri0001")
  rctv_input_site <- reactiveVal("0X003")
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
      rctv_strMetricID = rctv_input_metric,
      rctv_lMetric = rctv_lMetric
    ),
    {
      # Simulate selecting a participant
      session$setInputs(`participants-participant` = "Participant001")

      # Ensure the module returns the selected participant
      rctv_selectedParticipant <- session$getReturned()
      expect_s3_class(rctv_selectedParticipant, "reactive")
      expect_equal(rctv_selectedParticipant(), "Participant001")
    }
  )
})
