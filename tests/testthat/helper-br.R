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
