# Advanced Deployment Examples for gsm.app
# This script demonstrates various deployment patterns and configurations

library(gsm.app)
library(dplyr)
library(purrr)

# ===================================
# Example 1: Shinyapps.io Deployment
# ===================================

deploy_to_shinyapps <- function() {
  # This function shows how to prepare and deploy to shinyapps.io
  
  # 1. Prepare your data (replace with your actual data preparation)
  prepared_data <- list(
    dfAnalyticsInput = gsm.app::sample_dfAnalyticsInput,
    dfBounds = gsm.app::sample_dfBounds,
    dfGroups = gsm.app::sample_dfGroups,
    dfMetrics = gsm.app::sample_dfMetrics,
    dfResults = gsm.app::sample_dfResults
  )
  
  # 2. Save data to local files for deployment
  iwalk(prepared_data, ~saveRDS(.x, paste0("data/", .y, ".rds")))
  
  # 3. Create app.R file for deployment
  app_code <- '
# Shinyapps.io deployment file
library(gsm.app)

# Load prepared data
dfAnalyticsInput <- readRDS("data/dfAnalyticsInput.rds")
dfBounds <- readRDS("data/dfBounds.rds")
dfGroups <- readRDS("data/dfGroups.rds")
dfMetrics <- readRDS("data/dfMetrics.rds")
dfResults <- readRDS("data/dfResults.rds")

# Custom fetch function (replace with your implementation)
fnFetchData <- gsm.app::sample_fnFetchData

# Launch app
run_gsm_app(
  dfAnalyticsInput = dfAnalyticsInput,
  dfBounds = dfBounds,
  dfGroups = dfGroups,
  dfMetrics = dfMetrics,
  dfResults = dfResults,
  fnFetchData = fnFetchData,
  strTitle = "Clinical Trial Monitoring Dashboard"
)
'
  
  writeLines(app_code, "app.R")
  
  # 4. Deploy using rsconnect (uncomment to actually deploy)
  # library(rsconnect)
  # deployApp(appName = "my-clinical-dashboard", 
  #           appTitle = "Clinical Trial Monitoring Dashboard")
  
  message("Shinyapps.io deployment files prepared. Run deployApp() to deploy.")
}

# =====================================
# Example 2: RStudio Connect Deployment  
# =====================================

deploy_to_connect <- function(connect_server, account_name) {
  # This function shows deployment to RStudio Connect
  
  # 1. Create app.R with enhanced configuration for enterprise use
  app_code <- '
library(gsm.app)
library(DBI)
library(odbc)

# Enterprise data loading from database
load_data_from_db <- function() {
  # Replace with your actual database connection
  # con <- dbConnect(odbc(), 
  #                 Driver = "SQL Server",
  #                 Server = "your-server",
  #                 Database = "clinical_data",
  #                 Trusted_Connection = "yes")
  
  # For demo purposes, use sample data
  list(
    dfAnalyticsInput = gsm.app::sample_dfAnalyticsInput,
    dfBounds = gsm.app::sample_dfBounds,
    dfGroups = gsm.app::sample_dfGroups,
    dfMetrics = gsm.app::sample_dfMetrics,
    dfResults = gsm.app::sample_dfResults
  )
}

# Load data
data <- load_data_from_db()

# Enterprise fetch function with database connectivity
fnFetchData <- function(strDomainID, strGroupLevel = NULL, strGroupID = NULL,
                       strSubjectID = NULL, dSnapshotDate = NULL) {
  # In production, this would query your database
  gsm.app::sample_fnFetchData(strDomainID, strGroupLevel, strGroupID, 
                             strSubjectID, dSnapshotDate)
}

# Launch with enterprise settings
run_gsm_app(
  dfAnalyticsInput = data$dfAnalyticsInput,
  dfBounds = data$dfBounds,
  dfGroups = data$dfGroups,
  dfMetrics = data$dfMetrics,
  dfResults = data$dfResults,
  fnFetchData = fnFetchData,
  strTitle = "Enterprise Clinical Monitoring Dashboard",
  strFavicon = "hospital",
  strFaviconColor = "#0066CC"
)
'
  
  writeLines(app_code, "app.R")
  
  # Create manifest for dependency management
  # rsconnect::writeManifest()
  
  # Deploy to RStudio Connect (uncomment to actually deploy)
  # library(rsconnect)
  # deployApp(server = connect_server,
  #          account = account_name,
  #          appName = "clinical-monitoring-dashboard")
  
  message("RStudio Connect deployment files prepared.")
}

# =============================
# Example 3: Docker Deployment
# =============================

create_docker_deployment <- function() {
  # Create Dockerfile
  dockerfile <- '
FROM rocker/shiny-verse:4.3.0

# Install system dependencies
RUN apt-get update && apt-get install -y \\
    libssl-dev \\
    libxml2-dev \\
    libcurl4-openssl-dev \\
    unixodbc-dev

# Install R packages
RUN R -e "install.packages(c(\\"gsm.app\\", \\"DT\\", \\"shinydashboard\\", \\"plotly\\"))"

# Create app directory
RUN mkdir -p /srv/shiny-server/app

# Copy app files
COPY app.R /srv/shiny-server/app/
COPY data/ /srv/shiny-server/app/data/

# Set working directory
WORKDIR /srv/shiny-server/app

# Expose port
EXPOSE 3838

# Create startup script
RUN echo "#!/bin/bash" > /usr/local/bin/start_app.sh && \\
    echo "R -e \\"shiny::runApp(host=\'0.0.0.0\', port=3838)\\"" >> /usr/local/bin/start_app.sh && \\
    chmod +x /usr/local/bin/start_app.sh

# Run app
CMD ["/usr/local/bin/start_app.sh"]
'
  
  writeLines(dockerfile, "Dockerfile")
  
  # Create docker-compose.yml for easier management
  docker_compose <- '
version: "3.8"
services:
  gsm-app:
    build: .
    ports:
      - "3838:3838"
    environment:
      - SHINY_LOG_LEVEL=INFO
    volumes:
      - ./logs:/var/log/shiny-server
    restart: unless-stopped
'
  
  writeLines(docker_compose, "docker-compose.yml")
  
  # Create build script
  build_script <- '#!/bin/bash
# Build and run the Docker container

echo "Building Docker image..."
docker build -t gsm-app .

echo "Starting container..."
docker-compose up -d

echo "App should be available at http://localhost:3838"
echo "View logs with: docker-compose logs -f"
'
  
  writeLines(build_script, "deploy-docker.sh")
  system("chmod +x deploy-docker.sh")
  
  message("Docker deployment files created. Run ./deploy-docker.sh to build and start.")
}

# ========================================
# Example 4: Automated Data Update Pipeline
# ========================================

create_automated_pipeline <- function() {
  # This example shows how to set up automated data updates
  
  pipeline_script <- '
#!/usr/bin/env Rscript

# Automated Data Pipeline for GSM App
# Run this script via cron job or scheduled task to update data

library(gsm.app)
library(dplyr)
library(logger)

# Set up logging
log_appender(appender_file("logs/data_pipeline.log"))

log_info("Starting data pipeline...")

tryCatch({
  # 1. Extract data from source systems
  log_info("Extracting data from source systems...")
  
  # Replace with your actual data extraction logic
  # raw_data <- extract_from_clinical_database()
  # raw_data <- extract_from_csv_files()
  
  # For demo, simulate data extraction
  raw_data <- list(
    adverse_events = gsm.app::sample_dfAnalyticsInput,
    demographics = gsm.app::sample_dfGroups
  )
  
  # 2. Process and transform data
  log_info("Processing and transforming data...")
  
  # Your data transformation logic here
  processed_data <- process_clinical_data(raw_data)
  
  # 3. Validate data quality
  log_info("Validating data quality...")
  
  validation_results <- validate_gsm_data(processed_data)
  
  if (!validation_results$passed) {
    log_error("Data validation failed: {validation_results$errors}")
    stop("Data validation failed")
  }
  
  # 4. Update app data files
  log_info("Updating app data files...")
  
  save_app_data(processed_data, "data/")
  
  # 5. Restart app if deployed (optional)
  # restart_shiny_app()
  
  log_info("Data pipeline completed successfully")
  
}, error = function(e) {
  log_error("Pipeline failed: {e$message}")
  # Send alert notification
  # send_alert_email("Data pipeline failed", e$message)
})

# Helper functions (implement according to your needs)
process_clinical_data <- function(raw_data) {
  # Implement your data processing logic
  list(
    dfAnalyticsInput = gsm.app::sample_dfAnalyticsInput,
    dfBounds = gsm.app::sample_dfBounds,
    dfGroups = gsm.app::sample_dfGroups,
    dfMetrics = gsm.app::sample_dfMetrics,
    dfResults = gsm.app::sample_dfResults
  )
}

validate_gsm_data <- function(data) {
  # Implement validation logic
  list(passed = TRUE, errors = NULL)
}

save_app_data <- function(data, path) {
  # Save data files for app
  iwalk(data, ~saveRDS(.x, file.path(path, paste0(.y, ".rds"))))
}
'
  
  writeLines(pipeline_script, "update_data_pipeline.R")
  system("chmod +x update_data_pipeline.R")
  
  # Create cron job example
  cron_example <- '
# Example cron job to run data pipeline daily at 6 AM
# Edit with: crontab -e
# 0 6 * * * /usr/bin/Rscript /path/to/update_data_pipeline.R

# Example Windows Task Scheduler command:
# schtasks /create /tn "GSM Data Pipeline" /tr "Rscript C:\\path\\to\\update_data_pipeline.R" /sc daily /st 06:00
'
  
  writeLines(cron_example, "cron_example.txt")
  
  message("Automated pipeline files created.")
}

# ======================================
# Example 5: Multi-Study Configuration
# ======================================

create_multi_study_app <- function() {
  # This example shows how to create an app that handles multiple studies
  
  multi_study_app <- '
library(gsm.app)
library(shiny)
library(dplyr)

# Multi-study app with study selection
ui <- fluidPage(
  titlePanel("Multi-Study Clinical Monitoring"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("study_id", "Select Study:",
                 choices = c("STUDY-001", "STUDY-002", "STUDY-003"),
                 selected = "STUDY-001"),
      br(),
      actionButton("load_study", "Load Study Dashboard", class = "btn-primary")
    ),
    
    mainPanel(
      conditionalPanel(
        condition = "input.load_study > 0",
        h3("Study Dashboard"),
        # This would contain the gsm.app UI
        p("Dashboard will be loaded here based on selected study.")
      )
    )
  )
)

server <- function(input, output, session) {
  
  # Reactive data loading based on study selection
  study_data <- reactive({
    req(input$study_id)
    
    # Load study-specific data
    # In practice, this would query your database or file system
    list(
      dfAnalyticsInput = filter_by_study(gsm.app::sample_dfAnalyticsInput, input$study_id),
      dfBounds = filter_by_study(gsm.app::sample_dfBounds, input$study_id),
      dfGroups = filter_by_study(gsm.app::sample_dfGroups, input$study_id),
      dfMetrics = filter_by_study(gsm.app::sample_dfMetrics, input$study_id),
      dfResults = filter_by_study(gsm.app::sample_dfResults, input$study_id)
    )
  })
  
  # Create study-specific fetch function
  create_fetch_function <- function(study_id) {
    function(strDomainID, strGroupLevel = NULL, strGroupID = NULL,
            strSubjectID = NULL, dSnapshotDate = NULL) {
      # Fetch data for specific study
      gsm.app::sample_fnFetchData(strDomainID, strGroupLevel, strGroupID,
                                 strSubjectID, dSnapshotDate)
    }
  }
  
  # Launch study-specific app when button is clicked
  observeEvent(input$load_study, {
    data <- study_data()
    
    # In a real implementation, you would either:
    # 1. Embed the gsm app in a module, or
    # 2. Redirect to a study-specific app instance
    
    showModal(modalDialog(
      title = paste("Loading", input$study_id),
      "Study dashboard would be loaded here.",
      footer = modalButton("Close")
    ))
  })
}

# Helper function to filter data by study
filter_by_study <- function(data, study_id) {
  if ("StudyID" %in% names(data)) {
    return(filter(data, StudyID == study_id))
  }
  return(data)
}

shinyApp(ui, server)
'
  
  writeLines(multi_study_app, "multi_study_app.R")
  
  message("Multi-study app example created.")
}

# =====================================
# Execute Example Functions
# =====================================

# Uncomment the functions you want to run:

# deploy_to_shinyapps()
# deploy_to_connect("https://connect.example.com", "myaccount")  
# create_docker_deployment()
# create_automated_pipeline()
# create_multi_study_app()

message("Advanced deployment examples ready. Uncomment function calls to generate specific deployment files.")
