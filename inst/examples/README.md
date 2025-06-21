# GSM App Deployment Examples

This directory contains practical examples for deploying {gsm.app} applications in various environments.

## Files Overview

### `basic-deployment.R`
A simple example showing how to:
- Use sample data to quickly get started
- Load custom data from RDS files  
- Create a basic fetch function
- Launch the app with custom configuration

**Usage:**
```r
source("inst/examples/basic-deployment.R")
```

### `advanced-deployment.R`
Comprehensive deployment examples including:
- **Shinyapps.io deployment** - Cloud deployment for sharing apps
- **RStudio Connect deployment** - Enterprise deployment with database connectivity
- **Docker deployment** - Containerized deployment for scalability
- **Automated data pipeline** - Scheduled data updates
- **Multi-study configuration** - Handling multiple studies in one app

**Usage:**
```r
source("inst/examples/advanced-deployment.R")
# Then uncomment and run specific functions:
# deploy_to_shinyapps()
# create_docker_deployment()
# etc.
```

## Quick Start Guide

### 1. Local Development
Start with the basic deployment example to run the app locally:

```r
# Install the package
pak::pak("Gilead-BioStats/gsm.app")

# Run sample app  
library(gsm.app)
run_sample_gsm_app()
```

### 2. Using Your Own Data
Follow the [Data Preparation vignette](../vignettes/data-preparation.Rmd) to prepare your data, then:

```r
# Load your prepared data
dfAnalyticsInput <- readRDS("your_data/dfAnalyticsInput.rds")
dfBounds <- readRDS("your_data/dfBounds.rds")
dfGroups <- readRDS("your_data/dfGroups.rds")
dfMetrics <- readRDS("your_data/dfMetrics.rds")  
dfResults <- readRDS("your_data/dfResults.rds")

# Create your fetch function
fnFetchData <- function(strDomainID, ...) {
  # Your implementation here
}

# Launch app
run_gsm_app(
  dfAnalyticsInput = dfAnalyticsInput,
  dfBounds = dfBounds,
  dfGroups = dfGroups,
  dfMetrics = dfMetrics,
  dfResults = dfResults,
  fnFetchData = fnFetchData
)
```

### 3. Cloud Deployment

#### Shinyapps.io (Easiest)
1. Prepare your data files
2. Create `app.R` with your app code
3. Deploy using `rsconnect::deployApp()`

#### RStudio Connect (Enterprise)
1. Set up database connections
2. Create enterprise-ready `app.R`
3. Deploy using `rsconnect` with your Connect server

#### Docker (Most Flexible)
1. Create Dockerfile and docker-compose.yml
2. Build image: `docker build -t my-gsm-app .`
3. Run container: `docker-compose up -d`

## Prerequisites

### For Local Development
- R (>= 4.0)
- {gsm.app} package and dependencies

### For Cloud Deployment
- {rsconnect} package
- Account on deployment platform (Shinyapps.io, RStudio Connect, etc.)

### For Docker Deployment  
- Docker and Docker Compose installed
- Basic familiarity with Docker concepts

### For Database Integration
- Appropriate database drivers ({odbc}, {RPostgres}, etc.)
- Database connection credentials
- Network access to database servers

## Data Requirements

All deployment examples require the same five data structures:

1. **dfAnalyticsInput** - Participant-level metric data
2. **dfBounds** - Statistical bounds for flagging  
3. **dfGroups** - Group metadata (sites, countries, study)
4. **dfMetrics** - Metric definitions
5. **dfResults** - KRI assessment results

Plus one function:
6. **fnFetchData** - Domain data retrieval function

See the [Data Preparation vignette](../vignettes/data-preparation.Rmd) for detailed specifications.

## Troubleshooting

### Common Issues

**Data validation errors:**
- Check column names match required specifications
- Ensure date columns are properly formatted
- Verify MetricID consistency across data frames

**Deployment failures:**
- Check package dependencies are available
- Verify data file paths are correct
- Ensure sufficient memory/resources

**Performance issues:**
- Filter data to recent snapshots only
- Optimize database queries in fetch function
- Consider data caching strategies

### Getting Help

1. Check the package documentation: `?run_gsm_app`
2. Review the Data Preparation vignette
3. Examine the sample data structure: `str(gsm.app::sample_dfResults)`
4. Post issues on the GitHub repository

## Best Practices

### Security
- Never commit database credentials to version control
- Use environment variables for sensitive configuration
- Implement proper authentication for deployed apps

### Performance  
- Cache frequently accessed data
- Use efficient database queries
- Monitor app performance and resource usage

### Maintenance
- Set up automated data refresh pipelines
- Monitor app health and errors
- Keep packages and dependencies updated
- Document your deployment configuration

## Contributing

If you create additional deployment patterns or improvements, please consider contributing them back to the project via pull requests.
