out_MainContent <- function(lStudy,
                            chrMetrics,
                            chrSites,
                            dfResults,
                            strTitle = "GSM Deep Dive") {
  div(
    id = "main-content",
    fluidRow(
      out_TopSpacer(),
      # For now, we're intentionally only using 10/12 of this space, ie one
      # "column" that's 10 columns wide.
      #
      # TODO: This should be handled via CSS.
      column(
        width = 10,
        fluidRow(
          out_Sidebar(
            lStudy = lStudy,
            chrMetrics = chrMetrics,
            chrSites = chrSites
          ),
          out_MainTabs(dfResults, strTitle = strTitle)
        )
      )
    )
  )
}

out_TopSpacer <- function() {
  div(
    id = "top-spacer",
    class = "row border-bottom"
  )
}
