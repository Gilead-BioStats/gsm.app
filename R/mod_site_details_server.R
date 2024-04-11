#' Site Details Server
#'
#' @param id The namespace id
#' @param snapshot The snapshot `list` object passed from `run_app()`
#' @param site The reactive value provided by the site input from `server`
#' @param metric The selected metric.
#'
#' @export

site_details_server <- function(id, snapshot, site, metric) {
  moduleServer(id, function(input, output, session) {
    ##

    observeEvent(site(),
      {
        if (site() == "None") {
          ## Show placeholders

          shinyjs::hide("card_site_metadata_list")
          shinyjs::hide("card_participant_status")
          shinyjs::hide("card_participants")
          shinyjs::show("card_placeholder_site_metadata_list")
          shinyjs::show("card_placeholder_participant_status")
          shinyjs::show("card_placeholder_participants")
        } else {
          ## Hide placeholders

          shinyjs::hide("card_placeholder_site_metadata_list")
          shinyjs::hide("card_placeholder_participant_status")
          shinyjs::hide("card_placeholder_participants")
          shinyjs::show("card_site_metadata_list")
          shinyjs::show("card_participant_status")
          shinyjs::show("card_participants")
        }
      },
      ignoreInit = TRUE
    )


    # ---- screening disposition
    dfENROLL <- reactive({
      get_domain(
        snapshot,
        "dfENROLL",
        "strSiteCol",
        site()
      )
    })

    # ---- demographics
    dfSUBJ <- reactive({
      get_domain(
        snapshot,
        "dfSUBJ",
        "strSiteCol",
        site()
      )
    })

    # ---- AEs and SAEs
    dfAE <- reactive({
      get_domain(
        snapshot,
        "dfAE",
        "strIDCol",
        dfSUBJ()$data[[dfSUBJ()$mapping$strIDCol]]
      )
    })

    # ---- AEs and SAEs
    dfPD <- reactive({
      get_domain(
        snapshot,
        "dfPD",
        "strIDCol",
        dfSUBJ()$data[[dfSUBJ()$mapping$strIDCol]]
      )
    })

    # ---- study disposition
    dfSTUDCOMP <- reactive({
      get_domain(
        snapshot,
        "dfSTUDCOMP",
        "strIDCol",
        dfSUBJ()$data[[dfSUBJ()$mapping$strIDCol]]
      )
    })


    ### Participant Status Functions

    participant_list <- reactive({
      list(
        screened = list(
          eligible = sum(dfSUBJ()$data$enrollyn == "Y"),
          ineligible = sum(dfSUBJ()$data$enrollyn == "N")
        ),
        enrolled = list(
          completed = sum(dfSTUDCOMP()$data$compyn == "Y"),
          discontinued = sum(dfSTUDCOMP()$data$compyn == "N"),
          active = sum(!c(dfSTUDCOMP()$data$compyn %in% c("Y", "N")))
        ),
        discontinued_reasons = dfSTUDCOMP()$data$compreas
      )
    })

    output$metric_metadata_list <- renderUI({
      config_param <- snapshot$lInputs$lMeta$config_param %>%
        filter(
          .data$workflowid == metric(),
          .data$param == "vThreshold"
        )

      meta_workflow <- snapshot$lInputs$lMeta$meta_workflow %>%
        filter(.data$workflowid == metric()) %>%
        select("metric", "numerator", "denominator")

      site_details_metric_meta_data_list(config_param, meta_workflow)
    })

    # output$participant_status_list <- renderUI({
    #
    #     participant_status_nest_list(participant_list())
    #
    # })


    #### Site Participants Tab





    # ---- participant table
    output$participants <- DT::renderDT({
      participant_metrics <- snapshot$lStudyAssessResults[[metric()]]$lData$dfInput %>%
        filter(.data$SiteID == site())

            table <- DT::datatable(
                snapshot$lStudyAssessResults[[metric()]]$lData$dfInput %>%
                    filter(.data$SiteID == site()),
                class = "compact",
                options = list(
                    lengthChange = FALSE,
                    paging = FALSE,
                    searching = FALSE,
                    selection = 'none'
                ),
                rownames = FALSE,
                selection = "none",
                callback = htmlwidgets::JS('
                    table.on("click", "td:nth-child(1)", function(d) {
                        const participant_id = d.currentTarget.innerText;
                        console.log(
                            `Selected participant ID: ${participant_id}`
                        );
                        const namespace = "gsmApp";
                        Shiny.setInputValue(
                            "participant",
                            participant_id
                        );
                    })
                ')
      )
            return(table)
        }, selection = "none")
      if ("Rate" %in% colnames(participant_metrics)) {
        table <- table %>%
          DT::formatRound("Rate", digits = 5)
      }

      return(table)
    })

    # ---- site data
    site_metadata <- reactive({
      shiny::req(site())

      mapping <- snapshot$lInputs$lMapping$dfSITE
      data <- snapshot$lInputs$lMeta$meta_site %>%
        dplyr::filter(
          .data[[mapping$strSiteCol]] == site()
        )

      return(data)
    })


    output$site_metadata_list <- renderUI({
      enrolled_subjects <- dfSUBJ()$data %>%
        filter(.data$enrollyn == "Y") %>%
        select("subjid")
      enrolled_subjects <- enrolled_subjects$subjid

      site_details_meta_data_list(site_metadata(), enrolled_subjects = enrolled_subjects, participant_list = participant_list())
    })
  })

