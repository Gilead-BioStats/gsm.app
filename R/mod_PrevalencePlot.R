mod_PrevalencePlot_UI <- function(id, strTitle = NULL) {
  ns <- NS(id)
  out_Card(
    id = ns("card"),
    tagTitle = strTitle,
    mod_ChartTitleSelect_Study_Categorical_UI(ns("category")),
    plotOutput(ns("plot"))
  )
}

mod_PrevalencePlot_Server <- function(
  id,
  rctv_dfDomain_Study,
  rctv_strGroupLevel,
  rctv_strGroupID,
  rctv_strSubjectID
) {
  moduleServer(id, function(input, output, session) {
    rctv_strCategory <- mod_ChartTitleSelect_Study_Categorical_Server(
      "category",
      rctv_dfDomain_Study,
      rctv_strGroupLevel,
      rctv_strGroupID,
      rctv_strSubjectID
    )
    rctv_dfDomain_Study_Subset <- reactive({
      req(rctv_dfDomain_Study())
      req(rctv_strCategory())
      req(rctv_strGroupLevel())
      rctv_dfDomain_Study() |>
        dplyr::filter(.data$GroupLevel == rctv_strGroupLevel()) |>
        dplyr::select(dplyr::all_of(
          c("SubjectID", "GroupID", rctv_strCategory())
        ))
    })
    rctv_chrTopValues <- srvr_PullTopValues(
      rctv_dfDomain_Study_Subset,
      rctv_strCategory
    )
    rctv_dfDomain_Group <- reactive({
      req(rctv_dfDomain_Study_Subset())
      PreparePrevalenceData(
        df = rctv_dfDomain_Study_Subset(),
        strCategory = rctv_strCategory(),
        strFieldName = "GroupID",
        strFieldValue = NullifyEmpty(rctv_strGroupID()),
        strLevel = rctv_strGroupLevel()
      )
    })
    rctv_dfDomain_Subject <- reactive({
      req(rctv_dfDomain_Study_Subset())
      PreparePrevalenceData(
        df = rctv_dfDomain_Study_Subset(),
        strCategory = rctv_strCategory(),
        strFieldName = "SubjectID",
        strFieldValue = NullifyEmpty(rctv_strSubjectID()),
        strLevel = "Subject"
      )
    })

    txt2pct <- scales::label_percent(1)
    output$plot <- renderPlot({
      req(rctv_dfDomain_Study_Subset())
      req(rctv_strGroupLevel())
      req(rctv_strCategory())
      req(rctv_chrTopValues())
      strCategory <- rctv_strCategory()
      strGroupLevel <- rctv_strGroupLevel()
      dfDomain_Study <- rctv_dfDomain_Study_Subset()
      dfDomain_Group <- rctv_dfDomain_Group()
      dfDomain_Subject <- rctv_dfDomain_Subject()
      chrTopValues <- rctv_chrTopValues()
      chrLevels <- c(
        "Study",
        if (NROW(dfDomain_Group)) strGroupLevel,
        if (NROW(dfDomain_Subject)) "Subject"
      )

      dfDomain_Combined <- dfDomain_Study %>%
        dplyr::select(dplyr::all_of(strCategory)) %>%
        dplyr::mutate(level = "Study") %>%
        dplyr::bind_rows(
          dfDomain_Group,
          dfDomain_Subject
        )

      if (length(unique(dfDomain_Combined[[strCategory]])) > 6) {
        chrTopValues <- utils::head(chrTopValues, 5)
      }

      dfDomain_Combined %>%
        dplyr::mutate(
          level = factor(.data$level, levels = chrLevels),
          category = forcats::fct_other(
            .data[[strCategory]],
            keep = chrTopValues
          )
        ) %>%
        dplyr::summarize(
          n = dplyr::n(),
          .by = dplyr::all_of(c("level", "category"))
        ) %>%
        dplyr::mutate(
          pct = .data$n / sum(.data$n),
          .by = "level"
        ) %>%
        tidyr::complete(
          .data$level,
          .data$category,
          fill = list(n = 0, pct = 0)
        ) %>%
        dplyr::mutate(
          fill_color = dplyr::case_match(
            as.character(.data$level),
            "Study" ~ "#1b9e77",
            "Subject" ~ "#7570b3",
            .default = "#d95f02"
          ) |>
            factor()
        ) |>
        ggplot2::ggplot() +
        ggplot2::aes(
          x = .data$pct,
          y = .data$category,
          fill = .data$fill_color,
          width = 0.9 * dplyr::case_match(
            as.character(.data$level),
            "Study" ~ 1,
            "Subject" ~ 0.25,
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
            y = as.numeric(.data$category) + dplyr::case_match(
              as.character(.data$level),
              "Study" ~ 0.3,
              "Subject" ~ -0.3,
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

PreparePrevalenceData <- function(
  df,
  strCategory,
  strFieldName,
  strFieldValue,
  strLevel
) {
  if (is.null(strFieldValue)) {
    return(NULL)
  }

  df %>%
    dplyr::filter(.data[[strFieldName]] == strFieldValue) %>%
    dplyr::mutate(level = strLevel) %>%
    dplyr::select(dplyr::all_of(c("level", strCategory)))
}

#' Standard theme for gsm ggplot2 plots
#'
#' @returns A [ggplot2::theme()].
#' @keywords internal
theme_gsm <- function() {
  ggplot2::theme_minimal(base_size = 20)
}
