# Read a Plugin YAML

Read a Plugin YAML

## Usage

``` r
plugin_ReadYamlFile(chrPluginFiles, envCall = rlang::caller_env())
```

## Arguments

- chrPluginFiles:

  `character` The files in a plugin directory.

- envCall:

  `environment` The environment from which this function was called, for
  use in better error messages. This value should usually be left as the
  default, or passed from the calling function if the calling function
  also has an `envCall` argument.

## Value

A list with a potential plugin definition.
