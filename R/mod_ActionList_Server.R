mod_ActionList_Server = function(id, rctv_chrNames) {
  moduleServer(id, function(input, output, session) {
    lastClickedLink <- reactiveVal(NULL)
    observe({
      chrNames <- rctv_chrNames()
      lapply(chrNames, function(name) {
        observe(lastClickedLink(name)) %>%
          bindEvent(input[[name]])
      })
      observe(lastClickedLink(NULL)) %>%
        bindEvent(length(chrNames) == 0)
    })
    lastClickedLink
  })
}
