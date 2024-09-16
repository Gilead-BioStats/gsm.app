expect_cleaned_html <- function(x, call = rlang::caller_env()) {
  rlang::inject(
    expect_snapshot(
      {{ x }},
      transform = scrub_html
    ),
    env = call
  )
}

scrub_html <- function(chrLines) {
  scrub_card_ids(chrLines)
}

scrub_card_ids <- function(chrLines) {
  gsub("bslib-card-\\d+", "bslib-card-XXXX", chrLines)
}
