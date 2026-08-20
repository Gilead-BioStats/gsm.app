# Validate Plugin Definition Packages

Validate Plugin Definition Packages

## Usage

``` r
plugin_ValidatePackages(lPluginPackages, envCall = rlang::caller_env())
```

## Arguments

- lPluginPackages:

  `list` The names and sources of packages used by the plugin.

- envCall:

  `environment` The environment from which this function was called, for
  use in better error messages. This value should usually be left as the
  default, or passed from the calling function if the calling function
  also has an `envCall` argument.

## Value

The validated `lPlugin$packages`.
