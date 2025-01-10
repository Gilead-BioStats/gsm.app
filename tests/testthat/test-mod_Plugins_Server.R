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
              output$test <- shiny::renderText({
                paste("The selected participant is", rctv_strSubjectID())
              })
            })
          })
        )
      ),
      l_rctvDomains = list(),
      rctv_strMetricID = reactive(NULL),
      rctv_strSiteID = reactive(NULL),
      rctv_strSubjectID = reactiveVal("0008")
    ),
    {
      expect_equal(output$`1-test`, "The selected participant is 0008")
      rctv_strSubjectID("new")
      session$flushReact()
      expect_equal(output$`1-test`, "The selected participant is new")
    }
  )
})
