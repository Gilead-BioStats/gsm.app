skip_if_not_br()

# Screenshots updated by BR #519.
test_that("534: The user can view raw domain data.", {
  app <- br_app(
    app_dir = "standard",
    name = "534"
  )
  app$wait_for_idle()
  app$set_inputs(primary_nav_bar = "Domain Details")
  app$wait_for_idle()

  test_that("534.01: The user can switch between different domain data views using a set of tabs.", {
    # Default tab is Adverse Events (AE)
    target_domain <- "AE"
    expect_domain_df_cols(app, target_domain)
    expect_official_screenshot(app, name = c("01", target_domain))

    # Switch to Enrollment (ENROLL) tab
    target_domain <- "ENROLL"
    app$set_inputs(`domain_details-selected_tab` = target_domain)
    app$wait_for_idle()
    expect_domain_df_cols(app, target_domain)
    expect_official_screenshot(app, name = c("01", target_domain))

    # Reset
    app$set_inputs(`domain_details-selected_tab` = "AE")
    app$wait_for_idle()
  })

  test_that("534.02: The user can view the raw data for the selected domain in a table.", {
    target_domain <- "AE"
    expect_domain_df_cols(app, target_domain)
    expect_domain_df_row(app, target_domain)
    expect_official_screenshot(app, name = c("02", target_domain))
  })

  test_that("534.03: The domain data table is filtered by the selected 'Group' and 'Participant'.", {
    target_domain <- "AE"

    # Unfiltered
    expect_domain_df_row(app, target_domain)
    expect_official_screenshot(app, name = c("03", "unfiltered"))

    # Filter by group
    target_group <- sample_dfGroups[
      sample_dfGroups$GroupLevel == "Site",
    ]$GroupID[[2]]
    app$set_inputs(`group-group-select` = target_group)
    app$wait_for_idle()
    expect_domain_df_row(app, target_domain, strGroupID = target_group)
    expect_official_screenshot(app, name = c("03", "filter_by_group"))

    # Filter by participant
    target_participant <- sample_dfAnalyticsInput$SubjectID[
      sample_dfAnalyticsInput$GroupID == target_group
    ][[1]]
    app$set_inputs(`participant-select` = target_participant)
    app$wait_for_idle()
    expect_domain_df_row(
      app,
      target_domain,
      strGroupID = target_group,
      strSubjectID = target_participant
    )
    expect_official_screenshot(app, name = c("03", "filter_by_participant"))

    # Reset
    app$set_inputs(`group-group-select` = "All")
    app$wait_for_idle()
    app$set_inputs(`participant-select` = "All")
    app$wait_for_idle()
  })

  test_that("534.04: The app displays an error message if it is unable to load data for a specific domain.", {
    # Trigger the error condition
    errorGroupID <- rev(sort(unique(sample_dfGroups$GroupID[
      sample_dfGroups$GroupLevel == "Site"
    ])))[[1]]
    app$set_inputs(`group-group-select` = errorGroupID)
    app$wait_for_idle()
    app$set_inputs(`domain_details-selected_tab` = "LB")
    app$wait_for_idle()

    # Verify the modal dialog appears with the correct content
    expect_equal(app$get_text(".modal-title"), "Error loading LB data")
    expect_equal(
      stringr::str_squish(app$get_text(".modal-body")),
      glue::glue(
        "Could not fetch LB data for Site {errorGroupID}.",
        "Site {errorGroupID} has data issues for the Lab domain.",
        "This is to demonstrate behavior with errors.",
        "Please select another Site.",
        .sep = " "
      )
    )
    expect_official_screenshot(app, name = c("04", "error_modal"))
  })

  app$stop()
})

# Feature #535 superseded by BR #519.
# test_that("535: The user can view a summary of the number of records for each available data domain.", {
#   app <- br_app(
#     app_dir = "standard",
#     name = "535"
#   )
#   app$wait_for_idle()
#   app$set_inputs(primary_nav_bar = "Domain Details")
#   app$wait_for_idle()

#   test_that("535.01: The domain summary counts update based on the selected 'Group' and 'Participant' filters.", {
#     # Verify domain summary card is visible
#     domain_summary_selector <- "#domain_details-counts-card"
#     expect_equal(
#       app$get_text(paste(domain_summary_selector, "h5")),
#       "Domain Summary"
#     )

#     # Check counts against source data
#     domain_counts_actual <- get_domain_counts(app)
#     domain_counts_expected <- get_domain_counts_expected()
#     expect_mapequal(
#       domain_counts_actual,
#       domain_counts_expected
#     )

#     expect_official_screenshot(
#       app,
#       name = c("01", "domain_summary"),
#       selector = domain_summary_selector
#     )

#     # Filter by group
#     target_group <- "0X7798"
#     app$set_inputs(`group-group-select` = target_group)
#     app$wait_for_idle()
#     expect_domain_counts(app, strGroupID = target_group)
#     expect_official_screenshot(app, name = c("01", "filter_by_group"))

#     # Filter by participant
#     target_participant <- "S28299"
#     app$set_inputs(`participant-select` = target_participant)
#     app$wait_for_idle()
#     expect_domain_counts(
#       app,
#       strGroupID = target_group,
#       strSubjectID = target_participant
#     )
#     expect_official_screenshot(app, name = c("01", "filter_by_participant"))

#     # Reset
#     app$set_inputs(`group-group-select` = "All")
#     app$wait_for_idle()
#     app$set_inputs(`participant-select` = "All")
#     app$wait_for_idle()
#   })

#   test_that("535.02: Clicking a domain in the summary list switches the view to that domain's data tab.", {
#     # Default tab is Adverse Events (AE)
#     target_domain <- "AE"
#     expect_equal(
#       app$get_value(input = "domain_details-selected_tab"),
#       target_domain
#     )

#     # Click "Enrollment" in the summary list
#     target_domain <- "ENROLL"
#     app$click(
#       selector = glue::glue(
#         "#domain_details-counts-domain_list_choices-{target_domain}"
#       )
#     )
#     app$wait_for_idle()

#     # Verify active tab and data have updated
#     expect_equal(
#       app$get_value(input = "domain_details-selected_tab"),
#       target_domain
#     )
#     expect_domain_df_cols(app, target_domain)
#     expect_official_screenshot(
#       app,
#       name = c("02", target_domain)
#     )
#   })

#   app$stop()
# })
