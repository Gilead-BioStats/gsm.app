#' Group and GroupLevel Dropdown Menu UI
#'
#' @inheritParams shared-params
#' @returns A `list` with one or two [shinyWidgets::virtualSelectInput()]
#'   elements.
#' @keywords internal
mod_GroupInput_UI <- function(id, dfGroups) {
  ns <- NS(id)
  # Default to the *last* GroupLevel to temporarily "hack" it to put Site first.
  chrGroupLevels <- setdiff(
    sort(unique(dfGroups$GroupLevel), decreasing = TRUE),
    "Study"
  )
  chrGroups <- sort(unique(
    dfGroups$GroupID[dfGroups$GroupLevel == chrGroupLevels[[1]]]
  ))

  return(list(
    if (length(chrGroupLevels) > 1) {
      input_NavbarExtra(ns("level"), chrGroupLevels)
    },
    input_NavbarExtra(
      ns("group"),
      c("All", chrGroups),
      label = chrGroupLevels[[1]]
    )
  ))
}

#' Group and GroupLevel Dropdown Menu Server
#'
#' @inheritParams shared-params
#' @returns [shiny::observe()] objects to keep `GroupLevel` and `Group` inputs
#'   and reactives up-to-date.
#' @keywords internal
mod_GroupInput_Server <- function(
  id,
  lGroups,
  rctv_strGroupID,
  rctv_strGroupLevel
) {
  moduleServer(id, function(input, output, session) {
    chrGroupLevels <- names(lGroups)
    if (length(chrGroupLevels) > 1) {
      observe({
        rctv_strGroupLevel(input$level)
      })
      srvr_SyncVirtualSelectInput("level", rctv_strGroupLevel, session)

      rctv_chrGroups <- reactive({
        req(rctv_strGroupLevel())
        lGroups[[rctv_strGroupLevel()]]
      }) %>%
        bindCache(rctv_strGroupLevel())
      observe({
        shinyWidgets::updateVirtualSelect(
          inputId = "group",
          label = strong(rctv_strGroupLevel()),
          choices = c("All", rctv_chrGroups()),
          selected = "All"
        )
      }) %>%
        bindEvent(rctv_strGroupLevel())
    } else {
      rctv_strGroupLevel(chrGroupLevels[[1]])
    }

    observe({
      req(input$group)
      rctv_strGroupID(input$group)
    })
    srvr_SyncVirtualSelectInput("group", rctv_strGroupID, session)
  })
}
