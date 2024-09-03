mod_ActionList_Server = function(id) {
  # The contents of the list don't matter, so I only want these pieces. I think
  # I'll have a separate server function that compiles
  moduleServer(id, function(input, output, session) {
    # Can I cleanly set up one observer for each input? Or somehow work with all
    # of input?
    return(reactive({names(input)}))
  })
}
