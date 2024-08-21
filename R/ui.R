#' Shiny UI function
#'
#' This function defines the user interface for your Shiny web application.
#' It specifies the layout of the web page and the interface elements it contains.
#'
#' @return A Shiny UI object
ui <- function() {
  fluidPage(
    shinyjs::useShinyjs(),
    class = "bg-light",
    style = "min-height: 100vh;",
    title = "GSM Deep Dive",
    theme = bslib::bs_theme(version = 5),
    htmltools::includeCSS(
      system.file("www", "styles.css", package = "gsm.app")
    ),
    htmltools::includeScript(
      system.file("js", "highlightTableRow.js", package = "gsm.app")
    ),
    htmltools::includeScript(
      system.file("js", "tableClick.js", package = "gsm.app")
    ),
    div(
      class = "row", style = "padding-top: 3.5em;",
      hr(style = "padding-left: .25em; padding-right: .25em;")
    ),
    div(
      class = "row",
      div(
        class = "col-12 col-sm-12 col-md-4 col-lg-3 col-xl-3 col-xxl-2 border-end input-div",
        div(
          class = "card mb-3",
          div(
            class = "card-body",
            div(
              class = "row",
              div(
                class = "col-12 col-sm-6 col-md-12 col-lg-12 col-xxl-12",
                h5(class = "card-title", textOutput("text_output_study_id", inline = TRUE)),
                h6(
                  class = "card-subtitle mb-2 text-muted",
                  textOutput("text_output_name", inline = TRUE)
                ),
                h6(
                  class = "card-subtitle mb-2 text-muted",
                  textOutput("text_output_snapshot_date", inline = TRUE)
                ),
                hr(),
                uiOutput("meta_tag_list"),
                hr()
              ),
              div(
                class = "col-12 col-sm-6 col-md-12 col-lg-12 col-xxl-12",
                shinyjs::hidden(selectInput("metric", strong("Metric"), choices = c("None"), width = "100%")),
                shinyjs::hidden(selectInput("site", strong("Site"), choices = c("None"), width = "100%")),
                shinyjs::hidden(selectizeInput("participant", strong("Participant"), choices = "None", width = "100%")),
                actionButton("reset", "Reset All", class = "btn btn-primary btn-sm")
              )
            )
          )
        )
      ),
      div(
        class = "col-12 col-sm-12 col-md-8 col-lg-9 col-xl-9 col-xxl-9",
        bslib::navset_bar(
          bslib::nav_panel(
            title = "Study Overview",
            mod_study_overview_ui("study_overview")
          ),
          bslib::nav_panel(
            title = "Metric Details",
            mod_metric_details_ui("metric_details"),
            mod_site_details_ui("site_details")
          ),
          bslib::nav_panel(
            title = "Participant Details",
            mod_participant_details_ui("participant_details")
          ),
          id = "primary_nav_bar",
          title = "GSM Deep Dive App",
          padding = c("0rem", "0rem", "0rem", "0rem"),
          position = "fixed-top", # "static-top",
          bg = "white"
        )
      )
    )
  )
}
