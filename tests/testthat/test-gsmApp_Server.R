test_that("gsmApp_Server initializes correctly", {
  server <- gsmApp_Server(
    dfAnalyticsInput = sample_dfAnalyticsInput,
    dfBounds = sample_dfBounds,
    dfGroups = sample_dfGroups,
    dfMetrics = sample_dfMetrics,
    dfResults = sample_dfResults,
    fnFetchData = sample_fnFetchData
  )
  testServer(
    server,
    {
      # Simulate initialization.
      session$setInputs(
        primary_nav_bar = "Study Overview",
        metric = "Analysis_kri0001",
        site = "None",
        participant = "All"
      )
      expect_equal(input$metric, "Analysis_kri0001")

      session$setInputs(
        site = "0X001"
      )
      expect_equal(input$site, "0X001")
    }
  )
})

test_that("gsmApp_Server triggers reset", {
  # This doesn't really TEST the functionality, only that it triggers. Needs UI
  # integration (shinytest2 integration tests) to fully test.
  server <- gsmApp_Server(
    dfAnalyticsInput = sample_dfAnalyticsInput,
    dfBounds = sample_dfBounds,
    dfGroups = sample_dfGroups,
    dfMetrics = sample_dfMetrics,
    dfResults = sample_dfResults,
    fnFetchData = sample_fnFetchData
  )
  testServer(
    server,
    {
      # Simulation initialization.
      session$setInputs(
        primary_nav_bar = "Study Overview",
        metric = "Analysis_kri0001",
        site = "None",
        participant = "All"
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

test_that("gsmApp_Server executes optional server functions", {
  server <- gsmApp_Server(
    dfResults = sample_dfResults,
    dfGroups = sample_dfGroups,
    dfMetrics = sample_dfMetrics,
    dfBounds = sample_dfBounds,
    dfAnalyticsInput = sample_dfAnalyticsInput,
    fnFetchData = sample_fnFetchData,
    fnServer = function(input, output, session) {
      rctv_testVal <<- reactiveVal("testing")
    }
  )
  testServer(
    server,
    {
      expect_s3_class(rctv_testVal, "reactiveVal")
      expect_equal(rctv_testVal(), "testing")
    }
  )
})

test_that("gsmApp_Server sets participant drop-down properly", {
  server <- gsmApp_Server(
    dfAnalyticsInput = sample_dfAnalyticsInput,
    dfBounds = sample_dfBounds,
    dfGroups = sample_dfGroups,
    dfMetrics = sample_dfMetrics,
    dfResults = sample_dfResults,
    fnFetchData = sample_fnFetchData
  )
  testServer(
    server,
    {
      # Simulate initialization.
      session$setInputs(
        primary_nav_bar = "Study Overview",
        metric = "Analysis_kri0001",
        site = "None",
        participant = "All"
      )
      expect_equal(input$participant, "All")
      expect_equal(rctv_strSubjectID(), "All")
    }
  )
})
