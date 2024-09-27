test_that("gsmApp_Server initializes correctly and updates rctv_lMetric", {
  server <- gsmApp_Server(
    dfResults = sample_dfResults,
    dfGroups = sample_dfGroups,
    dfMetrics = sample_dfMetrics,
    dfBounds = sample_dfBounds,
    dfAnalyticsInput = sample_dfAnalyticsInput,
    fnFetchParticipantData = sample_FetchParticipantData
  )
  testServer(
    server,
    {
      # Simulation initialization.
      session$setInputs(
        primary_nav_bar  = "Study Overview",
        metric = "kri0001",
        site = "None",
        participant = "None"
      )
      expect_equal(input$metric, "kri0001")
      expect_null(rctv_lMetric()$selectedGroupIDs)

      session$setInputs(
        site = "0X001"
      )
      expect_equal(rctv_lMetric()$selectedGroupIDs, "0X001")
    }
  )
})

test_that("gsmApp_Server triggers srvr_SyncSelectizeInput", {
  # This doesn't really TEST the functionality, only that it triggers. Needs UI
  # integration (shinytest2 integration tests) to fully test.
  server <- gsmApp_Server(
    dfResults = sample_dfResults,
    dfGroups = sample_dfGroups,
    dfMetrics = sample_dfMetrics,
    dfBounds = sample_dfBounds,
    dfAnalyticsInput = sample_dfAnalyticsInput,
    fnFetchParticipantData = sample_FetchParticipantData
  )
  testServer(
    server,
    {
      # Simulation initialization.
      session$setInputs(
        primary_nav_bar  = "Study Overview",
        metric = "kri0001",
        site = "None",
        participant = "None"
      )
      expect_equal(input$participant, "None")

      session$setInputs(
        site = "0X001",
        `site_details-participants-participant` = "0664"
      )
    }
  )
})

test_that("gsmApp_Server triggers reset", {
  # This doesn't really TEST the functionality, only that it triggers. Needs UI
  # integration (shinytest2 integration tests) to fully test.
  server <- gsmApp_Server(
    dfResults = sample_dfResults,
    dfGroups = sample_dfGroups,
    dfMetrics = sample_dfMetrics,
    dfBounds = sample_dfBounds,
    dfAnalyticsInput = sample_dfAnalyticsInput,
    fnFetchParticipantData = sample_FetchParticipantData
  )
  testServer(
    server,
    {
      # Simulation initialization.
      session$setInputs(
        primary_nav_bar  = "Study Overview",
        metric = "kri0001",
        site = "None",
        participant = "None"
      )
      expect_equal(input$site, "None")

      # Change something from default.
      session$setInputs(site = "0X001")
      expect_equal(input$site, "0X001")

      session$setInputs(reset = 1L)
      # Ideally we'd check inputs here, but testServer doesn't see the change.
    }
  )
})
