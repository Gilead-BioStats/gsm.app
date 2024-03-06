#' Creates taglist to summarize participants at a particular site
#' @param combinedData `data.frame` A combined data set with the required metrics.
#' @export
#' @keywords internal

participant_status_nest_list <- function(participant_list = NULL) {
  req(participant_list)

  if (length(participant_list[["discontinued_reasons"]]) != 0) {
    discontinued_reasons <- participant_list[["discontinued_reasons"]]
    discontinued_reasons_unique <- unique(discontinued_reasons)

    discontinued_tags <- tagList(
      tags$ul(
        lapply(1:length(discontinued_reasons_unique), function(x) {
          tags$li(
            div(
              class = "row",
              div(
                style = "display: flex; justify-content: space-between;",
                div(style = "text-align: left; white-space: nowrap;", stringr::str_trunc(stringr::str_to_sentence(discontinued_reasons_unique[x]), 25)),
                div(style = "border-bottom: 1px dotted; width: 95%; margin-bottom: .4em; margin-right: .4em; margin-left: .4em;"),
                div(style = "text-align: right;", sum(discontinued_reasons == discontinued_reasons_unique[x]))
              )
            )
          )
        })
      )
    )
  } else {
    discontinued_tags <- ""
  }

  participant_tag_list <- tagList(
    div(
      class = "rounded-2 px-1",
      div(
        class = "row",
        style = "font-weight: 500;",
        div(
          style = "display: flex; justify-content: space-between;",
          div(style = "text-align: left; white-space: nowrap;", "Screened"),
          div(style = "border-bottom: 1px dotted; width: 95%; margin-bottom: .4em; margin-right: .4em; margin-left: .4em;"),
          div(style = "text-align: right;", sum(participant_list[["screened"]]$eligible, participant_list[["screened"]]$ineligible))
        )
      ),
      tags$ul(
        tags$li(
          div(
            class = "row",
            div(
              style = "display: flex; justify-content: space-between;",
              div(style = "text-align: left; white-space: nowrap;", "Eligible"),
              div(style = "border-bottom: 1px dotted; width: 95%; margin-bottom: .4em; margin-right: .4em; margin-left: .4em;"),
              div(style = "text-align: right;", sum(participant_list[["screened"]]$eligible))
            )
          )
        ),
        tags$li(
          div(
            class = "row",
            div(
              style = "display: flex; justify-content: space-between;",
              div(style = "text-align: left; white-space: nowrap;", "Ineligible"),
              div(style = "border-bottom: 1px dotted; width: 95%; margin-bottom: .4em; margin-right: .4em; margin-left: .4em;"),
              div(style = "text-align: right;", sum(participant_list[["screened"]]$ineligible))
            )
          )
        )
      ),
      tags$div(
        class = "row",
        style = "font-weight: 500;",
        div(
          style = "display: flex; justify-content: space-between;",
          div(style = "text-align: left; white-space: nowrap;", "Enrolled"),
          div(style = "border-bottom: 1px dotted; width: 95%; margin-bottom: .4em; margin-right: .4em; margin-left: .4em;"),
          div(style = "text-align: right;", sum(participant_list[["enrolled"]]$eligible, participant_list[["enrolled"]]$ineligible))
        )
      ),
      tags$ul(
        tags$li(
          div(
            class = "row",
            div(
              style = "display: flex; justify-content: space-between;",
              div(style = "text-align: left; white-space: nowrap;", "Active"),
              div(style = "border-bottom: 1px dotted; width: 95%; margin-bottom: .4em; margin-right: .4em; margin-left: .4em;"),
              div(style = "text-align: right;", sum(participant_list[["enrolled"]]$active))
            )
          )
        ),
        tags$li(
          div(
            class = "row",
            div(
              style = "display: flex; justify-content: space-between;",
              div(style = "text-align: left; white-space: nowrap;", "Completed"),
              div(style = "border-bottom: 1px dotted; width: 95%; margin-bottom: .4em; margin-right: .4em; margin-left: .4em;"),
              div(style = "text-align: right;", sum(participant_list[["enrolled"]]$completed))
            )
          )
        ),
        tags$li(
          div(
            class = "row",
            div(
              style = "display: flex; justify-content: space-between;",
              div(style = "text-align: left; white-space: nowrap;", "Discontinued"),
              div(style = "border-bottom: 1px dotted; width: 95%; margin-bottom: .4em; margin-right: .4em; margin-left: .4em;"),
              div(style = "text-align: right;", sum(participant_list[["enrolled"]]$discontinued))
            )
          ),
          discontinued_tags
        )
      ),
    )
  )


  return(participant_tag_list)
}
