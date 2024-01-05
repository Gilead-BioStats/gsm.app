# Define UI
ui <- function(snapshot) {
    return(
        shiny::fluidPage(
            shiny::titlePanel("GSM - Deep Dive"),
            shiny::sidebarLayout(
                shiny::sidebarPanel(
                    shiny::selectInput("metric", "Metric", choices = c(
                        'AE'   = 'kri0001',
                        'SAE'  = 'kri0002',
                        'PD'   = 'kri0003',
                        'IPD'  = 'kri0004',
                        'LB'   = 'kri0005',
                        'SDSC' = 'kri0006',
                        'TDSC' = 'kri0007',
                        'QRY'  = 'kri0008',
                        'OQRY' = 'kri0009',
                        'ODAT' = 'kri0010',
                        'CDAT' = 'kri0011',
                        'SF'   = 'kri0012'
                    )),
                    shiny::selectInput("site", "Site", choices = c('None')),
                    shiny::selectInput("participant", "Participant", choices = c('None')),
                    shiny::actionButton("reset", "Reset All")
                ),
                shiny::mainPanel(
                    shiny::tabsetPanel(
                        shiny::tabPanel("Study Overview",
                            DT::DTOutput('study_overview')
                        ),
                        shiny::tabPanel("Metric Details",
                            shiny::tabsetPanel(
                                shiny::tabPanel("Scatter Plot", gsm::Widget_ScatterPlotOutput("scatter_plot")),
                                shiny::tabPanel("Bar Chart (KRI Value)", gsm::Widget_BarChartOutput("bar_chart_metric")),
                                shiny::tabPanel("Bar Chart (KRI Score)", gsm::Widget_BarChartOutput("bar_chart_score")),
                                shiny::tabPanel("Analysis Output", DT::DTOutput("results"))
                            )
                        ),
                        shiny::tabPanel("Site Details"),
                        shiny::tabPanel("Participant Details")
                    )
                )
            )
        )
    )
}
