skip_if_not_br()

test_that("543: The user can view counts of records for each available data domain.", {
  app <- br_app(
    app_dir = "standard",
    name = "543"
  )
  app$wait_for_idle()
  app$set_inputs(primary_nav_bar = "Domain Details")
  app$wait_for_idle()

  test_that("543.01: Domain row counts appear in parentheses after the title of each domain in the Domain Details tab's tabbed view of tables.", {
    tab_labels <- get_domain_tab_labels(app)
    expect_true(all(stringr::str_detect(tab_labels, "\\d+")))
    expect_official_screenshot(
      app,
      name = c("01", "tabs_have_counts"),
      selector = ".domain_details-selected_tab"
    )
  })

  test_that("543.02: The domain row counts update based on the selected 'Group' and 'Participant' filters.", {
    expect_domain_counts(app)
    expect_official_screenshot(
      app,
      name = c("02", "unfiltered"),
      selector = ".domain_details-selected_tab"
    )

    # Filter by group
    target_group <- "0X7798"
    app$set_inputs(`group-group-select` = target_group)
    app$wait_for_idle()
    expect_domain_counts(app, strGroupID = target_group)
    expect_official_screenshot(app, name = c("02", "filter_by_group"))

    # Filter by participant
    target_participant <- "S28299"
    app$set_inputs(`participant-select` = target_participant)
    app$wait_for_idle()
    expect_domain_counts(
      app,
      strGroupID = target_group,
      strSubjectID = target_participant
    )
    expect_official_screenshot(app, name = c("02", "filter_by_participant"))

    # Reset
    app$set_inputs(`group-group-select` = "All")
    app$wait_for_idle()
    app$set_inputs(`participant-select` = "All")
    app$wait_for_idle()
  })

  test_that("543.03: The Domain Summary panel no longer appears on the Domain Details tab.", {
    expect_null(app$get_html("#domain_details-counts-card"))
    expect_official_screenshot(
      app,
      name = c("03", "no_domain_summary_card"),
      selector = select_tab("Domain Details")
    )
  })

  app$stop()
})
