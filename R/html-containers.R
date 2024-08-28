html_MainContent <- function(strTitle = "GSM Deep Dive") {
  htmltools::div(
    id = "main-content",
    shiny::fluidRow(
      html_TopSpacer(),
      # For now, we're intentionally only using 10/12 of this space, ie one
      # "column" that's 10 columns wide.
      #
      # TODO: This should be handled via CSS.
      shiny::column(
        width = 10,
        shiny::fluidRow(
          html_Sidebar(),
          html_MainTabs(strTitle = strTitle)
        )
      )
    )
  )
}

html_TopSpacer <- function() {
  htmltools::div(
    id = "top-spacer",
    class = "row border-bottom"
  )
}

html_MainTabs <- function(strTitle = "GSM Deep Dive") {
  shiny::column(
    width = 9,
    class = "pt-1",
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
        mod_ParticipantDetails_UI("participant_details")
      ),
      id = "primary_nav_bar",
      title = strTitle,
      padding = 0,
      position = "fixed-top",
      bg = "white"
    )
  )
}

html_CardPlaceholder <- function(strID, strTitle, strRequiredSelect) {
  bslib::card(
    id = strID,
    bslib::card_title(strTitle),
    bslib::card_body(
      bslib::card(
        class = "placeholder",
        glue::glue("Please select a {strRequiredSelect}.")
      )
    )
  )
}
