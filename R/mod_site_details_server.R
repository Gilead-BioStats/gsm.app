#' Site Details Server
#'
#' @import stringr
#'
#' @export

site_details_server <- function(id, snapshot, site) {
    moduleServer(id, function(input, output, session) {

        ##

        observeEvent(site(),{

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


        }, ignoreInit = TRUE)



        # ---- screening disposition
        dfENROLL <- reactive({
            t_get_domain(
                snapshot,
                'dfENROLL',
                'strSiteCol',
                site()
            )
        })

        # ---- demographics
        dfSUBJ <- reactive({
            t_get_domain(
                snapshot,
                'dfSUBJ',
                'strSiteCol',
                site()
            )
        })

        # ---- AEs and SAEs
        dfAE <- reactive({
            t_get_domain(
                snapshot,
                'dfAE',
                'strIDCol',
                dfSUBJ()$data[[ dfSUBJ()$mapping$strIDCol ]]
            )
        })

        # ---- AEs and SAEs
        dfPD <- reactive({
            t_get_domain(
                snapshot,
                'dfPD',
                'strIDCol',
                dfSUBJ()$data[[ dfSUBJ()$mapping$strIDCol ]]
            )
        })

        # ---- study disposition
        dfSTUDCOMP <- reactive({
            t_get_domain(
                snapshot,
                'dfSTUDCOMP',
                'strIDCol',
                dfSUBJ()$data[[ dfSUBJ()$mapping$strIDCol ]]
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
                    active = sum(!c(dfSTUDCOMP()$data$compyn %in% c("Y","N")))
                ),
                discontinued_reasons = dfSTUDCOMP()$data$compreas
            )

        })

        output$participant_status_list <- renderUI({

            participantStudyNestedList(participant_list())

        })


        #### Site Participants Tab


        # ---- participant table
        output$participants <- DT::renderDT({

            req(dfSUBJ())
            req(dfAE())
            req(dfPD())


            data <- dfSUBJ()$data %>%
                dplyr::select(
                    'ID' = dfSUBJ()$mapping$strIDCol,
                    'Days on Study' = dfSUBJ()$mapping$strTimeOnStudyCol,
                    'Days on Treatment' = dfSUBJ()$mapping$strTimeOnTreatmentCol
                )

            dfAEs <- dfAE()$data |>
                select("subjid", "aeser") |>
                group_by(.data$subjid) |>
                summarize(AEs = n(),
                          SAEs = sum(.data$aeser == "Y"))

            dfPDs <- dfPD()$data |>
                select("subjectenrollmentnumber", "deemedimportant") |>
                group_by(.data$subjectenrollmentnumber) |>
                summarize(PDs = n(),
                          IPDs = sum(deemedimportant == "Yes"))


            data <- data |>
                left_join(dfAEs, c("ID" = "subjid")) |>
                left_join(dfPDs, c("ID" = "subjectenrollmentnumber")) |>
                arrange(.data$ID)

            table <- data %>%
                DT::datatable(
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
                    '),

                    class = "compact",
                    options = list(
                        lengthChange = FALSE,
                        paging = FALSE,
                        searching = FALSE,
                        selection = 'none',
                        columnDefs = list(
                            list(width = "80px", targets = c(1,2)),
                            list(width = "15px", targets = c(0,3,4,5,6)),
                            list(className = "dt-center", targets = c(0:6))
                        )
                    ),
                    rownames = FALSE,
                )

            return(table)
        })

        # ---- site data
        site_metadata <- reactive({
            shiny::req(site())

            mapping <- snapshot$lInputs$lMapping$dfSITE
            data <- snapshot$lInputs$lMeta$meta_site %>%
                dplyr::filter(
                    .data[[ mapping$strSiteCol ]] == site()
                )

            return(data)
        })


        output$site_metadata_list <- renderUI({

            enrolled_subjects <- dfSUBJ()$data |> filter(.data$enrollyn == "Y") |> select("subjid")
            enrolled_subjects <- enrolled_subjects$subjid

            site_details_meta_data_list(site_metadata(), enrolled_subjects = enrolled_subjects)

        })

    })
}

# site_details_server <- function(id, snapshot, site) {
#     shiny::moduleServer(id, function(input, output, session) {
#         # ---- site data
#         site_metadata <- reactive({
#             shiny::req(site())
#
#             mapping <- snapshot$lInputs$lMapping$dfSITE
#             data <- snapshot$lInputs$lMeta$meta_site %>%
#                 dplyr::filter(
#                     .data[[ mapping$strSiteCol ]] == site()
#                 )
#
#             return(data)
#         })
#
#         # ---- screening disposition
#         dfENROLL <- get_domain(
#             snapshot,
#             'dfENROLL',
#             'strSiteCol',
#             site()
#         )
#
#         # ---- demographics
#         dfSUBJ <- get_domain(
#             snapshot,
#             'dfSUBJ',
#             'strSiteCol',
#             site()
#         )
# #
#         # ---- demographics
#         dfAE <- get_domain(
#             snapshot,
#             'dfAE'#,
#            # 'strSiteCol',
#             #site()
#         )
#
#         # ---- study disposition
#         dfSTUDCOMP <- get_domain(
#             snapshot,
#             'dfSTUDCOMP',
#             'strIDCol',
#             dfSUBJ()$data[[ dfSUBJ()$mapping$strIDCol ]]
#         )
#
#         # ---- disposition summary
#         disposition <- reactive({
#             req(
#                 #dfENROLL(),
#                 dfSUBJ()
#                 #dfSTUDCOMP()
#             )
#
#             screening_disposition <- table(
#                 dfENROLL()$data[[
#                     dfENROLL()$mapping$strScreenFailCol
#                 ]]
#             )
#
#             study_disposition <- table(
#                 dfSTUDCOMP()$data[[
#                     dfSTUDCOMP()$mapping$strStudyDiscontinuationReasonCol
#                 ]]
#             )
#             browser()
#             return(study_disposition)
#         })
#
#         output$participant_disposition_table <- DT::renderDT({
#
#                 list(
#                     screened = list(
#                         eligible = sum(dfSUBJ()$data$enrollyn == "Y"),
#                         ineligible = sum(dfSUBJ()$data$enrollyn == "N")
#                     ),
#                     enrolled = list(
#                         completed = sum(dfSTUDCOMP()$data$compyn == "Y"),
#                         discontinued = sum(dfSTUDCOMP()$data$compyn == "N"),
#                         active = sum(!c(dfSTUDCOMP()$data$compyn %in% c("Y","N")))
#                     ),
#                     discontinued_reasons = dfSTUDCOMP()$data$compreas
#                 )
#
#          #   print(dfSTUDCOMP()$data$compreas)
#          #   print(dfSTUDCOMP()$data$compyn)
#         #    print(rbind(sub_table_screened,
#         #                sub_table_enrolled))
#
#
#             combined_table <- dplyr::bind_rows(
#                 dfENROLL()$data$enrollyn %>%
#                     table() %>%
#                     data.frame() %>%
#                     dplyr::mutate(
#                         Domain = 'dfENROLL'
#                     ),
#                 dfSUBJ()$data$enrollyn %>%
#                     table() %>%
#                     data.frame() %>%
#                     dplyr::mutate(
#                         Domain = 'dfSUBJ'
#                     ),
#                 dfSTUDCOMP()$data$compreas %>%
#                     table() %>%
#                     data.frame() %>%
#                     dplyr::mutate(
#                         Domain = 'dfSTUDCOMP'
#                     )
#             )
#
#             colnames(combined_table) <- c("Variable", colnames(combined_table)[-1])
#
#             combined_table
#         })
#

#
#         # ---- participant table
#         output$participants <- DT::renderDT({
#             shiny::req(dfSUBJ())
#             # shiny::req(dfSTUDCOMP())
#             # shiny::req(dfAE())
#            # shiny::req(dfPD())
#
#             # print(dfSUBJ()$data |> select("enrollyn"))
#             # print(dfSTUDCOMP()$data)
#          #   print(dfAE()$data |> select("aeser"))
#         #    print(dfPD()$data |> select("deemedimportant"))
#
#             data <- dfSUBJ()$data %>%
#                 dplyr::select(
#                     'ID' = dfSUBJ()$mapping$strIDCol,
#                     'Study Start Date' = dfSUBJ()$mapping$strStudyStartDate,
#                     'Time on Study' = dfSUBJ()$mapping$strTimeOnStudyCol,
#                     'Treatment Start Date' = dfSUBJ()$mapping$strTreatmentStartDate,
#                     'Time on Treatment' = dfSUBJ()$mapping$strTimeOnTreatmentCol
#                 )
#
#             table <- data %>%
#                 DT::datatable(
#                     callback = htmlwidgets::JS('
#                         table.on("click", "td:nth-child(1)", function(d) {
#                             const participant_id = d.currentTarget.innerText;
#
#                             console.log(
#                                 `Selected participant ID: ${participant_id}`
#                             );
#
#                             const namespace = "gsmApp";
#
#                             Shiny.setInputValue(
#                                 "participant",
#                                 participant_id
#                             );
#                         })
#                     '),
#                     options = list(
#                         autoWidth = TRUE,
#                         lengthChange = FALSE,
#                         paging = FALSE,
#                         searching = FALSE,
#                         selection = 'none'
#                     ),
#                     rownames = FALSE,
#                 )
#
#             return(table)
#         })
#     })
# }
