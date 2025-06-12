#' Widget Plot Module UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] with an optional title and the corresponding
#'   `fnWidgetOutput` and dependencies to load it.
#' @keywords internal
mod_WidgetPlot_UI <- function(
  id,
  fnHtmlDependency,
  fnWidgetOutput,
  strPlotTitle = NULL,
  strGroupLevel = NULL
) {
  ns <- NS(id)
  out_Card(
    tagTitle = strPlotTitle,
    id = id,
    class = "chart",
    `data-group-level` = strGroupLevel,
    fnHtmlDependency(),
    fnWidgetOutput(ns("plot"))
  )
}

#' Widget Plot Input JavaScript
#'
#' Attach the appropriate `*Input.js` to an app or other HTML exactly once.
#'
#' @returns An [htmltools::tagList()] of `html_dependency` objects (see
#'   [htmltools::htmlDependency()]), so that each will be attached to the Shiny
#'   app exactly once, regardless of how many times they are added.
#' @keywords internal
htmlDependency_WidgetPlotInput <- function(strWidgetName) {
  strBaseName <- sub("Widget_", "", strWidgetName)
  substr(strBaseName, 1, 1) <- tolower(substr(strBaseName, 1, 1))
  tagList(
    htmlDependency_WidgetInputHelpers(),
    htmltools::htmlDependency(
      name = paste0(strBaseName, "Input"),
      version = "1.0.0",
      src = "inputs",
      package = "gsm.app",
      script = paste0(strBaseName, "Input.js")
    )
  )
}

#' Widget Input JavaScript
#'
#' Attach `widgetInputHelpers.js` to an app or other HTML exactly once.
#'
#' @returns An `html_dependency` object (see [htmltools::htmlDependency()]),
#'   which is attached to the Shiny app exactly once, regardless of how many
#'   times it is added.
#' @keywords internal
htmlDependency_WidgetInputHelpers <- function() {
  htmltools::htmlDependency(
    name = "widgetInputHelpers",
    version = "1.0.0",
    src = "inputs",
    package = "gsm.app",
    script = "widgetInputHelpers.js"
  )
}

#' Standardized Plot Widgets as Shiny Modules
#'
#' @inheritParams shared-params
#' @param fn_Widget A function that uses [htmlwidgets::createWidget()] to create
#'   a widget.
#' @param fn_WidgetOutput A function that uses
#'   [htmlwidgets::shinyWidgetOutput()] to create the shiny version of a widget.
#' @param ... Additional parameters passed to `fn_Widget`.
#' @keywords internal
mod_WidgetPlot_Server <- function(
  id,
  fn_Widget,
  fn_WidgetOutput,
  rctv_dfResults,
  rctv_lMetric,
  dfGroups,
  rctv_dfBounds,
  rctv_strGroupID,
  ...
) {
  moduleServer(id, function(input, output, session) {
    rctv_chrKnownGroups <- reactive({
      req(rctv_dfResults())
      sort(unique(rctv_dfResults()$GroupID))
    })

    output$plot <- renderWidgetPlot(
      {
        dfGroups <- dplyr::semi_join(
          dfGroups,
          dplyr::distinct(rctv_dfResults(), .data$GroupID, .data$GroupLevel),
          by = c("GroupID", "GroupLevel")
        )
        fn_Widget(
          session$ns("plot"),
          rctv_dfResults(),
          lMetric = rctv_lMetric(),
          dfGroups = dfGroups,
          dfBounds = rctv_dfBounds(),
          ...
        )
      },
      fn_WidgetOutput
    )
    observe({
      strGroupID <- NullifyEmpty(rctv_strGroupID())
      if (is.null(strGroupID) || strGroupID %in% rctv_chrKnownGroups()) {
        session$sendCustomMessage(
          type = "updateWidgetPlotGroup",
          message = list(
            id = session$ns("plot"),
            selectedGroupID = strGroupID
          )
        )
      }
    }) %>%
      bindEvent(rctv_strGroupID(), ignoreNULL = FALSE, ignoreInit = TRUE)

    observe({
      strGroupID_Plot <- input$plot
      strGroupID <- NullifyEmpty(rctv_strGroupID())
      if (!is.null(strGroupID_Plot) && strGroupID_Plot != "") {
        rctv_strGroupID(strGroupID_Plot)
      } else if (
        is.null(strGroupID_Plot) &&
          !is.null(strGroupID) && strGroupID %in% rctv_chrKnownGroups()
      ) {
        rctv_strGroupID("All")
      }
    }) %>%
      bindEvent(input$plot, ignoreNULL = FALSE)
  })
}
