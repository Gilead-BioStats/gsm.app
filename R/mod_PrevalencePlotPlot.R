mod_PrevalencePlotPlot_UI <- function(id) {
  ns <- NS(id)
  plotOutput(ns("plot"))
}

mod_PrevalencePlotPlot_Server <- function(
  id,
  rctv_dfDomain_Combined,
  rctv_strCategory,
  rctv_strGroupLevel
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

    txt2pct <- scales::label_percent(1)
    output$plot <- renderPlot({
      req(rctv_dfDomain_Combined_Subset())
      req(rctv_strGroupLevel())
      req(rctv_strCategory())
      req(rctv_chrTopValues())
      strCategory <- rctv_strCategory()
      strGroupLevel <- rctv_strGroupLevel()
      df <- rctv_dfDomain_Combined_Subset()
      chrTopValues <- rctv_chrTopValues()

      if (length(unique(df[[strCategory]])) > 6) {
        chrTopValues <- utils::head(chrTopValues, 5)
      }

      df %>%
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
          fill_color = dplyr::case_match(
            as.character(.data$VizLevel),
            "Study" ~ "#1b9e77",
            "Participant" ~ "#7570b3",
            .default = "#d95f02"
          ) |>
            factor()
        ) |>
        ggplot2::ggplot() +
        ggplot2::aes(
          x = .data$pct,
          y = .data$VizCategory,
          fill = .data$fill_color,
          width = 0.9 * dplyr::case_match(
            as.character(.data$VizLevel),
            "Study" ~ 1,
            "Participant" ~ 0.25,
            .default = 0.5
          )
        ) +
        ggplot2::geom_col(
          position = "identity",
          color = "black"
        ) +
        ggplot2::geom_label(
          ggplot2::aes(
            label = txt2pct(.data$pct),
            y = as.numeric(.data$VizCategory) + dplyr::case_match(
              as.character(.data$VizLevel),
              "Study" ~ 0.3,
              "Participant" ~ -0.3,
              .default = 0
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
    })
  })
}

#' Standard theme for gsm ggplot2 plots
#'
#' @returns A [ggplot2::theme()].
#' @keywords internal
theme_gsm <- function() {
  ggplot2::theme_minimal(base_size = 20)
}
