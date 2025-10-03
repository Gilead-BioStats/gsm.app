# Generate/update the requirement_issues.yml log of issues.
source(here::here("requirements", "scripts", "GenerateBRyml.R"), local = TRUE)

# Generate/update BR articles.
source(here::here("requirements", "scripts", "GenerateBRQmds.R"), local = TRUE)

# Generate/update BR index page.
source(here::here("requirements", "scripts", "GenerateBRIndex.R"), local = TRUE)

# Copy images from tests.
source(here::here("requirements", "scripts", "SyncBRImages.R"), local = TRUE)
