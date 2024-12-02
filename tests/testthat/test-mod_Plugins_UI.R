test_that("mod_Plugins_UI creates the expected UI", {
  test_result <- mod_Plugins_UI(
    "testID",
    lPlugins <- list(list(
      strTitle = "Plugin Test",
      fnUI = function(id) "TestUI"
    ))
  )
  expect_type(test_result, "list")
  test_result <- test_result[[1]]
  expect_s3_class(test_result, c("shiny.tag"))
  expect_cleaned_html({
    test_result
  })
})

test_that("mod_Plugins_UI creates the expected UI with multiple plugins", {
  test_result <- mod_Plugins_UI(
    "testID",
    lPlugins <- list(
      list(
        strTitle = "Plugin Test",
        fnUI = function(id) "TestUI"
      ),
      list(
        strTitle = "Plugin Test 2",
        fnUI = function(id) "TestUI 2"
      )
    )
  )
  expect_type(test_result, "list")
  test_result <- test_result[[1]]
  expect_s3_class(test_result, c("shiny.navbarmenu"))
  expect_snapshot({
    test_result
  })
})
