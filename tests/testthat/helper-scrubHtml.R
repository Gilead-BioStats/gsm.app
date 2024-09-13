scrub_card_ids <- function(chrLines) {
  gsub("bslib-card-\\d+", "bslib-card-XXXX", chrLines)
}

expect_cleaned_html <- function(x, call = rlang::caller_env()) {
  rlang::inject(
    expect_snapshot(
      {{x}},
      transform = scrub_card_ids
    ),
    env = call
  )
}
