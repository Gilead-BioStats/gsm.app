# 1. Read configuration and template
library(magrittr)
articles_dir <- here::here("vignettes/articles")
brs <- yaml::read_yaml(
  fs::path(articles_dir, "business_requirements", "business_requirements.yml")
)
template <- readr::read_file(
  fs::path(articles_dir, "business_requirements", "_br_template.qmd")
)

# 2. Loop through each BR and generate a .qmd file
purrr::walk(brs, function(br) {
  # Substitute placeholders
  qmd_content <- template %>%
    stringr::str_replace_all("BR_NUMBER", as.character(br$issue)) %>%
    stringr::str_replace("BR_TITLE", br$title)

  # Define output path
  output_path <- fs::path(
    articles_dir,
    glue::glue("br{br$issue}.qmd")
  )

  # Write the new file
  readr::write_file(qmd_content, output_path)

  cli::cli_alert_success("Generated {output_path}")
})

rm(brs, articles_dir, template)
