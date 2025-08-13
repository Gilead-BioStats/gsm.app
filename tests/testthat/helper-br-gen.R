test_that_br_app_title <- function(
  app_dir,
  snapshot_name,
  expected_title,
  screenshot_name
) {
  app <- br_app(
    app_dir = app_dir,
    name = snapshot_name
  )
  app$wait_for_idle()
  expect_equal(app$get_text("title"), expected_title)
  expect_official_screenshot(
    app,
    name = screenshot_name,
    selector = ".navbar"
  )
  app$stop()
}
