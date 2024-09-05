mod_ActionList_Server = function(id, rctv_chrNames) {
  moduleServer(id, function(input, output, session) {
    lastClickedLink <- reactiveVal(NULL)
    observe({
      chrNames <- rctv_chrNames()
      lapply(chrNames, function(name) {
        observeEvent(input[[name]], {
          lastClickedLink(name)
        })
      })
      observeEvent(
        length(chrNames) == 0,
        lastClickedLink(NULL)
      )
    })
    lastClickedLink
  })
}
