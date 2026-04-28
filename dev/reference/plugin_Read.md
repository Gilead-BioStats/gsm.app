# Read a Plugin Definition

Plugins are defined by a named `list` with elements `meta` (containing
at least a `Name` to show in the plugin menu), `shiny` (containing `UI`
and `Server` fields to define the Shiny UI and Server functions for the
plugin), and `spec` (a specification of the data domains that the plugin
uses), plus optional fields `packages`, and `required_inputs`. Use
`plugin_Read()` to read these element definitions and any R files in the
same directory. and `spec` (a specification of the data domains that the
plugin uses), plus optional fields `packages`, and `required_inputs`.
Use `plugin_Read()` to read these element definitions and any R files in
the same directory.

## Usage

``` r
plugin_Read(strPath, lWorkflows = list(), ...)
```

## Arguments

- strPath:

  The directory that contains the plugin.

- lWorkflows:

  `list` An optional named list of workflows to run in order to
  translate app domain data into the format required by the plugin (as
  defined in the plugin `spec`). These workflows are ran before the
  plugin's `spec` is applied, and are meant to serve as a bridge between
  your domain data and the plugin's expected domains.

- ...:

  Additional named arguments passed on to `fnShinyUI` and/or
  `fnShinyServer` by name.

## Value

A `list` with elements `meta`, `shiny`, `spec`, `workflows`, `config`,
`required_inputs`, and `packages`, read from the YAML file in `strPath`.
As a side effect, any `R` files in `strPath` are also loaded using
[`source()`](https://rdrr.io/r/base/source.html).

## Examples

``` r
subjPlugin <- plugin_Read(
  system.file("plugins", "ParticipantProfile", package = "gsm.app")
)
subjPlugin
#> $meta
#> $meta$Type
#> [1] "Plugin"
#> 
#> $meta$ID
#> [1] "ParticipantProfile"
#> 
#> $meta$Name
#> [1] "Participant Profile"
#> 
#> 
#> $shiny
#> $shiny$UI
#> [1] "mod_ParticipantProfile_UI"
#> 
#> $shiny$Server
#> [1] "mod_ParticipantProfile_Server"
#> 
#> 
#> $spec
#> $spec$SUBJ
#> $spec$SUBJ$`_all`
#> $spec$SUBJ$`_all`$required
#> [1] TRUE
#> 
#> 
#> 
#> $spec$AE
#> $spec$AE$SubjectID
#> $spec$AE$SubjectID$type
#> [1] "character"
#> 
#> 
#> 
#> $spec$ENROLL
#> $spec$ENROLL$SubjectID
#> $spec$ENROLL$SubjectID$type
#> [1] "character"
#> 
#> 
#> 
#> $spec$STUDCOMP
#> $spec$STUDCOMP$SubjectID
#> $spec$STUDCOMP$SubjectID$type
#> [1] "character"
#> 
#> 
#> 
#> 
#> $required_inputs
#> [1] "participant"
#> 
#> $packages
#> list()
#> 
#> $workflows
#> list()
#> 
#> $config
#> list()
#> 
```
