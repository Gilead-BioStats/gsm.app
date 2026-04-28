# Validate Plugin Definition Meta

Validate Plugin Definition Meta

## Usage

``` r
plugin_ValidateMeta(lPluginMeta, envCall = rlang::caller_env())
```

## Arguments

- lPluginMeta:

  `list` The plugin metadata.

- envCall:

  `environment` The environment from which this function was called, for
  use in better error messages. This value should usually be left as the
  default, or passed from the calling function if the calling function
  also has an `envCall` argument.

## Value

The validated `lPlugin$meta`.
