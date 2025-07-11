# I do this in a helper so that it loads when testing locally.

if (rlang::is_installed("shinytest2", version = "0.4.1")) {
  library(shinytest2)
  options(chromote.headless = "new")
}

init_json_path <- test_path("_snaps/run_gsm_app/init-init.json")

if (file.exists(init_json_path)) {
  main_input_names <- names(jsonlite::read_json(init_json_path)$input)
} else {
  main_input_names <- character()
}

subset_inputs <- function(
  regex,
  negate = FALSE,
  include_full_screen = FALSE,
  input_names = main_input_names
) {
  inputs <- stringr::str_subset(input_names, regex, negate = negate)
  if (!include_full_screen) {
    inputs <- stringr::str_subset(inputs, "_full_screen$", negate = TRUE)
  }
  return(inputs)
}

primary_inputs <- c(
  "group-group",
  "group-level",
  "participant",
  "primary_nav_bar"
)

# I don't really do anything here yet, but it's here in case we need it.
scrub_expected <- function(val) {
  val_list <- jsonlite::parse_json(val)
  # Get rid of any empty pieces
  val_list <- purrr::compact(val_list)
  return(jsonlite::toJSON(val_list, pretty = TRUE))
}
