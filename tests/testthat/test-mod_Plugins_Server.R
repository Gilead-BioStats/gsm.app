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
                output$test <- shiny::renderText({
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
