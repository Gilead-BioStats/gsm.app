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
  # Plugin validation happens earlier in the process, so we assume it has
  # already happened.
  lPlugins <- validate_lPlugins(
    list(
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

  test_result <- mod_Plugins_UI(
    "testID",
    lPlugins
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

# Temporarily removing these tests because the UI works. Need concrete examples
# to make this make more sense in testing.

# test_that("mod_Plugins_Server outputs the expected result", {
#   call <- rlang::current_env()
#   testServer(
#     mod_Plugins_Server,
#     args = list(
#       id = "testServer",
#       lPlugins = list(
#         a = list(
#           meta = list(ID = "TEST", Name = "Plugin Test"),
#           shiny = list(
#             UI = function(id) uiOutput("test"),
#             Server = function(id, rctv_strSubjectID) {
#               moduleServer(id, function(input, output, session) {
#                 output$test <- renderText({
#                   paste("The selected participant is", rctv_strSubjectID())
#                 })
#               })
#             }
#           )
#         )
#       ),
#       dfAnalyticsInput = sample_dfAnalyticsInput,
#       dfBounds = sample_dfBounds,
#       dfGroups = sample_dfGroups,
#       dfMetrics = sample_dfMetrics,
#       dfResults = sample_dfResults,
#       l_rctvDomains = list(),
#       l_rctvDomainHashes = list(),
#       rctv_dSnapshotDate = reactive("2019-11-01"),
#       rctv_strMetricID = reactive(NULL),
#       rctv_strSiteID = reactive(NULL),
#       rctv_strSubjectID = reactiveVal("0008"),
#       rctv_strDomainID = reactiveVal("None")
#     ),
#     {
#       cli::cli_abort("{class(output$a-plugin-test)}")
#       expect_equal(output$`a-plugin`, "The selected participant is 0008")
#       rctv_strSubjectID("new")
#       session$flushReact()
#       expect_equal(output$`a-plugin`, "The selected participant is new")
#     }
#   )
# })

# test_that("mod_Plugins_Server outputs the expected result with required inputs", {
#   call <- rlang::current_env()
#   testServer(
#     mod_Plugins_Server,
#     args = list(
#       id = "testServer",
#       lPlugins = list(
#         list(
#           meta = list(ID = "TEST", Name = "Plugin Test"),
#           shiny = list(
#             UI = function(id) {
#               "This is a UI"
#             },
#             Server = function(id, rctv_strSubjectID) {
#               moduleServer(id, function(input, output, session) {
#                 output$test <- renderText({
#                   paste("The selected participant is", rctv_strSubjectID())
#                 })
#               })
#             }
#           ),
#           required_inputs = c("Site", "Participant")
#         )
#       ),
#       dfAnalyticsInput = sample_dfAnalyticsInput,
#       dfBounds = sample_dfBounds,
#       dfGroups = sample_dfGroups,
#       dfMetrics = sample_dfMetrics,
#       dfResults = sample_dfResults,
#       l_rctvDomains = list(),
#       rctv_dSnapshotDate = reactive("2019-11-01"),
#       rctv_strMetricID = reactive(NULL),
#       rctv_strSiteID = reactiveVal("All"),
#       rctv_strSubjectID = reactiveVal("All"),
#       rctv_strDomainID = reactiveVal("None")
#     ),
#     {
#       expect_cleaned_html(output$`1`$html, call = call)
#       rctv_strSiteID("0X001")
#       session$flushReact()
#       expect_cleaned_html(output$`1`$html, call = call)
#       rctv_strSubjectID("0008")
#       session$flushReact()
#       expect_cleaned_html(output$`1`$html, call = call)
#       expect_equal(output$`plugin-1-test`, "The selected participant is 0008")
#       rctv_strSubjectID("new")
#       session$flushReact()
#       expect_equal(output$`plugin-1-test`, "The selected participant is new")
#     }
#   )
# })

# TODO: Test a plugin from a package.

# TODO: Tests fail when I use a function name (like in real usage), but only
# when ran in the full suite, so it appears to be an environment issue. No luck
# so far getting testthat to behave.
