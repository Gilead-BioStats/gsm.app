library(connectapi)
library(httr)
library(lubridate)

study_dirs <- dir_ls("deployment", type = "directory")

find_latest_date_dir <- function(study_dir) {
  sub_dirs <- dir_ls(study_dir, type = "directory")
  dir_names <- basename(sub_dirs)
  valid_dates <- dir_names[!is.na(ymd(dir_names))]
  parsed_dates <- ymd(valid_dates)
  latest_date <- max(parsed_dates, na.rm = TRUE)
  latest_dir <- sub_dirs[dir_names == format(latest_date, "%Y-%m-%d")]
  return(latest_dir)
}

latest_date_dirs <- sapply(study_dirs, find_latest_date_dir, USE.NAMES = TRUE)

server <- "path/to/pc/server" #"https://xufei.dev.a2-ai.cloud/pc"

client <- connect(server = server,
                  api_key = Sys.getenv("CONNECT_API_KEY"))

gismo_payloads <- list()

for (study_dir in names(latest_date_dirs)) {
  latest_dir <- latest_date_dirs[study_dir]
  study_id <- basename(dirname(study_dir))

  bndl <- bundle_dir(latest_dir)

  # 1. deploy app
  res <- connectapi::deploy(client, bndl, name = study_id)
  poll_task(res)

  # 2. adjust user access
  headers <- add_headers(
    Authorization = paste("Key", Sys.getenv("CONNECT_API_KEY")),
    "Content-Type" = "application/json"
  )

  payload <- list(
    run_as_current_user = TRUE
  )

  guid <- res$get_content()$guid

  response <- PATCH(
    url = paste0(server, "/__api__/v1/content/", guid),
    body = jsonlite::toJSON(payload, auto_unbox = TRUE),
    config = headers
  )

  # 3. prep api payload
  app_url <- res$get_content()$url

  gismo_payloads[[length(gismo_payloads) + 1]] <- list(
    studyId = study_id,
    slug = 'Deep Dive App',
    title = 'deep-dive-app',
    assetUrl = app_url
  )
}

output_file <- "post_requests.R"
writeLines("library(httr)\n\nurl <- 'http://localhost:55717/api/module'\n", con = output_file)

for (payload in gismo_payloads) {
  script <- paste0(
    "payload <- list(\n",
    "  studyId = '", payload$studyId, "',\n",
    "  slug = '", payload$slug, "',\n",
    "  title = '", payload$title, "',\n",
    "  assetUrl = '", payload$assetUrl, "'\n",
    ")\n\n",
    "response <- POST(\n",
    "  url = url,\n",
    "  body = jsonlite::toJSON(payload, auto_unbox = TRUE),\n",
    "  encode = \"json\",\n",
    "  content_type(\"application/json\")\n",
    ")"
  )

  cat(script, file = output_file, append = TRUE, sep = "\n")
}

