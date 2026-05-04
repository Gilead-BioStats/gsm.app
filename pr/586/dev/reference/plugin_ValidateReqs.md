# Validate Plugin Definition Required Inputs

Validate Plugin Definition Required Inputs

## Usage

``` r
plugin_ValidateReqs(chrRequiredInputs, envCall = rlang::caller_env())
```

## Arguments

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

The validated `lPlugin$required_inputs`.
