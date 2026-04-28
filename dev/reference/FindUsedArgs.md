# Subset Available Args to Server Function Needs

Subset Available Args to Server Function Needs

## Usage

``` r
FindUsedArgs(lAvailableArgs, chrServerArgs)
```

## Arguments

- lAvailableArgs:

  `list` The args available to send to the plugin.

- chrServerArgs:

  `character` The vector of arguments accepted by the plugin function.

## Value

A `list` that is a subset of `lAvailableArgs` (only those used by the
function), renamed to match the function.
