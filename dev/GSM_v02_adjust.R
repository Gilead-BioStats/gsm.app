# Gilead Statistical Monitoring Shiny App
#
# This is draft code for initial prototyping
# Only contains the adverse event statistical check
# Developed by George Wu
#
#
####
# Notes
##########
# Current components of AE statistical check
#
# Datasets:
#  ae.dat
#  ae.site
#  ae.results
#  ae.siteoutput
#
# Dyanmic Inputs:
#  ae_INPUT_file
#  ae_INPUT_siteplot_brush
#  ae_INPUT_threshold
#
# Outputs:
#  ae_TABLE_inputcontents
#  ae_TABLE_selectsites
#  ae_TABLE_selectsubj
#  ae_TABLE_sitesummary
#  ae_TABLE_subjsummary
#  ae_TABLE_siteoutput
#  ae_TABLE_subjoutput
#
#  ae_BOX_nsubj
#  ae_BOX_nsites
#
#  ae_TEXT_nsites
#  ae_TEXT_nsubj
#
#  ae_MODEL_site
#
#  ae_PLOT_hist
#  ae_PLOT_qqplot
########

## Packages
######
library(shiny)
library(shinydashboard)
library(shinydashboardPlus)
library(ggplot2)
library(dashboardthemes)
library(ggplot2)
library(lamW)
library(rhandsontable)
#####


## General Functions
########

cts.summary <- function(vec,digits=3){
  out <- c(N=length(vec)-sum(is.na(vec)),
           Mean=mean(vec,na.rm=T), SD=sd(vec,na.rm=T),
           Median=median(vec,na.rm=T),
           Q1=quantile(vec,1/4,type=2,na.rm=T),
           Q3=quantile(vec,3/4,type=2,na.rm=T),
           Min=min(vec,na.rm=T), Max=max(vec,na.rm=T))
  out <- round(out,digits)
  return(out)
} ## Function to summarize continuous data

#####


# ---------------------------------------------


## Dashboard Setup
######

## testing for logo in top-right of APP
logo_blue_gradient <- shinyDashboardLogoDIY(
  boldText = "GSM"
  ,mainText = ""
  ,textSize = 26
  ,badgeText = "BETA"
  ,badgeTextColor = "white"
  ,badgeTextSize = 3
  ,badgeBackColor = "#F08080"
  ,badgeBorderRadius = 20
)

## header
dashboardheaderinfo <- dashboardHeader(
  #enable_rightsidebar = TRUE,
  #rightSidebarIcon = "gears",
  #title= div(style = "font-family: times new roman",logo_blue_gradient)#,

  ## Drop down menu
  #dropdownMenu(
  #  type = "notifications",
  #  badgeStatus = NULL, icon = icon("question"),
  #  headerText = div(style = "color:purple; font-size:150%","About"),
  #  notificationItem(text="Version: Beta v0.1", icon=icon("angle-right")),
  #  notificationItem(text="Author: George Wu", icon=icon("angle-right")),
  #  notificationItem(text="Contact: George.Wu@gilead.com", icon=icon("angle-right")),
  #  notificationItem(text="Release Date: 2020-XXX-XX", icon=icon("angle-right"))
  #)
)

## sidebar for navigation across all the statistical checks
sidebarinfo <- dashboardSidebar(
  shinyDashboardThemes(
    theme = "onenote"
  ),
  sidebarMenu(
    menuItem("Overview", tabName = "tab_overview", icon = icon("television")),
    menuItem("Adverse Events", tabName = "tab_ae", icon = icon("plus-square-o")),
    ## Tabs below still to be built
    menuItem("Key Endpoints", tabName = "tab_endpoint", icon = icon("key"),
             menuSubItem('Binary', tabName='tab_bin_endpoint', icon=icon('bar-chart')),
             menuSubItem('Continuous', tabName='tab_cts_endpoint', icon=icon('line-chart')),
             menuSubItem('Survival', tabName='tab_surv_endpoint', icon=icon('life-ring'))),
    menuItem("Treatment Adherence", tabName = "tab_adhere", icon = icon("battery-1")),
    menuItem("Subject Disposition", tabName = "tab_disp", icon = icon("sitemap")),
    menuItem("Data Integrity", tabName = "tab_integrity", icon= icon('balance-scale'),
             menuSubItem('Digit Preference', tabName='tab_digit', icon=icon('hashtag')),
             menuSubItem('Visit Schedule', tabName='tab_visit', icon=icon('calendar')),
             menuSubItem('Medications', tabName='tab_med', icon=icon('medkit')))
  )
)

## setup for right side bar - currently unusued
# rightsidebarinfo <- rightSidebar(
  # background = "light",
  # rightSidebarTabContent(
    # id = 1,
    # title = "Tab 1",
    # icon = "desktop",
    # active = TRUE,
    # sliderInput(
      # "obs",
      # "Number of observations:",
      # min = 0, max = 1000, value = 500
      # )
    # ),
    # rightSidebarTabContent(
      # id = 2,
      # title = "Tab 2",
      # textInput("caption", "Caption", "Data Summary")
    # ),
    # rightSidebarTabContent(
      # id = 3,
      # icon = "paint-brush",
      # title = "Tab 3",
      # numericInput("obs", "Observations:", 10, min = 1, max = 100)
      # )
# )

#####


## Body Setup
######
bodyinfo <- dashboardBody(

  ## Set Dashboard Theme
  shinyDashboardThemes(
    theme = "onenote"
  ),

  ## Create Tabs - each tab is for a different statistical check
  tabItems(

    #####

    ## 1st Tab - Overview Tab
    ######
    tabItem(tabName = "tab_overview",  h2("Overview"),

            ## Constructs the content of the tab - TBD
            fluidRow()
    ),
    #####


    ## 2nd Tab - AE Statistical Check
    ######
    tabItem(tabName = "tab_ae",
            h2("Adverse Event Rate"),

            ## Constructs the content of the tab
            fluidRow(
              column(
                width=12,

                ## Subsections - Data, Plot, Diagnostic, Output
                tabsetPanel(type="tabs",

                            #####

                            ## Data Subsection
                            ######
                            tabPanel("Data",
                                     br(),
                                     fluidRow(
                                       column(width = 12,
                                              splitLayout(cellWidths=c("50%","25%","25%"),
                                                          ## Load data in
                                                          fileInput("ae_INPUT_file", "Choose CSV File",
                                                                    accept = c("text/csv",
                                                                               "text/comma-separated-values,text/plain",
                                                                               ".csv")
                                                                    ),
                                                          ## Show number of sites
                                                          infoBoxOutput("ae_BOX_nsites", width=9),
                                                          ## Show number of subjects
                                                          infoBoxOutput("ae_BOX_nsubj", width=9)
                                                          )
                                              )
                                     ),
                                     br(),
                                     fluidRow(
                                       column(width = 10, offset=1,
                                              ## show AE input data contents
                                              DT::dataTableOutput("ae_TABLE_inputcontents"))
                                       )
                            ),
                            #####

                            ## Plot Subsection
                            ######
                            tabPanel("Plot",
                                     br(),
                                     ## Scatterplot of adverse event
                                     fluidRow(
                                       div(style = "width: 100%; margin-left: 20px ",
                                           column(width = 8, offset=1, align="center",
                                                  plotOutput("ae_PLOT_site",brush = "ae_INPUT_siteplot_brush",
                                                             width='700px', height='480px')
                                                  )
                                           )
                                     ),
                                     br(),
                                     ## Show site info when selected
                                     box( title = "Selected Sites",
                                              closable=FALSE, enable_label=FALSE, width=12,
                                              solidHeader=FALSE, collapsible=TRUE,
                                              DT::dataTableOutput("ae_TABLE_selectsites")
                                     ),
                                     br(),
                                     ## Show subject info when selected
                                     box( title = "Selected Sites - Subject Data",
                                              closable=FALSE, enable_label=FALSE, width=12,
                                              solidHeader=FALSE, collapsible=TRUE, collapsed=TRUE,
                                              DT::dataTableOutput("ae_TABLE_selectsubj")
                                     )
                            ),
                            #####

                            ## Diagnostic Subsection
                            ######
                            tabPanel("Model",
                                     ## Threshold bar
                                     br(),
                                     fluidRow(column(width=6, wellPanel(
                                       tags$style(HTML(".js-irs-0 .irs-single, .js-irs-0 .irs-bar-edge, .js-irs-0 .irs-bar {background: purple}")),
                                       div(style = "width: 100%; margin-left: 5px ",
                                           sliderInput("ae_INPUT_threshold", "Threshold (Deviance Residuals):",
                                                       min = 0, max = 10, value = 6, step=0.1))))
                                     ),
                                     ## Histogram and QQ plot of residuals
                                     h4("Diagnostics"),
                                     fluidRow(
                                       div(style = "width: 100%; margin-left: 20px ",
                                           splitLayout(cellWidths=c("45%","45%"),
                                                       plotOutput('ae_PLOT_hist'),
                                                       plotOutput('ae_PLOT_qqplot')))
                                     ),
                                     ## Poisson regression model summary
                                     br(),
                                     box( title="Poisson Regression Model Summary",
                                              closable=FALSE, width=NULL, enable_label=FALSE,
                                              solidHeader=FALSE, collapsible=TRUE,collapsed=TRUE,
                                              verbatimTextOutput("ae_MODEL_site")
                                     )
                            ),
                            #####

                            ## Output Subsection
                            ######
                            tabPanel("Output",
                                     br(),
                                     box(title="Summary Statistics",closable=FALSE, collapsible=TRUE,
                                         width=12,
                                         splitLayout(cellWidths=c("50%","50%"),

                                                     box(title=textOutput("ae_TEXT_nsites"),
                                                             status="warning",
                                                             closable=FALSE, collapsible=FALSE,
                                                             solidHeader=FALSE,width=12,
                                                             tableOutput("ae_TABLE_sitesummary")),

                                                     box(title=textOutput("ae_TEXT_nsubj"),
                                                             status="primary",
                                                             closable=FALSE, collapsible=FALSE,
                                                             solidHeader=FALSE,width=12,
                                                             tableOutput("ae_TABLE_subjsummary")))),
                                     br(),

                                     box(title="Site Data", closable=FALSE, collapsible=TRUE,
                                             width=12,
                                             column(width = 12,
                                                    align='left',
                                                    div(DT::dataTableOutput("ae_TABLE_siteoutput"),style = "font-size:90%"))

                                     ),
                                     br(),

                                     box(title="Subject Data", closable=FALSE, collapsible=TRUE,
                                             width=12,
                                             column(width = 12,
                                                    align='left',
                                                    div(DT::dataTableOutput("ae_TABLE_subjoutput"),style = "font-size:90%"))

                                     )
                            )
                            #####

                ) ## closes tabset panel
              ) ## closes main column
            ) ## closes main fluidrow
    ) ## closes 2nd tab - AE statistical check
    #####

  ) ## closes tabItems
) ## closes body
#####


## Server Setup
######
server <- function(input, output, session) {

  ## 1st Tab - Overview
  ######
  #####

  ## 2nd Tab - AE statistical check
  ######


  #---- Load in Input Data
  ae.dat <- reactive({
    req(input$ae_INPUT_file)
    read.csv(input$ae_INPUT_file$datapath,
             header = TRUE,
             sep = ",")
  })

  #---- Table to show loaded input data
  output$ae_TABLE_inputcontents <- DT::renderDataTable({
    ae.tmpdat <- ae.dat()

    ## Clean-up
    ae.tmpdat$Rate <- round(ae.tmpdat$Rate, 4)
    ae.tmpdat$Exposure <- round(ae.tmpdat$Exposure, 2)

    ## Data Table
    DT::datatable(ae.tmpdat,
                  rownames = FALSE,
                  options=list(pageLength=10,autoWidth=FALSE)
    )

  })

  #---- Optional Input Data Summaries
  ### Text for number of subjects
  output$ae_TEXT_nsubj <- renderText({
    paste0("Subjects  (N=", nrow( ae.dat() ) , ")")
  })

  ### Box for number of subjects
  output$ae_BOX_nsubj <- renderInfoBox({
    infoBox("Subjects",
            nrow( ae.dat() ),
            icon = icon("users", lib="font-awesome"),
            color = "purple"
    )
  })

  ### Text for number of sites
  output$ae_TEXT_nsites <- renderText({
    paste0("Sites  (N=", length( unique( ae.dat()$SiteID ) ) , ")" )
  })

  ### Box for number of sites
  output$ae_BOX_nsites <- renderInfoBox({
    infoBox("Sites",
            length( unique( ae.dat()$SiteID ) ),
            icon = icon("medkit", lib="font-awesome"),
            color = "yellow"
    )
  })


  #---- Site-level Summary
  ae.site <- reactive({
    ae.tmpdat <- ae.dat()

    ### Calculate basic site level summary information
    SITE.N <- aggregate(ae.tmpdat$SiteID, by=list(sitedex=ae.tmpdat$SiteID), length)
    SITE.COUNT <- aggregate(ae.tmpdat$Count, by=list(sitedex=ae.tmpdat$SiteID), sum)
    SITE.EXPOSURE <- aggregate(ae.tmpdat$Exposure, by=list(sitedex=ae.tmpdat$SiteID), sum)
    SITE.RATE <- SITE.COUNT/SITE.EXPOSURE
    SITE.UNIT <- unique(ae.tmpdat$Unit)
    ae.tmpsite <- cbind(SITE.N, SITE.COUNT[,2], SITE.EXPOSURE[,2], SITE.UNIT, SITE.RATE[,2])
    colnames(ae.tmpsite) <- c("SiteID","N","TotalCount","TotalExposure","Unit","Rate")

    return(ae.tmpsite)
  })


  #---- Analysis
  ae.results <- reactive({

    ae.results <- ae.site()
    ae.results <- cbind(ae.results, LogExposure=log(ae.results$TotalExposure))
    logfit <- glm(TotalCount ~ stats::offset(LogExposure), family=poisson(link="log"), data=ae.results)
    poissonreg <- summary(logfit)$coef
    ae.residuals <- residuals(logfit)
    predictval <- exp(ae.results$LogExposure*logfit$coefficients[2]+logfit$coefficients[1])

    ae.results <- data.frame(ae.results, Residuals=ae.residuals, PredictCount=predictval)
    ae.results <- ae.results[,c(1,2,4,5,7,6,3,9,8)]
    return(ae.results)

  })

  ### Model Output
  output$ae_MODEL_site <- renderPrint({
    logfit <- glm(TotalCount ~ stats::offset(LogExposure), family=poisson(link="log"), data=ae.results())
    summary(logfit)
  })


  #---- Diagnostic Plot and Thresholding
  ### Diagnostic - Histogram
  output$ae_PLOT_hist <- renderPlot({

    hist(ae.results()$Residuals,
         breaks=20,
         xlab="Deviance Residuals",
         main="Histogram of Deviance Residuals")

    co <- input$ae_INPUT_threshold
    abline(v=c(-1*co, co),col="red", lty=2)

  })

  ### Diagnostic - QQplot
  output$ae_PLOT_qqplot <- renderPlot({

    qqnorm(ae.results()$Residuals, main="QQ Normplot of Deviance Residuals")
    qqline(ae.results()$Residuals)

    co <- input$ae_INPUT_threshold
    abline(h=c(-1*co, co),col="red", lty=2)

  })

  #---- Thresholding
  #---- Plot Data
  #---- Plotting
  output$ae_PLOT_site <- renderPlot({

    ae.tmpplot <- ae.results()

    ### Identify points to flag based no threshold
    co <- input$ae_INPUT_threshold
    index <- which(abs(ae.tmpplot$Residuals) > co)

    ### Calculation of bounds based on threshold
    logfit <- glm(TotalCount ~ stats::offset(LogExposure), family=poisson(link="log"), data=ae.tmpplot)
    newx <- seq(min(ae.tmpplot$LogExposure)-0.05,max(ae.tmpplot$LogExposure)+0.05,by=0.05)
    mu <- as.numeric(exp(newx*logfit$coefficients[2]+logfit$coefficients[1]))
    W <- (co^2-2*mu)/(2*exp(1)*mu)
    predict.y.low <- (co^2-2*mu)/(2*lambertW0(W))
    predict.y.high <- (co^2-2*mu)/(2*lambertWm1(W))
    predict.y <- exp(newx*logfit$coefficients[2]+logfit$coefficients[1])
    plot.bounds <- data.frame(newx, est=predict.y, lower=predict.y.low, upper=predict.y.high)

    ### Plot of data
    p <- ggplot(ae.tmpplot, aes(x=LogExposure, y=TotalCount)) +
      theme_bw(base_size=16) +
      geom_point(size=2.5, shape=19) +
      ggtitle("Adverse Event Assessment: Site Comparison") +
      xlab("Site Total Exposure (log Weeks)") + ylab("Site Total Adverse Events") +
      geom_line(data=plot.bounds, aes(x=newx, y=est), color="red") +
      geom_line(data=plot.bounds, aes(x=newx, y=lower), color="red", linetype="dashed") +
      geom_line(data=plot.bounds, aes(x=newx, y=upper), color="red", linetype="dashed")

    if(length(index) > 0){
      p + geom_point(data=ae.tmpplot[index,], aes(x=LogExposure, y=TotalCount), col="red", size=2.5, shape=19) +
        geom_text(data=ae.tmpplot[index,], aes(x=LogExposure, y=TotalCount, label=SiteID),
                  vjust=1.2, col="red", size=3.5)
    } else {
      p
    }
  })

  ### Plot - table showing data for selected sites
  output$ae_TABLE_selectsites <- DT::renderDataTable({
    DT::datatable(brushedPoints(ae.results(),
                                input$ae_INPUT_siteplot_brush,
                                xvar="LogExposure", yvar="TotalCount"),
                  rownames = FALSE,
                  options=list(paging=FALSE,searching=FALSE, autoWidth=TRUE)) %>%
      DT::formatRound(3,1) %>%
      DT::formatRound(5,2) %>%
      DT::formatRound(6,3) %>%
      DT::formatRound(8,1) %>%
      DT::formatRound(9,2) %>%
      DT::formatStyle(columns=c(4), 'text-align' = 'center')
  })

  ### Plot - table showing data for selected subjects
  output$ae_TABLE_selectsubj <- DT::renderDataTable({
    ae.tmpdat <- ae.dat()
    selectedsites <- brushedPoints(ae.results(),input$ae_INPUT_siteplot_brush,
                                   xvar="LogExposure", yvar="TotalCount")

    aesubj.select <- ae.tmpdat[ae.tmpdat$SiteID %in% selectedsites$SiteID,]
    aesubj.select <- aesubj.select[,c(1,2,4,6,3,5)]

    DT::datatable(aesubj.select,
                  rownames = FALSE,
                  options=list(autoWidth=TRUE)) %>%
      DT::formatRound(3,1) %>%
      DT::formatRound(6,3)

  })


  #---- Outputs
  ## Output for AE Statistical Check at Site Level
  ae.siteoutput <- reactive({
    ae.tmpsite <- ae.results()

    co <- input$ae_INPUT_threshold

    ae.tmpsite <- ae.tmpsite[,-5] ## Remove Log Exposure Column
    ae.tmpsite$Rate <- round( ae.tmpsite$Rate, 3) ### This can be done at the data table level in future
    ae.tmpsite$TotalExposure <- round( ae.tmpsite$TotalExposure, 1)
    ae.tmpsite$PredictCount <- round( ae.tmpsite$PredictCount,1)

    ae.tmpsite$Residuals <- round(ae.tmpsite$Residuals,2)
    ae.tmpsite$PredictRate <- round( ae.tmpsite$PredictCount / ae.tmpsite$TotalExposure, 3)

    ae.tmpsite$Flag.Under <- as.numeric(ae.tmpsite$Residuals < co*-1)
    ae.tmpsite$Flag.Over <- as.numeric(ae.tmpsite$Residuals > co)

    ae.tmpsite <- ae.tmpsite[,c(1:4, 5,9, 6,7, 8, 10:11)] ## shuffle to desired order

    return(ae.tmpsite)
  })


  ## Table for basic summary of site data
  output$ae_TABLE_sitesummary <- renderTable({
      ae.tmpsite <- ae.site()
      ### Continuous data summary
      Subjects <- data.frame(cts.summary(ae.tmpsite$N))[-c(5:6),]
      TotalCount <- data.frame(cts.summary(ae.tmpsite$TotalCount))[-c(5:6,9),]
      TotalExposure <- data.frame(cts.summary(ae.tmpsite$TotalExposure))[-c(5:6,9),]
      Rate <- data.frame(cts.summary(ae.tmpsite$Rate))[-c(5:6,9),]
      ae.tmpsite <- rbind(Subjects,TotalCount,TotalExposure,Rate)
      colnames(ae.tmpsite) <- c("N","Mean","SD","Median","Min","Max")

      return(ae.tmpsite[,-1])
      },
    include.rownames=TRUE
  )

  ## Table for basic summary of subject data
  output$ae_TABLE_subjsummary <- renderTable({
      ae.tmpdat <- ae.dat()
      ### Continuous data summary
      Count <- data.frame(cts.summary(ae.tmpdat$Count))[-c(5:6,9),]
      Exposure <- data.frame(cts.summary(ae.tmpdat$Exposure))[-c(5:6,9),]
      Rate <- data.frame(cts.summary(ae.tmpdat$Rate))[-c(5:6,9),]
      ae.tmpdat <- rbind(Count,Exposure,Rate)
      colnames(ae.tmpdat) <- c("N","Mean","SD","Median","Min","Max")

      return(ae.tmpdat[,-1])
      },
     include.rownames=TRUE
  )

  ## Table for Output of Site Data
  output$ae_TABLE_siteoutput <- DT::renderDataTable({
    DT::datatable(ae.siteoutput(),
                  rownames = FALSE,
                  options=list(autoWidth=FALSE))
  })

  ## Table for Output of Subject Data
  output$ae_TABLE_subjoutput <- DT::renderDataTable({
    ae.tmpdat <- ae.dat()
    ## Clean-up
    ae.tmpdat$Rate <- round(ae.tmpdat$Rate, 4)
    ae.tmpdat$Exposure <- round(ae.tmpdat$Exposure, 2)
    ## Data Table
    DT::datatable(ae.tmpdat,
                  rownames = FALSE,
                  options=list(pageLength=10,autoWidth=FALSE)
    )
  })
  #####




}
#####


# ---------------------------------------------


## shinyApp Run
######
shinyApp(
  #### UI side
  ui = dashboardPage(

    #### Header Portion
    header = dashboardheaderinfo,
    #### Side Bar Portion
    sidebar = sidebarinfo,
    #### Body Portion
    body = bodyinfo,
    ### Rightsidebar Portion - currently unusued [TBD how to use]
    #rightsidebar = rightsidebarinfo,
    #title = "Right Sidebar"
  ),

  #### Server side
  server = server
)
#####
