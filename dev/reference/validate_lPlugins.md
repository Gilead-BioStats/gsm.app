# Confirm that an object is valid lPlugins

Confirm that an object is valid lPlugins

## Usage

``` r
validate_lPlugins(lPlugins, envCall = rlang::caller_env())
```

## Arguments

- lPlugins:

  `list` Optional list of plugins to include in the app.

- envCall:

  `environment` The environment from which this function was called, for
  use in better error messages. This value should usually be left as the
  default, or passed from the calling function if the calling function
  also has an `envCall` argument.

## Value

`lPlugins` with normalized names.
