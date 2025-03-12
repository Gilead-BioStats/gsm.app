#' Group Overview Module UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] with a [mod_RAGPillSet_UI()] and a corresponding
#'   [Widget_GroupOverviewOutput()].
#' @keywords internal
mod_GroupOverview_UI <- function(id, dfResults) {
  ns <- NS(id)
  out_Card(
    tagTitle = NULL,
    bslib::card_body(
      mod_RAGPillSet_UI(
        ns("kri_counts"),
        intRed = sum(abs(dfResults$Flag) == 2, na.rm = TRUE),
        intAmber = sum(abs(dfResults$Flag) == 1, na.rm = TRUE)
      ),
      Widget_GroupOverviewOutput(ns("group_overview"))
    ),
    id = id
  )
}

#' Group Overview Module Server
#'
#' @inheritParams shared-params
#' @keywords internal
mod_GroupOverview_Server <- function(
    id,
    dfResults,
    dfMetrics,
    dfGroups,
    rctv_strMetricID,
    rctv_strSiteID
) {
  moduleServer(id, function(input, output, session) {
    dfResults <- gsm.kri::FilterByLatestSnapshotDate(dfResults)
    rctv_strGroupSubset <- reactiveVal("red")

    rctv_strGroupSubset_Pills <- mod_RAGPillSet_Server(
      "kri_counts",
      rctv_strGroupSubset
    )

    observe({
      rctv_strGroupSubset(rctv_strGroupSubset_Pills())
    }) %>%
      bindEvent(rctv_strGroupSubset_Pills())

    output$group_overview <- renderWidget_GroupOverview({
      Widget_GroupOverview(
        id = session$ns("group_overview"),
        dfResults = dfResults,
        dfMetrics = dfMetrics,
        dfGroups = dfGroups,
        strGroupSubset = rctv_strGroupSubset()
      )
    })
    outputOptions(output, "group_overview", suspendWhenHidden = FALSE)

    observe({
      req(input$group_overview$selectedMetricID)
      rctv_strMetricID(input$group_overview$selectedMetricID)
    })
    observe({
      req(input$group_overview$selectedGroupID)
      rctv_strSiteID(input$group_overview$selectedGroupID)
    })
    observe({
      req(input$group_overview$groupSubset)
      rctv_strGroupSubset(input$group_overview$groupSubset)
    })
  })
}

#' Group Overview Widget
#'
#' @inheritParams shared-params
#' @keywords internal
Widget_GroupOverview <- function(
    id,
    dfResults,
    dfMetrics,
    dfGroups,
    strGroupLevel = NULL,
    strGroupSubset = "red",
    strGroupLabelKey = "InvestigatorLastName"
) {
  # set strGroupLevel if NULL and dfMetrics is not NULL
  if (is.null(strGroupLevel) && !is.null(dfMetrics)) {
    strGroupLevel <- unique(dfMetrics$GroupLevel)
  }

  if (is.null(strGroupLevel) || length(strGroupLevel) != 1) {
    gsmappAbort(
      "A single group level must be provided to create group-level output.",
      strClass = "missing_strGroupLevel"
    )
  }

  input <- list(
    id = id,
    dfResults = dfResults,
    dfMetrics = dfMetrics,
    dfGroups = dfGroups,
    strGroupLevel = strGroupLevel,
    strGroupSubset = strGroupSubset,
    strGroupLabelKey = strGroupLabelKey
  )

  htmlwidgets::createWidget(
    name = "Widget_GroupOverview",
    purrr::map(
      input,
      ~ jsonlite::toJSON(
        .x,
        null = "null",
        na = "string",
        auto_unbox = TRUE
      )
    ),
    package = "gsm.app",
    width = "100%",
    dependencies = gsmDependencies("Widget_GroupOverview")
  )
}

#' Shiny bindings for Widget_GroupOverview
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like `'100%'`, `'400px'`,
#'   `'auto'`) or a number, which will be coerced to a string and have `'px'`
#'   appended.
#' @param expr An expression that generates a Widget_GroupOverview
#' @param env The environment in which to evaluate `expr`.
#' @param quoted Is `expr` a quoted expression (with [quote()])? This is useful
#'   if you want to save an expression in a variable.
#'
#' @name Widget_GroupOverview-shiny
#' @keywords internal
Widget_GroupOverviewOutput <- function(outputId, width = "100%", height = "100%") {
  tagList(
    htmlDependency_GroupOverview(),
    fluidRow(
      class = "gy-2",
      gsmWidgetOutput(
        "Widget_GroupOverview",
        outputId,
        width,
        height
      ),
      div(
        "Click cells for associated risk signal details.",
        class = "footnote"
      )
    )
  )
}

#' @rdname Widget_GroupOverview-shiny
#' @keywords internal
renderWidget_GroupOverview <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) {
    expr <- substitute(expr)
  } # force quoted
  htmlwidgets::shinyRenderWidget(
    expr,
    Widget_GroupOverviewOutput,
    env,
    quoted = TRUE,
    cacheHint = NULL
  )
}

#' GroupOverview Dependencies
#'
#' @returns An [htmltools::tagList()] of `html_dependency` objects (see
#'   [htmltools::htmlDependency()]), so that each will be attached to the Shiny
#'   app exactly once, regardless how many times they are added.
#' @keywords internal
htmlDependency_GroupOverview <- function() {
  tagList(
    htmlDependency_Stylesheet("groupOverview.css"),
    htmlDependency_GroupOverviewInput()
  )
}

#' Group Overview Input JavaScript
#'
#' @returns An [htmltools::tagList()] of `html_dependency` objects (see
#'   [htmltools::htmlDependency()]), so that each will be attached to the Shiny
#'   app exactly once, regardless how many times they are added.
#' @keywords internal
htmlDependency_GroupOverviewInput <- function() {
  tagList(
    htmlDependency_WidgetInputHelpers(),
    htmltools::htmlDependency(
      name = "groupOverviewInput",
      version = "1.0.0",
      src = "inputs",
      package = "gsm.app",
      script = "groupOverviewInput.js"
    )
  )
}
