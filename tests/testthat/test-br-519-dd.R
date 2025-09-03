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
      selector = "#domain_details-selected_tab"
    )
  })

  test_that("543.02: The domain row counts update based on the selected 'Group' and 'Participant' filters.", {
    expect_domain_counts(app)
    expect_official_screenshot(
      app,
      name = c("02", "unfiltered"),
      selector = "#domain_details-selected_tab"
    )

    # Filter by group
    target_group <- "0X7798"
    app$set_inputs(`group-group-select` = target_group)
    app$wait_for_idle()
    expect_domain_counts(app, strGroupID = target_group)
    expect_official_screenshot(
      app,
      name = c("02", "filter_by_group"),
      selector = "#domain_details-selected_tab"
    )

    # Filter by participant
    target_participant <- "S28299"
    app$set_inputs(`participant-select` = target_participant)
    app$wait_for_idle()
    expect_domain_counts(
      app,
      strGroupID = target_group,
      strSubjectID = target_participant
    )
    expect_official_screenshot(
      app,
      name = c("02", "filter_by_participant"),
      selector = "#domain_details-selected_tab"
    )

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

test_that("385: The user can filter domain data.", {
  app <- br_app(
    app_dir = "standard",
    name = "385"
  )
  app$wait_for_idle()
  app$set_inputs(primary_nav_bar = "Domain Details")
  app$wait_for_idle()

  test_that("385.01: Each column in the domain data tables has a field where users can type.", {
    filter_selector <- "#domain_details-AE-card .rt-td-filter input.rt-filter"
    filter_boxes <- app$get_html(filter_selector)
    dfAE <- sample_fnFetchData("AE")
    expect_equal(
      length(filter_boxes),
      ncol(dfAE)
    )
    expect_official_screenshot(
      app,
      name = c("01", "columns_have_filters"),
      selector = "#domain_details-AE-card"
    )
  })

  test_that("385.02: Data in the table is subset to include whatever is typed.", {
    # Get a version unfiltered for comparison.
    expect_official_screenshot(
      app,
      name = c("02", "unfiltered"),
      selector = "#domain_details-AE-card"
    )

    # Filter.
    filter_selector <- "#domain_details-AE-card .rt-td-filter input.rt-filter"
    session <- app$get_chromote_session()
    root_id <- session$DOM$getDocument(0)$root$nodeId
    node_ids <- unlist(
      session$DOM$querySelectorAll(root_id, filter_selector)$nodeIds
    )
    dfAE <- sample_fnFetchData("AE")
    colnum_toxgr <- which(colnames(dfAE) == "aetoxgr")
    session$DOM$focus(node_ids[[colnum_toxgr]])
    session$Input$insertText("3")
    nrow_selector <- "#domain_details-AE-card .rt-page-info"
    nrow_app <- app$get_text(nrow_selector) %>%
      stringr::str_extract(" (\\d+) rows", group = 1) %>%
      as.integer()
    nrow_data <- dfAE %>%
      dplyr::filter(aetoxgr == 3) %>%
      NROW()
    expect_equal(nrow_app, nrow_data)
    expect_official_screenshot(
      app,
      name = c("02", "toxicity_grade_3"),
      selector = "#domain_details-AE-card"
    )
  })

  app$stop()
})

test_that("496: The user can visualize domain categorical variable counts by value.", {
  app <- br_app(
    app_dir = "standard",
    name = "496"
  )
  app$wait_for_idle()
  app$set_inputs(primary_nav_bar = "Domain Details")
  app$wait_for_idle()

  test_that("496.01: The 'Domain Details' tab includes a 'Prevalence' card for each domain.", {
    domains <- c(
      "AE",
      "DATACHG",
      "DATAENT",
      "ENROLL",
      "LB",
      "PD",
      "QUERY",
      "STUDCOMP",
      "SUBJ",
      "SDRGCOMP"
    )
    prevalence_plot_selectors <- glue::glue(
      "#domain_details-{domains}-prevalence_plot-card"
    )

    expect_no_error({
      prevalence_plot_cards <- app$get_html(prevalence_plot_selectors)
    })
    expect_true(
      all(nchar(prevalence_plot_cards) > 100)
    )
    plot_names <- glue::glue("{domains}_plot_exists")
    expect_official_screenshot(
      app,
      name = c("01", plot_names[[1]]),
      selector = select_tab("Domain Details")
    )
    vals <- app$get_values()
    app$set_inputs(
      `domain_details-selected_tab` = domains[[4]],
      timeout_ = 10 * 1000
    )
    app$wait_for_idle()
    expect_official_screenshot(
      app,
      name = c("01", plot_names[[4]]),
      selector = select_tab("Domain Details")
    )
    # Reset
    app$set_inputs(
      `domain_details-selected_tab` = domains[[1]],
      timeout_ = 10 * 1000
    )
    app$wait_for_idle()
  })

  test_that("496.02: The user can select a column to display in the 'Prevalence' card (out of all categorical-like fields other than group level, group id, and subject id), defaulting to the first valid column.", {
    select_id <- "#domain_details-AE-prevalence_plot-category-select"
    choices_selector <- paste(select_id, ".vscomp-option-text")
    arrow_selector <- paste(select_id, ".vscomp-arrow")
    dropdown_selector <- paste(select_id, ".vscomp-dropbox")

    dfAE <- sample_fnFetchData("AE")
    expected_choice_ids <- colnames(purrr::keep(dfAE, is.character)) %>%
      setdiff(c("SubjectID", "GroupID", "GroupLevel"))
    expected_choices <- MakeParamLabelsChr(expected_choice_ids, chrFieldNames)
    actual_choices <- app$get_text(choices_selector) %>%
      stringr::str_squish()
    expect_setequal(actual_choices, expected_choices)
    expect_equal(
      app$get_value(
        input = "domain_details-AE-prevalence_plot-category-select-select"
      ),
      expected_choice_ids[[1]]
    )

    app$click(selector = arrow_selector)
    app$wait_for_idle()
    expect_official_screenshot(
      app,
      name = c("02", "AE_prevalence_choices"),
      selector = dropdown_selector
    )

    # Reset
    app$click(selector = arrow_selector)
    app$wait_for_idle()
  })

  app$stop()
})
