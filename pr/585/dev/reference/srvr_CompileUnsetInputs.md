# Figure out which required inputs aren't available

Figure out which required inputs aren't available

## Usage

``` r
srvr_CompileUnsetInputs(chrRequiredInputs, l_rctvInputs, chrInputNamesPretty)
```

## Arguments

- chrRequiredInputs:

  `character` An optional vector of any inputs ("metric", "group",
  "group level", "participant", or "domain") that must have a non-empty
  value before the plugin can load. "None" and "All" count as "empty"
  for this check. If the user has not set a value for that input, the
  app will display a placeholder instructing the user to make a
  selection.

- l_rctvInputs:

  `list` A named list of
  [`shiny::reactiveVal()`](https://rdrr.io/pkg/shiny/man/reactiveVal.html)
  objects, each of which returns the current value of an input or
  input-like variable.

- chrInputNamesPretty:

  `character` A vector of names to display for missing inputs.

## Value

A character vector of missing inputs.
