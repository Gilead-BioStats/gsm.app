#' Plot part of the prevalence plot UI
#'
#' @inheritParams shared-params
#' @returns A [shiny::plotOutput()] object.
#' @keywords internal
mod_PrevalencePlot_UI <- function(id) {
  ns <- NS(id)
  plotOutput(ns("plot"))
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

    output$plot <- renderPlot({
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
    ) %>%
    dplyr::mutate(
      fill_color = RecodeValues(
        as.character(.data$VizLevel),
        "Study" ~ "#1b9e77",
        "Participant" ~ "#7570b3",
        default = "#d95f02"
      ) %>%
        factor()
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
    scales = list(
      x = list(label = MakeParamLabelsChr(strCategory, chrFieldNames)),
      y = list(label = "% of rows"),
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
      labels = list(segment = list(display = TRUE, formatter = ".0%"))
    )
  )
}

#' Generate the prevalence ggplot
#'
#' @param dfPrevalence `data.frame` The prepared data.
#' @inheritParams shared-params
#'
#' @returns A [ggplot2::ggplot()].
#' @keywords internal
PlotPrevalencePlot <- function(dfPrevalence, strCategory) {
  ggplot2::ggplot(dfPrevalence) +
    ggplot2::aes(
      x = .data$pct,
      y = .data$VizCategory,
      fill = .data$fill_color,
      width = 0.9 *
        RecodeValues(
          as.character(.data$VizLevel),
          "Study" ~ 1,
          "Participant" ~ 0.25,
          default = 0.5
        )
    ) +
    ggplot2::geom_col(
      position = "identity",
      color = "black",
      linewidth = ggplot2::rel(0.5)
    ) +
    ggplot2::geom_label(
      ggplot2::aes(
        label = scales::label_percent(1)(.data$pct),
        y = as.numeric(.data$VizCategory) +
          RecodeValues(
            as.character(.data$VizLevel),
            "Study" ~ 0.3,
            "Participant" ~ -0.3,
            default = 0
          )
      ),
      x = 1.1,
      color = "white",
      size = 14,
      size.unit = "pt",
      fontface = "bold"
    ) +
    ggplot2::scale_x_continuous(
      breaks = NULL,
      limits = c(0, 1.2)
    ) +
    ggplot2::scale_fill_identity() +
    theme_gsm() +
    ggplot2::labs(
      x = "% of rows",
      y = MakeParamLabelsChr(strCategory, chrFieldNames)
    ) +
    ggplot2::theme(legend.position = "none")
}

#' Standard theme for gsm ggplot2 plots
#'
#' @returns A [ggplot2::theme()].
#' @keywords internal
theme_gsm <- function() {
  ggplot2::theme_minimal(base_size = 20)
}
