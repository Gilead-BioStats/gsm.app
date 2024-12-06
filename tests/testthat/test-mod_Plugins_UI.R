test_that("mod_Plugins_UI creates the expected UI", {
  test_result <- mod_Plugins_UI(
    "testID",
    lPlugins <- list(list(
      meta = list(ID = "TEST", Name = "Plugin Test"),
      shiny = list(UI = function(id) "TestUI")
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
        meta = list(ID = "TEST", Name = "Plugin Test"),
        shiny = list(UI = function(id) "TestUI")
      ),
      list(
        meta = list(ID = "TESTTOO", Name = "Plugin Test 2"),
        shiny = list(UI = function(id) "TestUI 2")
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
