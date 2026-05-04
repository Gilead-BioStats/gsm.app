# Define a plugin

Define a plugin

## Usage

``` r
plugin_Define(
  strName,
  lSpec,
  fnShinyUI,
  fnShinyServer,
  ...,
  lWorkflows = list(),
  chrRequiredInputs = character(),
  envCall = rlang::caller_env()
)
```

## Arguments

- strName:

  `length-1 character` The name of the plugin, as it will display to the
  user in the menu of tabs and plugins.

- lSpec:

  `list` A named list defining the data domains required by the plugin,
  where the names are the names of the domains and the elements are
  column definitions.

- fnShinyUI:

  `function or character` A shiny module UI function for the plugin, or
  the name of such a function in the current session.

- fnShinyServer:

  `function or character` A shiny module server function for the plugin,
  or the name of such a function in the current session.

- ...:

  Additional named arguments passed on to `fnShinyUI` and/or
  `fnShinyServer` by name.

- lWorkflows:

  `list` An optional named list of workflows to run in order to
  translate app domain data into the format required by the plugin (as
  defined in the plugin `spec`). These workflows are ran before the
  plugin's `spec` is applied, and are meant to serve as a bridge between
  your domain data and the plugin's expected domains.

- chrRequiredInputs:

  `character` An optional vector of any inputs ("metric", "group",
  "group level", "participant", or "domain") that must have a non-empty
  value before the plugin can load. "None" and "All" count as "empty"
  for this check. If the user has not set a value for that input, the
  app will display a placeholder instructing the user to make a
  selection.

- envCall:

  `environment` The environment from which this function was called, for
  use in better error messages. This value should usually be left as the
  default, or passed from the calling function if the calling function
  also has an `envCall` argument.

## Value

A `list` with elements `meta`, `shiny`, `spec`, `workflows`, `config`,
`required_inputs`, and `packages`.

## Examples

``` r
aePlugin <- plugin_Define(
  strName = "Adverse Events",
  lSpec = list("AE" = list(), "SUBJ" = list()),
  fnShinyUI = "mod_AE_UI",
  fnShinyServer = "mod_AE_Server"
)
aePlugin
#> $meta
#> $meta$Name
#> [1] "Adverse Events"
#> 
#> 
#> $shiny
#> $shiny$UI
#> [1] "mod_AE_UI"
#> 
#> $shiny$Server
#> [1] "mod_AE_Server"
#> 
#> 
#> $spec
#> $spec$AE
#> list()
#> 
#> $spec$SUBJ
#> list()
#> 
#> 
#> $packages
#> list()
#> 
#> $required_inputs
#> character(0)
#> 
#> $workflows
#> list()
#> 
#> $config
#> list()
#> 
```
