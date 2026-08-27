#' Plot part of the prevalence plot UI
#'
#' @inheritParams shared-params
#' @returns A [gsm.vizr::barsOutput()] object.
#' @keywords internal
mod_PrevalencePlot_UI <- function(id) {
  ns <- NS(id)
  gsm.vizr::barsOutput(ns("plot"))
}

#' Server side of the plot part of the prevalence plot module
#'
#' @inheritParams shared-params
#' @keywords internal
mod_PrevalencePlot_Server <- function(
  id,
  rctv_dfDomain_Combined,
  rctv_strCategory
) {
  moduleServer(id, function(input, output, session) {
    rctv_dfDomain_Combined_Subset <- reactive({
      req(rctv_dfDomain_Combined())
      req(rctv_strCategory())
      dplyr::select(
        rctv_dfDomain_Combined(),
        dplyr::any_of(c(rctv_strCategory(), "VizLevel"))
      )
    })

    rctv_chrTopValues <- srvr_PullTopValues(
      rctv_dfDomain_Combined_Subset,
      rctv_strCategory
    )

    rctv_dfPrevalence <- reactive({
      req(rctv_dfDomain_Combined_Subset())
      req(rctv_chrTopValues())
      strCategory <- rctv_strCategory()
      df <- rctv_dfDomain_Combined_Subset()
      chrTopValues <- rctv_chrTopValues()
      PreparePrevalenceCounts(df, strCategory, chrTopValues)
    })

    output$plot <- gsm.vizr::renderBars({
      req(rctv_dfPrevalence())
      req(rctv_strCategory())
      PlotPrevalencePlot(rctv_dfPrevalence(), rctv_strCategory())
    })
  })
}

#' Prepare the final prevalence data for plotting
#'
#' @param dfDomain_Combined `data.frame` Values of `strCategory` for each
#'   `VizLevel`.
#' @param chrTopValues `character` The values to show (other values will be
#'   wrapped into "Other").
#'
#' @returns A ready-to-plot data.frame.
#' @keywords internal
PreparePrevalenceCounts <- function(
  dfDomain_Combined,
  strCategory,
  chrTopValues
) {
  dfDomain_Combined %>%
    dplyr::mutate(
      VizCategory = forcats::fct_other(
        .data[[strCategory]],
        keep = chrTopValues
      )
    ) %>%
    dplyr::summarize(
      n = dplyr::n(),
      .by = dplyr::all_of(c("VizLevel", "VizCategory"))
    ) %>%
    dplyr::mutate(
      pct = .data$n / sum(.data$n),
      .by = "VizLevel"
    ) %>%
    tidyr::complete(
      .data$VizLevel,
      .data$VizCategory,
      fill = list(n = 0, pct = 0)
    )
}

#' Build the gsm.viz bars spec for the prevalence plot
#'
#' The predecessor overlaid the three `VizLevel` series at one y position and
#' told them apart by bar width. `bars` has no per-series width control, so the
#' series would fully occlude each other under `position = "identity"`; dodge
#' carries the same comparison with position instead of width.
#'
#' @inheritParams shared-params
#'
#' @returns A [gsm.vizr::bars_spec()] list.
#' @keywords internal
BuildPrevalenceSpec <- function(strCategory) {
  gsm.vizr::bars_spec(
    x = "VizCategory",
    y = "pct",
    fill = "VizLevel",
    stat = "identity",
    orientation = "horizontal",
    position = "dodge",
    # pct is per-VizLevel (each series already sums to 100%), so the
    # stack/dodge toggle's Stack views would mix incomparable series.
    interactive = FALSE,
    scales = list(
      x = list(label = MakeParamLabelsChr(strCategory, chrFieldNames)),
      # ticks$format is currently inert: gsm.viz's getScales.js only reads a
      # value-axis tick format when stat == "percent" or position == "fill",
      # neither true for this dodge/identity chart. Kept as the correct,
      # forward-compatible value for when gsm.viz adds support for it.
      y = list(label = "% of rows", ticks = list(format = ".0%")),
      fill = list(
        # Dodge moves the VizLevel encoding onto colour and position, so unlike
        # the width-encoded predecessor this chart needs a legend. The empty
        # label keeps the legend while dropping its caption.
        label = "",
        colors = list(
          Study = "#1b9e77",
          Group = "#d95f02",
          Participant = "#7570b3"
        )
      )
    ),
    annotations = list(
      labels = list(segment = list(display = TRUE, format = ".0%"))
    )
  )
}

#' Generate the prevalence chart
#'
#' @param dfPrevalence `data.frame` The prepared data.
#' @inheritParams shared-params
#'
#' @returns A [gsm.vizr::bars()] htmlwidget.
#' @keywords internal
PlotPrevalencePlot <- function(dfPrevalence, strCategory) {
  gsm.vizr::bars(dfPrevalence, BuildPrevalenceSpec(strCategory))
}
