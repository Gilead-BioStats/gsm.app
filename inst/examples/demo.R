#!/usr/bin/env Rscript

# Simple example script to demonstrate gsm.app functionality
# This script can be run directly or sourced in R

# Load required packages
if (!require(gsm.app, quietly = TRUE)) {
  stop("gsm.app package not found. Install with: pak::pak('Gilead-BioStats/gsm.app')")
}

cat("=== GSM App Demo ===\n")
cat("This script demonstrates the gsm.app package capabilities.\n\n")

# Show sample data structure
cat("1. Sample Data Overview:\n")
cat("   - dfAnalyticsInput:", nrow(gsm.app::sample_dfAnalyticsInput), "rows\n")
cat("   - dfBounds:", nrow(gsm.app::sample_dfBounds), "rows\n") 
cat("   - dfGroups:", nrow(gsm.app::sample_dfGroups), "rows\n")
cat("   - dfMetrics:", nrow(gsm.app::sample_dfMetrics), "rows\n")
cat("   - dfResults:", nrow(gsm.app::sample_dfResults), "rows\n\n")

# Show key metrics available
cat("2. Available Metrics:\n")
available_metrics <- unique(gsm.app::sample_dfMetrics$Metric)
for (i in seq_along(available_metrics)) {
  cat("   -", available_metrics[i], "\n")
}
cat("\n")

# Show group levels
cat("3. Group Levels:\n")
group_levels <- unique(gsm.app::sample_dfResults$GroupLevel)
for (level in group_levels) {
  count <- length(unique(gsm.app::sample_dfResults$GroupID[gsm.app::sample_dfResults$GroupLevel == level]))
  cat("   -", level, ":", count, "groups\n")
}
cat("\n")

# Show snapshot dates
cat("4. Data Snapshots:\n")
snapshot_dates <- unique(gsm.app::sample_dfResults$SnapshotDate)
for (date in snapshot_dates) {
  cat("   -", as.character(date), "\n")
}
cat("\n")

# Interactive demo
if (interactive()) {
  cat("5. Launching Interactive Demo...\n")
  cat("   The app will open in your default browser.\n")
  cat("   Close the browser tab to return to this script.\n\n")
  
  # Launch the sample app
  run_sample_gsm_app()
  
  cat("Demo completed!\n")
} else {
  cat("5. To launch the interactive app, run:\n")
  cat("   gsm.app::run_sample_gsm_app()\n\n")
  cat("   Or run this script in an interactive R session.\n")
}

cat("\nFor more information:\n")
cat("- Data Preparation: vignette('data-preparation', package = 'gsm.app')\n")
cat("- Plugin Development: vignette('plugins', package = 'gsm.app')\n")
cat("- Package Documentation: help(package = 'gsm.app')\n")
cat("- GitHub Repository: https://github.com/Gilead-BioStats/gsm.app\n")
