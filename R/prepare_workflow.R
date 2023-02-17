#' Prepare {gsm} workflow for Ingestion by {safetyGraphics}
#'
#' Define a chart object with the format expected by {safetyGraphics}, including required data
#' domains, the charting function, and relevnat metadata.
#'
#' @param domain `character` name of data domain associated with workflow
#' @param yaml_file `character` file path of .yaml file containing workflow metadata
#' @param meta `data.frame` metadata returned by [map_metadata()]
#' @param workflows `data.frame` metadata returned by [map_metadata()]
#'
#' @importFrom glue glue
#' @importFrom purrr keep map_chr
#' @importFrom safetyGraphics prepareChart
#' @importFrom yaml read_yaml
#'
#' @export

prepare_workflow <- function(
    workflow_id,
    workflow = yaml::read_yaml(
        system.file(
            'workflow',
            glue::glue('{workflow_id}.yaml'),
            package = 'gsm'
        )
    ),
    meta = gsmApp::meta_data_frame
    #workflows = get_metadata_from_yaml('workflows')
) {
    stopifnot(
        # type checks
        # '[ domain ] is not a character value' = is.character(domain),
        '[ workflow_id ] is not a character value' = is.character(workflow_id),
        '[ workflow ] is not a list' = is.list(workflow),
        '[ meta ] is not a data frame' = is.data.frame(meta)

        # logic checks
        # '[ domain ] not found in [ meta ]' = domain %in% sub('^df', '', unique(meta$domain)),
        # '[ yaml_file ] does not exist' = file.exists(yaml_file)
        # '[ domain ] not found in [ workflows ]' = domain %in% (workflows %>% purrr::map_chr(~.x$workflow))
    )

    workflow_meta <- gsm::meta_workflow %>%
        filter(
            .data$workflowid == workflow_id
        )

    workflow$label <- workflow_meta$metric
    workflow$name <- workflow_id
    workflow$step_name <- workflow$steps %>%
        map_chr(~.x$name)
    workflow$step_inputs <- workflow$steps %>%
        map_chr(~paste(.x$inputs, collapse = ' '))
    workflow$step_output <- workflow$steps %>%
        map_chr(~.x$output)
    workflow$domain <- workflow$step_inputs[
        workflow$step_output == 'dfInput'
    ] %>% stringr::str_split_1(' ')

    workflow$ui <- make_workflow_ui(workflow)
    assign(glue::glue('{workflow_id}_ui'), workflow$ui, envir = .GlobalEnv)

    workflow$server <- make_workflow_server(workflow)
    assign(glue::glue('{workflow_id}_server'), workflow$server, envir = .GlobalEnv)

    workflow_yaml <- glue::glue('
env: "safetyGraphics"
label: "{workflow$label}"
name: "{workflow$name}"
type: "module"
package: "gsmApp"
domain:
  - "{paste(workflow$domain, collapse = \'"\n  - "\')}"
workflow:
  ui: "{workflow_id}_ui"
  server: "{workflow_id}_server"
links:
  gsm: "https://github.com/Gilead-BioStats/gsm"
  gsmApp: "https://github.com/Gilead-BioStats/gsmApp"
')

    prepareChart(
        yaml::read_yaml(text = workflow_yaml)
    )
}
