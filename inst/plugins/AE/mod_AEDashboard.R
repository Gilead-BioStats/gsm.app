mod_AEDashboard_UI <- function(id) {
  ns <- NS(id)
  bslib::layout_columns(
    bslib::value_box(
      "# of AE",
      textOutput(ns("ae_count"))
    ),
    bslib::value_box(
      "# of SAE",
      textOutput(ns("sae_count"))
    ),
    out_Card(
      "Severity",
      plotOutput(ns("severity_bars"))
    )
  )
}

mod_AEDashboard_server <- function(id, rctv_dfAE_mod) {
  moduleServer(id, function(input, output, session) {
    output$ae_count <- renderText({
      NROW(rctv_dfAE_mod())
    })
    output$sae_count <- renderText({
      dfAE <- rctv_dfAE_mod()
      n_sae <- 0L
      if (NROW(dfAE)) {
        n_sae <- sum(dfAE$aeser == "Y")
      }
      return(n_sae)
    })
    output$severity_bars <- renderPlot({
      req(rctv_dfAE_mod())
      dfAE <- rctv_dfAE_mod()
      dfAE %>%
        ggplot2::ggplot() +
        ggplot2::theme_minimal(base_size = 20) +
        ggplot2::theme(
          panel.grid = ggplot2::element_blank(),
          axis.title = ggplot2::element_blank(),
          axis.text.y = ggplot2::element_blank()
        ) +
        ggplot2::aes(x = .data$aetoxgr) +
        ggplot2::geom_bar(fill = "#007BC2") +
        ggplot2::geom_text(
          stat = "count",
          ggplot2::aes(label = ggplot2::after_stat(.data$count)),
          vjust = -0.5,
          size = ggplot2::rel(5)
        )
    })
  })
}
