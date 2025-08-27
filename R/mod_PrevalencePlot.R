mod_PrevalencePlot_UI <- function(id, strTitle = NULL) {
  ns <- NS(id)
  out_Card(
    id = ns("card"),
    tagTitle = strTitle,
    div(
      id = ns("title"),
      class = "inline-select",
      htmlDependency_Stylesheet("inlineSelect.css"),
      shinyWidgets::virtualSelectInput(
        ns("category"),
        NULL,
        "",
        inline = TRUE
      ),
      mod_DynamicLabelKey_UI(ns("key"))
    ),
    plotOutput(ns("plot"))
  )
}

mod_PrevalencePlot_Server <- function(
  id,
  rctv_dfDomain,
  rctv_dfDomain_Group,
  rctv_dfDomain_Study,
  rctv_strGroupLevel,
  rctv_strGroupID,
  rctv_strSubjectID,
  l_rctvDomainLoaded
) {
  moduleServer(id, function(input, output, session) {
    # The key (what's turned on/off) needs to be sorted out before we can know
    # what else is happening, so put that at the top.
    l_rctvActive <- mod_DynamicLabelKey_Server(
      "key",
      rctv_strGroupLevel = rctv_strGroupLevel,
      rctv_strGroupID = rctv_strGroupID,
      rctv_strSubjectID = rctv_strSubjectID
    )

    # Now we can prepare the dfs (but not yet subset the columns).
    rctv_dfDomain_Study_Prepared <- reactiveVal(NULL)
    observe({
      req(rctv_strGroupLevel())
      if (length(NullifyEmpty(l_rctvActive$Study()))) {
        df <- PreparePrevalenceData(
          df = rctv_dfDomain_Study(),
          strGroupLevel = rctv_strGroupLevel(),
          strLevel = "Study"
        )
        rctv_dfDomain_Study_Prepared(df)
      } else {
        rctv_dfDomain_Study_Prepared(NULL)
      }
    })

    rctv_dfDomain_Group_Prepared <- reactiveVal(NULL)
    observe({
      req(rctv_strGroupLevel())
      req(rctv_strGroupID())
      if (
        length(NullifyEmpty(rctv_strGroupID())) &&
        length(NullifyEmpty(l_rctvActive$Group()))
      ) {
        df <- PreparePrevalenceData(
          df = rctv_dfDomain_Group(),
          strGroupLevel = rctv_strGroupLevel(),
          strLevel = "Group"
        )
        rctv_dfDomain_Group_Prepared(df)
      } else {
        rctv_dfDomain_Group_Prepared(NULL)
      }
    })

    rctv_dfDomain_Participant_Prepared <- reactiveVal(NULL)
    observe({
      # Caution: rctv_dfDomain() isn't Participant when rctv_strSubjectID()
      # isn't set, so we need to use these reqs to make sure we don't return
      # anything in that case.
      req(rctv_strGroupLevel())
      req(rctv_strSubjectID())
      if (
        length(NullifyEmpty(rctv_strSubjectID())) &&
        length(NullifyEmpty(l_rctvActive$Participant()))
      ) {
        df <- PreparePrevalenceData(
          df = rctv_dfDomain(),
          strGroupLevel = rctv_strGroupLevel(),
          strLevel = "Participant"
        )
        rctv_dfDomain_Participant_Prepared(df)
      } else {
        rctv_dfDomain_Participant_Prepared(NULL)
      }
    })

    rctv_dfDomain_Combined <- reactive({
      combined <- purrr::list_rbind(list(
        Study = rctv_dfDomain_Study_Prepared(),
        Group = rctv_dfDomain_Group_Prepared(),
        Participant = rctv_dfDomain_Participant_Prepared()
      ))
      if (NROW(combined)) {
        combined <- dplyr::mutate(
          combined,
          VizLevel = factor(
            .data$VizLevel,
            levels = c("Study", "Group", "Participant")
          ) |>
            forcats::fct_drop()
        )
      }
      combined
    })

    # Update these as a reactiveVal to make sure they don't change when new data
    # is loaded but nothing really changes.
    rctv_chrCategoricalFields <- reactiveVal()
    observe({
      req(NROW(rctv_dfDomain_Combined()) > 0)
      chrCategoricalFields <- FindCategoricalFieldNames(
        rctv_dfDomain_Combined()
      )
      chrCategoricalFields <- rlang::set_names(
        chrCategoricalFields,
        MakeParamLabelsChr(chrCategoricalFields, chrFieldNames)
      )
      current_fields <- rctv_chrCategoricalFields()
      if (!setequal(chrCategoricalFields, current_fields)) {
        rctv_chrCategoricalFields(chrCategoricalFields)
      }
    })

    srvr_SyncVirtualSelectInput(
      "category",
      session = session,
      rctv_chrChoices = rctv_chrCategoricalFields,
      rctv_strSelected = reactive({rctv_chrCategoricalFields()[[1]]})
    )

    rctv_dfDomain_Combined_Subset <- reactive({
      req(rctv_dfDomain_Combined())
      req(input$category)
      dplyr::select(
        rctv_dfDomain_Combined(),
        dplyr::any_of(c(input$category, "VizLevel"))
      )
    })

    rctv_chrTopValues <- srvr_PullTopValues(
      rctv_dfDomain_Combined_Subset,
      reactive(input$category)
    )

    txt2pct <- scales::label_percent(1)
    output$plot <- renderPlot({
      req(rctv_dfDomain_Combined_Subset())
      req(rctv_strGroupLevel())
      req(input$category)
      req(rctv_chrTopValues())
      strCategory <- input$category
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

PreparePrevalenceData <- function(
  df,
  strGroupLevel,
  strLevel
) {
  if (!NROW(df)) {
    return(NULL)
  }
  if ("GroupLevel" %in% colnames(df)) {
    df <- dplyr::filter(df, .data$GroupLevel == strGroupLevel)
  }
  df |>
    dplyr::select(-dplyr::any_of(c("GroupID", "GroupLevel", "SubjectID"))) |>
    dplyr::mutate(VizLevel = strLevel)
}

#' Standard theme for gsm ggplot2 plots
#'
#' @returns A [ggplot2::theme()].
#' @keywords internal
theme_gsm <- function() {
  ggplot2::theme_minimal(base_size = 20)
}
