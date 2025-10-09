# Standard skips ----

skip_if_not_qualifying <- function() {
  if (testing_entire_package()) {
    skip("Not qualifying.")
  }
  skip_on_cran()
  skip_on_covr()
}

testing_entire_package <- function() {
  !testing_qc() && !testing_active_file()
}

testing_active_file <- function() {
  any(
    grepl("test_active_file", as.character(sys.calls()))
  )
}

testing_qc <- function() {
  isTRUE(as.logical(Sys.getenv("TESTTHAT_IS_QCING", "false")))
}

# App Driver ----

CompileVariantDir <- function() {
  paste("br", shinytest2::platform_variant(), sep = "-")
}

br_app <- function(app_dir, name, width = 1300, ...) {
  shinytest2::AppDriver$new(
    app_dir = test_path("apps", app_dir),
    variant = CompileVariantDir(),
    name = name,
    width = width,
    height = 800,
    ...
  )
}

# Screenshots ----

expect_official_screenshot <- function(app, name, ...) {
  name <- paste(name, collapse = "-")
  if (on_ci()) {
    snapper <- getOption("testthat.snapshotter")
    if (!is.null(snapper)) {
      snap_dir <- fs::path(snapper$snap_dir, CompileVariantDir(), snapper$file)
      fs::dir_create(snap_dir)
      if (!is.null(app$.__enclos_env__$private$name)) {
        name <- paste(app$.__enclos_env__$private$name, name, sep = "-")
      }
      path <- fs::path(snap_dir, name, ext = "png")
      if (fs::file_exists(path)) {
        fs::file_delete(path)
      }
      app$get_screenshot(
        file = path,
        ...
      )
      succeed()
    } else {
      succeed()
    }
  } else {
    app$expect_screenshot(name = name, ...)
  }
}

on_ci <- function() {
  isTRUE(as.logical(Sys.getenv("CI", "false")))
}

# Other expectations ----

expect_css_class <- function(html, selector, css_class) {
  css_classes_raw <- rvest::read_html(html) %>%
    rvest::html_element(selector) %>%
    rvest::html_attr("class")
  if (!is.na(css_classes_raw) && nchar(css_classes_raw)) {
    css_classes <- stringr::str_split_1(css_classes_raw, " ")
    expect_contains(css_classes, css_class)
  } else {
    fail("No classes found")
  }
}

# Other general ----

select_tab <- function(tab_name) {
  glue::glue('div.tab-pane[data-value="{tab_name}"]')
}
