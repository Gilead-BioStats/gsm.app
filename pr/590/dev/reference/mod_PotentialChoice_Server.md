# Potential Choice Select Input Server

Manages the state of a select input that may or may not be rendered in
the UI.

## Usage

``` r
mod_PotentialChoice_Server(id, chrChoices, rctv_strSelection)
```

## Arguments

- id:

  `character` The id for this element.

- chrChoices:

  `character` A (named, optionally) vector of choices for this input.

- rctv_strSelection:

  `reactiveVal` A `reactiveVal` from the parent scope that this module
  will update with its selection.

## Value

No returns, but this server creates
[`shiny::observe()`](https://rdrr.io/pkg/shiny/man/observe.html)
elements to keep inputs in sync.
