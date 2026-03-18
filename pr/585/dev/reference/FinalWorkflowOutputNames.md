# Find the Names of the Final Steps

Find the Names of the Final Steps

## Usage

``` r
FinalWorkflowOutputNames(lWorkflows)
```

## Arguments

- lWorkflows:

  `list` An optional named list of workflows to run in order to
  translate app domain data into the format required by the plugin (as
  defined in the plugin `spec`). These workflows are ran before the
  plugin's `spec` is applied, and are meant to serve as a bridge between
  your domain data and the plugin's expected domains.

## Value

A character vector of
[`FinalWorkflowOutputName()`](https://gilead-biostats.github.io/gsm.app/dev/reference/FinalWorkflowOutputName.md)
output.
