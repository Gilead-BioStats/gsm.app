html_Sidebar <- function() {
  shiny::column(
    width = 3,
    id = "sidebar",
    html_StudyInformation(),
    html_Inputs()
  )
}

html_StudyInformation <- function() {
  bslib::card(
    bslib::card_header(
      htmltools::h5(
        textOutput("text_output_study_id", inline = TRUE)
      ),
      htmltools::h6(
        class = "card-subtitle mb-2 text-muted",
        textOutput("text_output_name", inline = TRUE)
      ),
      h6(
        class = "card-subtitle text-muted",
        textOutput("text_output_snapshot_date", inline = TRUE)
      )
    ),
    htmltools::div(
      class = "border-top border-bottom",
      uiOutput("meta_tag_list")
    )
  )
}

html_Inputs <- function() {
  bslib::card(
    class = "overflow-on",
    bslib::card_body(
      class = "overflow-on",
      shinyjs::hidden(selectInput("metric", strong("Metric"), choices = c("None"), width = "100%")),
      shinyjs::hidden(selectInput("site", strong("Site"), choices = c("None"), width = "100%")),
      shinyjs::hidden(selectizeInput("participant", strong("Participant"), choices = "None", width = "100%")),
      actionButton("reset", "Reset All", class = "btn btn-primary btn-sm")
    )
  )
}
