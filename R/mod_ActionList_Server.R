mod_ActionList_Server = function(id, rctv_chrNames) {
  # The contents of the list don't matter, so I only want these pieces. I think
  # I'll have a separate server function that compiles
  moduleServer(id, function(input, output, session) {
    lastClickedLink <- reactiveVal(NULL)
    lapply(rctv_chrNames(), function(name) {
      observeEvent(input[[name]], {
        lastClickedLink(name)
      })
    })

    lastClickedLink
  })
}
