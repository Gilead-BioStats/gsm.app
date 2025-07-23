skip_if_not_br()
currently_debugging <- FALSE

test_that("BR-DD-01: The user can view a summary of the number of records for each available data domain.", {
  skip_if(currently_debugging)
  app <- AppDriver$new(
    app_dir = test_path("apps", "standard"),
    variant = "br",
    name = "dd-01",
    width = 1300,
    height = 800
  )
  app$wait_for_idle()
  app$set_inputs(primary_nav_bar = "Domain Details")
  app$wait_for_idle()

  # Verify domain summary card is visible
  domain_summary_selector <- "#domain_details-counts-card"
  expect_equal(
    app$get_text(paste(domain_summary_selector, "h5")),
    "Domain Summary"
  )

  # Check counts against source data
  domain_counts_actual <- get_domain_counts(app)
  domain_counts_expected <- get_domain_counts_expected()
  expect_mapequal(
    domain_counts_actual,
    domain_counts_expected
  )

  expect_official_screenshot(
    app,
    name = "domain_summary",
    selector = domain_summary_selector
  )
  app$stop()
})

test_that("BR-DD-02: The domain summary counts update based on the selected 'Group' and 'Participant' filters.", {
  skip_if(currently_debugging)
  app <- AppDriver$new(
    app_dir = test_path("apps", "standard"),
    variant = "br",
    name = "dd-02",
    width = 1300,
    height = 800
  )
  app$wait_for_idle()
  app$set_inputs(primary_nav_bar = "Domain Details")
  app$wait_for_idle()

  # Initial counts (no filters)
  expect_domain_counts(app)

  # Filter by group
  target_group <- "0X7798"
  app$set_inputs(`group-group-select` = target_group)
  app$wait_for_idle()
  expect_domain_counts(app, strGroupID = target_group)
  expect_official_screenshot(app, name = "filter_by_group")

  # Filter by participant
  target_participant <- "S28299"
  app$set_inputs(`participant-select` = target_participant)
  app$wait_for_idle()
  expect_domain_counts(
    app,
    strGroupID = target_group,
    strSubjectID = target_participant
  )
  expect_official_screenshot(app, name = "filter_by_participant")
  app$stop()
})

test_that("BR-DD-03: The user can switch between different domain data views using a set of tabs.", {
  skip_if(currently_debugging)
  app <- AppDriver$new(
    app_dir = test_path("apps", "standard"),
    variant = "br",
    name = "dd-03",
    width = 1300,
    height = 800
  )
  app$wait_for_idle()
  app$set_inputs(primary_nav_bar = "Domain Details")
  app$wait_for_idle()

  # Default tab is Adverse Events (AE)
  target_domain <- "AE"
  expect_domain_df_cols(app, target_domain)
  expect_official_screenshot(app, name = target_domain)

  # Switch to Enrollment (ENROLL) tab
  target_domain <- "ENROLL"
  app$set_inputs(`domain_details-selected_tab` = target_domain)
  app$wait_for_idle()
  expect_domain_df_cols(app, target_domain)
  expect_official_screenshot(app, name = target_domain)

  app$stop()
})

test_that("BR-DD-04: Clicking a domain in the summary list switches the view to that domain's data tab.", {
  skip_if(currently_debugging)
  app <- AppDriver$new(
    app_dir = test_path("apps", "standard"),
    variant = "br",
    name = "dd-04",
    width = 1300,
    height = 800
  )
  app$wait_for_idle()
  app$set_inputs(primary_nav_bar = "Domain Details")
  app$wait_for_idle()

  # Default tab is Adverse Events (AE)
  target_domain <- "AE"
  expect_equal(
    app$get_value(input = "domain_details-selected_tab"),
    target_domain
  )

  # Click "Enrollment" in the summary list
  target_domain <- "ENROLL"
  app$click(
    selector = glue::glue(
      "#domain_details-counts-domain_list_choices-{target_domain}"
    )
  )
  app$wait_for_idle()

  # Verify active tab and data have updated
  expect_equal(
    app$get_value(input = "domain_details-selected_tab"),
    target_domain
  )
  expect_domain_df_cols(app, target_domain)
  expect_official_screenshot(
    app,
    name = target_domain
  )

  app$stop()
})

test_that("BR-DD-05: The user can view the raw data for the selected domain in a table.", {
  skip_if(currently_debugging)
  app <- AppDriver$new(
    app_dir = test_path("apps", "standard"),
    variant = "br",
    name = "dd-05",
    width = 1300,
    height = 800
  )
  app$wait_for_idle()
  app$set_inputs(primary_nav_bar = "Domain Details")
  app$wait_for_idle()

  # Check for table on default domain (AE)
  target_domain <- "AE"
  expect_domain_df_cols(app, target_domain)
  expect_domain_df_row(app, target_domain)
  expect_official_screenshot(app, name = target_domain)

  app$stop()
})

test_that("BR-DD-06: The domain data table is filtered by the selected 'Group' and 'Participant'.", {
  skip_if(currently_debugging)
  app <- AppDriver$new(
    app_dir = test_path("apps", "standard"),
    variant = "br",
    name = "dd-06",
    width = 1300,
    height = 800
  )
  app$wait_for_idle()
  app$set_inputs(primary_nav_bar = "Domain Details")
  app$wait_for_idle()
  target_domain <- "AE"

  # Unfiltered
  expect_domain_df_row(app, target_domain)
  expect_official_screenshot(app, name = "unfiltered")

  # Filter by group
  target_group <- "0X7798"
  app$set_inputs(`group-group-select` = target_group)
  app$wait_for_idle()
  expect_domain_df_row(app, target_domain, strGroupID = target_group)
  expect_official_screenshot(app, name = "filter_by_group")

  # Filter by participant
  target_participant <- "S28299"
  app$set_inputs(`participant-select` = target_participant)
  app$wait_for_idle()
  expect_domain_df_row(
    app,
    target_domain,
    strGroupID = target_group,
    strSubjectID = target_participant
  )
  expect_official_screenshot(app, name = "filter_by_participant")

  app$stop()
})

test_that("BR-DD-07: The app will display an error message if it is unable to load data for a specific domain.", {
  skip_if(currently_debugging)
  app <- AppDriver$new(
    app_dir = test_path("apps", "error"),
    variant = "br",
    name = "dd-07",
    width = 1300,
    height = 800
  )
  app$wait_for_idle()
  app$set_inputs(primary_nav_bar = "Domain Details")
  app$wait_for_idle()

  # Trigger the error condition
  app$set_inputs(`group-group-select` = "0X9640")
  app$wait_for_idle()
  app$set_inputs(`domain_details-selected_tab` = "LB")
  app$wait_for_idle()

  # Verify the modal dialog appears with the correct content
  expect_equal(app$get_text(".modal-title"), "Error loading LB data")
  expect_equal(
    stringr::str_squish(app$get_text(".modal-body")),
    paste(
      "Could not fetch LB data for Site 0X9640.",
      "Site 0X9640 has data issues for the Lab domain.",
      "This is to demonstrate behavior with errors.",
      "Please select another Site."
    )
  )
  expect_official_screenshot(app, name = "error_modal")

  app$stop()
})
