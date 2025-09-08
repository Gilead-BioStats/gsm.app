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

  test_that("496.03: The 'Prevalence' card displays a color-coded key for Study.", {
    this_level <- "Study"
    key_selector <- "#domain_details-AE-prevalence_plot-key"
    this_key_selector <- paste(key_selector, this_level, sep = "-")
    key_title <- app$get_text(paste(this_key_selector, "label"))
    expect_equal(key_title, this_level)
    expect_official_screenshot(
      app,
      name = c("03", glue::glue("{this_level}_key_exists")),
      selector = key_selector
    )
  })

  test_that("496.04: The 'Prevalence' card displays a bar plot of '% of rows' vs the values of the selected column, colored to indicate that it is at the Study level.", {
    expect_true(TRUE)
    expect_official_screenshot(
      app,
      name = c("04", "prevalence_plot_study_bars"),
      selector = "#domain_details-AE-prevalence_plot-plot-plot"
    )
  })

  test_that("496.05: The 'Prevalence' card displays a label with the numeric % of each value, colored to indicate that it is at the Study level.", {
    expect_true(TRUE)
    expect_official_screenshot(
      app,
      name = c("05", "prevalence_plot_study_label"),
      selector = "#domain_details-AE-prevalence_plot-plot-plot"
    )
  })

  test_that("496.06: When a group is selected, the 'Prevalence' card displays a color-coded key for that group, as '{Group Level} {GroupID}'.", {
    this_level <- "Group"
    strGroupLevel <- "Site"
    strGroupID <- "0X7258"
    key_selector <- "#domain_details-AE-prevalence_plot-key"
    this_key_selector <- paste(key_selector, this_level, sep = "-")
    app$set_inputs(`group-group-select` = strGroupID)
    app$wait_for_idle()
    key_title <- app$get_text(paste(this_key_selector, "label"))
    expect_equal(key_title, glue::glue("{strGroupLevel}: {strGroupID}"))
    expect_official_screenshot(
      app,
      name = c("06", glue::glue("{this_level}_key_exists")),
      selector = key_selector
    )
  })

  test_that("496.07: When a group is selected, the 'Prevalence' card also displays a bar filtered to just the selected group, colored to indicate that it is at the Group level.", {
    expect_true(TRUE)
    expect_official_screenshot(
      app,
      name = c("07", "prevalence_plot_group_bars"),
      selector = "#domain_details-AE-prevalence_plot-plot-plot"
    )
  })

  test_that("496.08: When a group is selected, the 'Prevalence' card also displays a label with the numeric % of each value filtered to just the selected group, colored to indicate that it is at the Group level.", {
    expect_true(TRUE)
    expect_official_screenshot(
      app,
      name = c("08", "prevalence_plot_group_label"),
      selector = "#domain_details-AE-prevalence_plot-plot-plot"
    )
  })

  test_that("496.09: When a participant is selected, the 'Prevalence' card displays a color-coded key for that participant, as 'Participant {SubjectID}'.", {
    this_level <- "Participant"
    strParticipantID <- "S10581"
    key_selector <- "#domain_details-AE-prevalence_plot-key"
    this_key_selector <- paste(key_selector, this_level, sep = "-")
    app$set_inputs(`participant-select` = strParticipantID)
    app$wait_for_idle()
    key_title <- app$get_text(paste(this_key_selector, "label"))
    expect_equal(key_title, glue::glue("Participant: {strParticipantID}"))
    expect_official_screenshot(
      app,
      name = c("09", glue::glue("{this_level}_key_exists")),
      selector = key_selector
    )
  })

  test_that("496.10: When a participant is selected, the 'Prevalence' card also displays a bar filtered to just the selected participant, colored to indicate that it is at the Participant level.", {
    expect_true(TRUE)
    expect_official_screenshot(
      app,
      name = c("10", "prevalence_plot_participant_bars"),
      selector = "#domain_details-AE-prevalence_plot-plot-plot"
    )
  })

  test_that("496.11: When a participant is selected, the 'Prevalence' card also displays a label with the numeric % of each value filtered to just the selected participant, colored to indicate that it is at the Participant level.", {
    expect_true(TRUE)
    expect_official_screenshot(
      app,
      name = c("11", "prevalence_plot_participant_label"),
      selector = "#domain_details-AE-prevalence_plot-plot-plot"
    )
  })

  test_that("496.12: The user can turn the Study bar and label on and off using the color-coded Study key.", {
    this_level <- "Study"
    app$set_inputs(
      `domain_details-AE-prevalence_plot-key-Study1` = FALSE
    )
    app$wait_for_idle()
    expect_true(TRUE)
    expect_official_screenshot(
      app,
      name = c("12", glue::glue("{this_level}_off")),
      selector = "#domain_details-AE-prevalence_plot-plot-plot"
    )
    app$set_inputs(
      `domain_details-AE-prevalence_plot-key-Study` = this_level
    )
    app$wait_for_idle()
  })

  test_that("496.13: When a group is selected, the user can turn the Group bar and label on and off using the color-coded Group key.", {
    this_level <- "Group"
    app$set_inputs(
      `domain_details-AE-prevalence_plot-key-Group1` = FALSE
    )
    app$wait_for_idle()
    expect_true(TRUE)
    expect_official_screenshot(
      app,
      name = c("13", glue::glue("{this_level}_off")),
      selector = "#domain_details-AE-prevalence_plot-plot-plot"
    )
    app$set_inputs(
      `domain_details-AE-prevalence_plot-key-Group` = "Site 0X7258"
    )
    app$wait_for_idle()
  })

  test_that("496.14: When a participant is selected, the user can turn the Participant bar and label on and off using the color-coded Participant key.", {
    this_level <- "Participant"
    app$set_inputs(
      `domain_details-AE-prevalence_plot-key-Participant` = NULL
    )
    app$wait_for_idle()
    expect_true(TRUE)
    # I can't get this one to behave correctly via commands, even though
    # visually it updates the plot when I click the bar.
    expect_official_screenshot(
      app,
      name = c("14", glue::glue("{this_level}_off")),
      selector = "#domain_details-AE-prevalence_plot-key"
    )
  })

  test_that("496.15: When there are more than 6 values, the plot shows the top 5 values plus 'Other'.", {
    app$set_inputs(`domain_details-selected_tab` = "ENROLL")
    app$wait_for_idle()
    app$set_inputs(
      `domain_details-ENROLL-prevalence_plot-category-select-select` = "subjectid"
    )
    app$wait_for_idle()
    expect_true(TRUE)
    expect_official_screenshot(
      app,
      name = c("15", "top_5_plus_other"),
      selector = "#domain_details-ENROLL-prevalence_plot-plot-plot"
    )
  })

  app$stop()
})

test_that("555: Increase number of rows shown in domain details.", {
  app <- br_app(
    app_dir = "standard",
    name = "555"
  )
  app$wait_for_idle()
  app$set_inputs(primary_nav_bar = "Domain Details")
  app$wait_for_idle()
  AE_gt_card_selector <- "#domain_details-AE-card"
  pagination_selector <- paste(AE_gt_card_selector, ".rt-pagination-info")

  test_that("555.01: Domain data tables show up to 100 rows by default.", {
    expect_true(
      grepl(
        "1–100 of",
        app$get_text(paste(pagination_selector, ".rt-page-info"))
      )
    )
    expect_official_screenshot(
      app,
      name = c("01", "100_rows_default"),
      selector = AE_gt_card_selector
    )
  })

  test_that("555.02: Users can change the number of displayed rows to 20 or 1000.", {
    pagination_select_selector <- paste(
      pagination_selector,
      ".rt-page-size-select"
    )
    pagination_options <- app$get_html(paste(
      pagination_select_selector,
      "option"
    )) |>
      stringr::str_extract('"(\\d+)"', group = 1)
    expect_setequal(pagination_options, c("20", "100", "1000"))

    set_pagination_js_template <- "
      const el = document.querySelector('[{[pagination_select_selector]}]');
      if (el) {
        el.value = '[{[option]}]';
        el.dispatchEvent(new Event('change', { bubbles: true }));
      }
    "

    app$run_js(glue::glue(
      set_pagination_js_template,
      option = 20,
      .open = "[{[",
      .close = "]}]"
    ))
    app$wait_for_idle()
    expect_official_screenshot(
      app,
      name = c("02", "20_rows"),
      selector = AE_gt_card_selector
    )

    app$run_js(glue::glue(
      set_pagination_js_template,
      option = 1000,
      .open = "[{[",
      .close = "]}]"
    ))
    app$wait_for_idle()
    expect_official_screenshot(
      app,
      name = c("02", "1000_rows"),
      selector = AE_gt_card_selector
    )
  })

  app$stop()
})
