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

test_that("mod_Plugins_UI creates the expected UI with required input", {
  test_result <- mod_Plugins_UI(
    "testID",
    lPlugins <- list(list(
      meta = list(ID = "TEST", Name = "Plugin Test"),
      shiny = list(UI = function(id) "TestUI"),
      required_inputs = "Site"
    ))
  )
  expect_type(test_result, "list")
  test_result <- test_result[[1]]
  expect_s3_class(test_result, c("shiny.tag"))
  expect_cleaned_html({
    test_result
  })
})

test_that("mod_Plugins_Server outputs the expected result", {
  call <- rlang::current_env()
  testServer(
    mod_Plugins_Server,
    args = list(
      id = "testServer",
      lPlugins = list(
        list(
          meta = list(ID = "TEST", Name = "Plugin Test"),
          shiny = list(Server = function(id, rctv_strSubjectID) {
            moduleServer(id, function(input, output, session) {
              output$test <- renderText({
                paste("The selected participant is", rctv_strSubjectID())
              })
            })
          })
        )
      ),
      l_rctvDomains = list(),
      rctv_strMetricID = reactive(NULL),
      rctv_strSiteID = reactive(NULL),
      rctv_strSubjectID = reactiveVal("0008"),
      rctv_strDomainID = reactiveVal("None")
    ),
    {
      expect_equal(output$`plugin-1-test`, "The selected participant is 0008")
      rctv_strSubjectID("new")
      session$flushReact()
      expect_equal(output$`plugin-1-test`, "The selected participant is new")
    }
  )
})

test_that("mod_Plugins_Server outputs the expected result with required inputs", {
  call <- rlang::current_env()
  testServer(
    mod_Plugins_Server,
    args = list(
      id = "testServer",
      lPlugins = list(
        list(
          meta = list(ID = "TEST", Name = "Plugin Test"),
          shiny = list(
            UI = function(id) {
              "This is a UI"
            },
            Server = function(id, rctv_strSubjectID) {
              moduleServer(id, function(input, output, session) {
                output$test <- renderText({
                  paste("The selected participant is", rctv_strSubjectID())
                })
              })
            }
          ),
          required_inputs = c("Site", "Participant")
        )
      ),
      l_rctvDomains = list(),
      rctv_strMetricID = reactive(NULL),
      rctv_strSiteID = reactiveVal("None"),
      rctv_strSubjectID = reactiveVal("All"),
      rctv_strDomainID = reactiveVal("None")
    ),
    {
      expect_cleaned_html(output$`1`$html, call = call)
      rctv_strSiteID("0X001")
      session$flushReact()
      expect_cleaned_html(output$`1`$html, call = call)
      rctv_strSubjectID("0008")
      session$flushReact()
      expect_cleaned_html(output$`1`$html, call = call)
      expect_equal(output$`plugin-1-test`, "The selected participant is 0008")
      rctv_strSubjectID("new")
      session$flushReact()
      expect_equal(output$`plugin-1-test`, "The selected participant is new")
    }
  )
})

# TODO: Test a plugin from a package.

# TODO: Tests fail when I use a function name (like in real usage), but only
# when ran in the full suite, so it appears to be an environment issue. No luck
# so far getting testthat to behave.
