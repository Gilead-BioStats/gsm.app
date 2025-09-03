#' Study, Group, and Participant label buttons
#'
#' @inheritParams shared-params
#' @returns A [htmltools::span()] element containing a set of
#'   [shinyWidgets::checkboxGroupButtons()].
#' @keywords internal
mod_DynamicLabelKey_UI <- function(id) {
  ns <- NS(id)
  span(
    id = id,
    class = "label-key-container",
    "by",
    # shinyWidgets::checkboxGroupButtons is overkill, but it's the only
    # pre-built input I've found so far with "disabled" in the args.
    purrr::map(
      c("Study", "Group", "Participant"),
      function(x) {
        shinyWidgets::checkboxGroupButtons(
          ns(x),
          choices = x,
          status = paste("label-key", tolower(x), sep = "-")
        )
      }
    ),
    htmlDependency_Stylesheet("labelKey.css")
  )
}

#' Activate/inactivate buttons and return values
#'
#' @inheritParams shared-params
#' @returns A list of [shiny::reactive()] objects to determine whether the given
#'   button is selected.
#' @keywords internal
mod_DynamicLabelKey_Server <- function(
  id,
  rctv_strGroupLevel,
  rctv_strGroupID,
  rctv_strSubjectID
) {
  moduleServer(id, function(input, output, session) {
    rctv_lglStudySelected <- reactiveVal(TRUE)
    observe({
      strInput <- NullifyEmpty(input$Study)
      rctv_lglStudySelected(length(strInput) > 0)
    })
    observe({
      strInput <- NullifyEmpty(input$Study)
      strGroupID <- NullifyEmpty(rctv_strGroupID())
      strSubjectID <- NullifyEmpty(rctv_strSubjectID())
      rctv_lglStudySelected(
        !is.null(strInput) || (is.null(strGroupID) && is.null(strSubjectID))
      )
    }) %>%
      bindEvent(rctv_strGroupID(), rctv_strSubjectID())

    rctv_lglGroupSelected <- reactiveVal(TRUE)
    observe({
      strInput <- NullifyEmpty(input$Group)
      rctv_lglGroupSelected(length(strInput) > 0)
    })
    observe({
      strInput <- NullifyEmpty(input$Group)
      strGroupID <- NullifyEmpty(rctv_strGroupID())
      strSubjectID <- NullifyEmpty(rctv_strSubjectID())
      rctv_lglGroupSelected(
        !is.null(strInput) || (length(strGroupID) && is.null(strSubjectID))
      )
    }) %>%
      bindEvent(rctv_strGroupID(), rctv_strSubjectID())

    rctv_lglParticipantSelected <- reactive({
      strInput <- NullifyEmpty(input$Study)
      strSubjectID <- NullifyEmpty(rctv_strSubjectID())
      length(strSubjectID) > 0
    })

    rctv_strGroupLabel <- reactive({
      req(rctv_strGroupLevel())
      req(rctv_strGroupID())
      strGroupID <- NullifyEmpty(rctv_strGroupID())
      if (length(strGroupID)) {
        glue::glue("{rctv_strGroupLevel()} {strGroupID}")
      }
    })
    rctv_strParticipantLabel <- reactive({
      req(rctv_strSubjectID())
      strSubjectID <- NullifyEmpty(rctv_strSubjectID())
      glue::glue("Participant {strSubjectID}")
    })

    srvr_UpdateLabelKey(
      "Study",
      strLabel = "Study",
      lglSelected = rctv_lglStudySelected,
      session = session
    )
    srvr_UpdateLabelKey(
      "Group",
      strLabel = rctv_strGroupLabel,
      lglSelected = rctv_lglGroupSelected,
      session = session
    )
    srvr_UpdateLabelKey(
      "Participant",
      strLabel = rctv_strParticipantLabel,
      lglSelected = rctv_lglParticipantSelected,
      session = session
    )
    return(list(
      Study = reactive(input$Study),
      Group = reactive(input$Group),
      Participant = reactive(input$Participant)
    ))
  })
}

srvr_UpdateLabelKey <- function(
  strInputId,
  strLabel = NULL,
  lglSelected = FALSE,
  session = getDefaultReactiveDomain()
) {
  observe(
    {
      strLabel <- NullifyEmpty(CallIfReactive(strLabel))
      if (length(strLabel)) {
        lglSelected <- CallIfReactive(lglSelected)
        strSelected <- if (lglSelected) {
          strLabel
        }
        shinyWidgets::updateCheckboxGroupButtons(
          session = session,
          inputId = strInputId,
          choices = strLabel,
          selected = strSelected,
          disabled = FALSE,
          status = paste("label-key", tolower(strInputId), sep = "-")
        )
      } else {
        shinyWidgets::updateCheckboxGroupButtons(
          session = session,
          inputId = strInputId,
          choices = strInputId,
          disabled = TRUE,
          status = paste("label-key", tolower(strInputId), sep = "-")
        )
      }
    },
    domain = session
  )
}
