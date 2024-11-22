test_that("mod_Plugins_Server outputs the expected result", {
  call <- rlang::current_env()
  testServer(
    mod_Plugins_Server,
    args = list(
      id = "testServer",
      lPlugins = list(
        list(
          strTitle = "Plugin Test",
          fnServer = function(id, rctv_InputParticipant) {
            moduleServer(id, function(input, output, session) {
              output$test <- shiny::renderText({
                paste("The selected participant is", rctv_InputParticipant())
              })
            })
          }
        )
      ),
      fnFetchData = sample_fnFetchData,
      rctv_InputMetric = reactive(NULL),
      rctv_InputSite = reactive(NULL),
      rctv_InputParticipant = reactiveVal("0008")
    ),
    {
      expect_equal(output$`1-test`, "The selected participant is 0008")
      rctv_InputParticipant("new")
      session$flushReact()
      expect_equal(output$`1-test`, "The selected participant is new")
    }
  )
})
