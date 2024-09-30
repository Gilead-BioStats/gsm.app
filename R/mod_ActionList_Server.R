#' List of ActionLinks Server
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactiveVal()] with the id of the most recently clicked
#'   link.
#' @keywords internal
mod_ActionList_Server <- function(id, rctv_chrIDs) {
  moduleServer(id, function(input, output, session) {
    lastClickedLink <- reactiveVal(NULL)
    observe({
      chrIDs <- rctv_chrIDs()
      lapply(chrIDs, function(name) {
        observe(lastClickedLink(name)) %>%
          bindEvent(input[[name]])
      })
      observe(lastClickedLink(NULL)) %>%
        bindEvent(length(chrIDs) == 0)
    })
    lastClickedLink
  })
}
