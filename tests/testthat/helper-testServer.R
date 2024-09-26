testServer <- function(...) {
  suppressPackageStartupMessages(
    shiny::testServer(...)
  )
}

expect_local_snapshot <- function(x, call = rlang::caller_env()) {
  rlang::inject(
    expect_snapshot(
      {{ x }}
    ),
    env = call
  )
}
