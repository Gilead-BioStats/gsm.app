library(shiny)
library(ggplot2)
library(plotly)
library(DT)
 
# Define UI
ui <- fluidPage(
  titlePanel("GSM - Deep Dive"),
  sidebarLayout(
    sidebarPanel(
      selectInput("metric", "Metric", choices = c("SAE")),
      selectInput("site", "Site", choices = c("Site 13 (Jones, Smith)")),
      selectInput("participant", "Participant", choices = c("ABC123-13-0045")),
      actionButton("reset", "Reset All")
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Study Overview", plotlyOutput("scatterPlot")),
        tabPanel("Metric Details"),
        tabPanel("Site Details"),
        tabPanel("Participant Details")
      ),
      dataTableOutput("summaryTable")
    )
  )
)
 
# Define server logic
server <- function(input, output, session) {
 
  # Reactive data based on selections
  filteredData <- reactive({
    # You would filter your dataset based on the input$metric, input$site, and input$participant
    # df_filtered <- subset(dataset, ...)
  })
 
  # Render Scatter Plot
  output$scatterPlot <- renderPlotly({
    # ggplot object based on filteredData()
    p <- ggplot(filteredData(), aes(x = ..., y = ...)) + geom_point()
    ggplotly(p)
  })
 
  # Render Summary Table
  output$summaryTable <- renderDataTable({
    # DataTables based on filteredData()
    datatable(filteredData(), options = list(pageLength = 10))
  })
 
  # Reset action
  observeEvent(input$reset, {
    # Code to reset the selections
  })
}
 
# Run the application
shinyApp(ui = ui, server = server)
