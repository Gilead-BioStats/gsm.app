# Validate Plugin Definition Shiny

Validate Plugin Definition Shiny

## Usage

``` r
plugin_ValidateShiny(lPluginShiny, envCall = rlang::caller_env())
```

## Arguments

- lPluginShiny:

  `list` The UI and Server function of the plugin.

- envCall:

  `environment` The environment from which this function was called, for
  use in better error messages. This value should usually be left as the
  default, or passed from the calling function if the calling function
  also has an `envCall` argument.

## Value

The validated `lPlugin$shiny`.
