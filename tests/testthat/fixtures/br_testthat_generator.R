# This isn't really automatic quite yet, but it prints stuff to copy/paste.
br_issue_number <- 519
brs <- yaml::read_yaml(
  here::here(
    "vignettes",
    "articles",
    "business_requirements",
    "business_requirements.yml"
  )
)

br <- purrr::keep(
  brs,
  ~ .x$issue == br_issue_number
)[[1]]

length(br$features)
feature_number <- 1 # count, not issue number

this_feature <- br$features[[feature_number]]

acs <- this_feature$acceptance_criteria
nums <- seq_along(acs) |>
  stringr::str_pad(2, pad = "0")

glue::glue(
  'test_that("{this_feature$issue}.{nums}: {acs}", {{
    skip()
    expect_official_screenshot(
      app,
      name = c("{nums}", "DESCRIPTIVE_NAME"),
      selector = SELECTOR
    )
  }})\n\n'
)
