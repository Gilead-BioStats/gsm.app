# Server side of the plot part of the prevalence plot module

Server side of the plot part of the prevalence plot module

## Usage

``` r
mod_PrevalencePlot_Server(id, rctv_dfDomain_Combined, rctv_strCategory)
```

## Arguments

- id:

  `character` The id for this element.

- rctv_dfDomain_Combined:

  `reactive dataframe` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns a study-, group-, and/or participant-level domain
  dataframe.

- rctv_strCategory:

  `reactive character` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the currently selected category.
