# expect_domain_counts ----
expect_domain_counts <- function(
  app,
  strGroupID = NULL,
  strSubjectID = NULL,
  strGroupLevel = "Site",
  dSnapshotDate = "2012-03-31"
) {
  domain_counts_actual <- get_domain_counts(app)
  domain_counts_expected <- get_domain_counts_expected(
    strGroupLevel = strGroupLevel,
    dSnapshotDate = dSnapshotDate,
    strGroupID = strGroupID,
    strSubjectID = strSubjectID
  )
  expect_mapequal(
    domain_counts_actual,
    domain_counts_expected
  )
}

get_domain_tab_labels <- function(app) {
  app$get_text("#domain_details-selected_tab li") %>%
    stringr::str_trim()
}

get_domain_counts <- function(app) {
  tab_labels <- get_domain_tab_labels(app)
  tab_label_regex <- "^([^0-9]+) \\((\\d+)\\)$"
  labels <- stringr::str_extract(tab_labels, tab_label_regex, 1)
  counts <- as.integer(stringr::str_extract(tab_labels, tab_label_regex, 2))
  rlang::set_names(counts, labels)
}

get_domain_counts_expected <- function(
  strGroupID = NULL,
  strSubjectID = NULL,
  strGroupLevel = "Site",
  dSnapshotDate = "2012-03-31"
) {
  chrDomains <- c(
    `Adverse Events` = "AE",
    `Data Changes` = "DATACHG",
    `Data Entry` = "DATAENT",
    Enrollment = "ENROLL",
    Lab = "LB",
    `Protocol Deviations` = "PD",
    Queries = "QUERY",
    `Study Completion` = "STUDCOMP",
    `Subject Metadata` = "SUBJ",
    `Treatment Completion` = "SDRGCOMP"
  )
  purrr::map_int(
    chrDomains,
    ~ sample_fnCountData(
      strDomainID = .x,
      strGroupLevel = strGroupLevel,
      dSnapshotDate = dSnapshotDate,
      strGroupID = strGroupID,
      strSubjectID = strSubjectID
    )
  )
}

# expect_domain_df_cols ----

expect_domain_df_cols <- function(app, strDomainID) {
  headers_actual <- get_active_domain_df_cols(app)
  headers_expected <- get_expected_domain_df_cols(strDomainID)
  expect_setequal(headers_actual, headers_expected)
}

get_active_domain_df_cols <- function(app) {
  app$get_text(".tabbable .active .rt-th .rt-text-content")
}

get_expected_domain_df_cols <- function(strDomainID) {
  df <- sample_fnFetchData(strDomainID)
  MakeParamLabelsChr(colnames(df), chrFieldNames)
}

# expect_domain_df_row ----

expect_domain_df_row <- function(
  app,
  strDomainID,
  row_number = 1,
  strGroupID = NULL,
  strSubjectID = NULL,
  strGroupLevel = "Site",
  dSnapshotDate = "2012-03-31"
) {
  row_actual <- get_active_domain_df_row(app, row_number = row_number)
  row_expected <- get_expected_domain_df_row(
    strDomainID,
    row_number = row_number,
    strGroupLevel = strGroupLevel,
    dSnapshotDate = dSnapshotDate,
    strGroupID = strGroupID,
    strSubjectID = strSubjectID
  )
  expect_mapequal(row_actual, row_expected)
}

get_active_domain_df_row <- function(app, row_number = 1) {
  selector <- glue::glue(
    ".tabbable .active .rt-tbody .rt-tr-group:nth-child({row_number}) .rt-text-content"
  )
  rlang::set_names(
    app$get_text(selector),
    get_active_domain_df_cols(app)
  )
}

get_expected_domain_df_row <- function(
  strDomainID,
  row_number = 1,
  strGroupID = NULL,
  strSubjectID = NULL,
  strGroupLevel = "Site",
  dSnapshotDate = "2012-03-31"
) {
  df <- sample_fnFetchData(
    strDomainID = strDomainID,
    strGroupLevel = strGroupLevel,
    dSnapshotDate = dSnapshotDate,
    strGroupID = strGroupID,
    strSubjectID = strSubjectID
  )
  # Need to do as.character col-by-col so, for example, dates are converted
  # properly.
  row <- purrr::map_chr(df[row_number, ], as.character)
  names(row) <- MakeParamLabelsChr(names(row), chrFieldNames)
  row
}
