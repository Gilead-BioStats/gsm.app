#' Shiny UI function
#'
#' This function defines the user interface for your Shiny web application.
#' It specifies the layout of the web page and the interface elements it contains.
#'
#' @return A Shiny UI object

ui <- function() {
  fluidPage(
    class = "bg-light",
    style = "min-height: 100vh;",
    title = "GSM Deep Dive",
    theme = bslib::bs_theme(version = 5),
    htmltools::includeCSS(
      system.file("www", "styles.css", package = "gsmApp")
    ),
    div(
      class = "row", style = "padding-top: 3.5em;",
      hr(style = "padding-left: .25em; padding-right: .25em;")
    ),
    div(
      class = "row",
      div(
        class = "col-12 col-sm-12 col-md-4 col-lg-3 col-xxl-2 border-end",
        div(
          class = "card mb-3",
          style = "border-top: solid #0dcaf0;",
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
                selectInput("metric", strong("Metric"), choices = c("None")),
                selectInput("site", strong("Site"), choices = c("None")),
                selectizeInput("participant", strong("Participant"), choices = "None"),
                actionButton("reset", "Reset All")
              )
            )
          )
        )
      ),
      div(
        class = "col-12 col-sm-12 col-md-8 col-lg-9 col-xxl-10",
        navset_bar(
          nav_panel(
            title = "Study Overview",
            study_overview_ui("study_overview")
          ),
          nav_panel(
            title = "Metric Details",
            metric_details_ui("metric_details"),
            site_details_ui("site_details")
          ),
          nav_panel(
            title = "Participant Details",
            participant_details_ui("participant_details")
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
